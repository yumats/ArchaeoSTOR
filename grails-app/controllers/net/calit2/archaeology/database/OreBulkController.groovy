package net.calit2.archaeology.database

class OreBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=OreBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, OreBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from OreBulk x where x.site.id = ${session.site}"
            def resultCount = OreBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from OreBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from OreBulk as x where x.site.id = ${session.site}"
            }
            def result = OreBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [oreBulkInstanceList: result, oreBulkInstanceTotal: resultCount[0]]
        } else {
            [oreBulkInstanceList: OreBulk.list(params), oreBulkInstanceTotal: OreBulk.count()]
        }
    }

    def create = {
        def oreBulkInstance = new OreBulk()
        oreBulkInstance.properties = params
        return [oreBulkInstance: oreBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Ore"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def oreBulkInstance = new OreBulk(params)

        // Calculate dependent values
        oreBulkInstance.setStorageFromCrate()
        oreBulkInstance.setTotalCountAndWeight()

        if (oreBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), oreBulkInstance.id])}"
            redirect(action: "show", id: oreBulkInstance.id)
        }
        else {
            render(view: "create", model: [oreBulkInstance: oreBulkInstance])
        }
    }

    def show = {
        def oreBulkInstance = OreBulk.get(params.id)
        if (!oreBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [oreBulkInstance: oreBulkInstance]
        }
    }

    def edit = {
        def oreBulkInstance = OreBulk.get(params.id)
        if (!oreBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [oreBulkInstance: oreBulkInstance]
        }
    }

    def update = {
        def oreBulkInstance = OreBulk.get(params.id)
        if (oreBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (oreBulkInstance.version > version) {
                    
                    oreBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'oreBulk.label', default: 'OreBulk')] as Object[], "Another user has updated this OreBulk while you were editing")
                    render(view: "edit", model: [oreBulkInstance: oreBulkInstance])
                    return
                }
            }
            oreBulkInstance.properties = params

            // Calculate dependent values
            oreBulkInstance.setStorageFromCrate()
            oreBulkInstance.setTotalCountAndWeight()

            if (!oreBulkInstance.hasErrors() && oreBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), oreBulkInstance.id])}"
                redirect(action: "show", id: oreBulkInstance.id)
            }
            else {
                render(view: "edit", model: [oreBulkInstance: oreBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def oreBulkInstance = OreBulk.get(params.id)
        if (oreBulkInstance) {
            try {
                oreBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oreBulk.label', default: 'OreBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def search = {
        return create()
    }

    def query = {
        def condition = [:]
        params.each { key, value ->
            if (value && !(value instanceof Map)) {
                if (!key.startsWith("_") && key != "action" && key != "controller") {
                    if (key.endsWith("id")) {
                        condition.put(key, value as Long)
                    } else if (key == "year" || key.startsWith("Count") || key.startsWith("count")) {
                        condition.put(key, value as Integer)
                    } else if (key.startsWith("Weight") || key.startsWith("weight")) {
                        condition.put(key, value as BigDecimal)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = OreBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[oreBulkInstanceList:results, oreBulkInstanceTotal: resultsNum])
    }

    def print = {
        def artifact = Artifact.get(params.id)
        if (artifact) {
            new BarcodeService().printArtifact(artifact, response)
        } else {
            redirect(action: "show", params: params)
        }
    }

    def printAllDiagnostics = {
        def artifact = Artifact.get(params.id)
        if (artifact.diagnostics) {
            new BarcodeService().printAllDiagnostics(artifact.diagnostics, response)
        } else {
            redirect(action: "show", params: params)
        }
    }

    def getArchData = {
        def archService = new ArchDataService()
        def values = archService.getDataWithBarcode(params.barcode)
        if (values) {
            values.each { key, value ->
                params.put(key, value)
            }
            redirect(action: "create", params: params)
        } else {
            flash.message = "Cannot find data in ArchField"
            redirect(action: "create")
        }
    }
}
