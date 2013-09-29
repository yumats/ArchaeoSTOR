package net.calit2.archaeology.database

class LithicsBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=LithicsBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, LithicsBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from LithicsBulk x where x.site.id = ${session.site}"
            def resultCount = LithicsBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from LithicsBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from LithicsBulk as x where x.site.id = ${session.site}"
            }
            def result = LithicsBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [lithicsBulkInstanceList: result, lithicsBulkInstanceTotal: resultCount[0]]
        } else {
            [lithicsBulkInstanceList: LithicsBulk.list(params), lithicsBulkInstanceTotal: LithicsBulk.count()]
        }
    }

    def create = {
        def lithicsBulkInstance = new LithicsBulk()
        lithicsBulkInstance.properties = params
        return [lithicsBulkInstance: lithicsBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Lithics"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def lithicsBulkInstance = new LithicsBulk(params)

        // Calculate dependent values
        lithicsBulkInstance.setStorageFromCrate()
        lithicsBulkInstance.setTotalCountAndWeight()

        if (lithicsBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), lithicsBulkInstance.id])}"
            redirect(action: "show", id: lithicsBulkInstance.id)
        }
        else {
            render(view: "create", model: [lithicsBulkInstance: lithicsBulkInstance])
        }
    }

    def show = {
        def lithicsBulkInstance = LithicsBulk.get(params.id)
        if (!lithicsBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lithicsBulkInstance: lithicsBulkInstance]
        }
    }

    def edit = {
        def lithicsBulkInstance = LithicsBulk.get(params.id)
        if (!lithicsBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lithicsBulkInstance: lithicsBulkInstance]
        }
    }

    def update = {
        def lithicsBulkInstance = LithicsBulk.get(params.id)
        if (lithicsBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lithicsBulkInstance.version > version) {
                    
                    lithicsBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lithicsBulk.label', default: 'LithicsBulk')] as Object[], "Another user has updated this LithicsBulk while you were editing")
                    render(view: "edit", model: [lithicsBulkInstance: lithicsBulkInstance])
                    return
                }
            }
            lithicsBulkInstance.properties = params

            // Calculate dependent values
            lithicsBulkInstance.setStorageFromCrate()
            lithicsBulkInstance.setTotalCountAndWeight()

            if (!lithicsBulkInstance.hasErrors() && lithicsBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), lithicsBulkInstance.id])}"
                redirect(action: "show", id: lithicsBulkInstance.id)
            }
            else {
                render(view: "edit", model: [lithicsBulkInstance: lithicsBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lithicsBulkInstance = LithicsBulk.get(params.id)
        if (lithicsBulkInstance) {
            try {
                lithicsBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lithicsBulk.label', default: 'LithicsBulk'), params.id])}"
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
            results = LithicsBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[lithicsBulkInstanceList:results, lithicsBulkInstanceTotal: resultsNum])
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
