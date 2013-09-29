package net.calit2.archaeology.database

class SlagBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=SlagBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, SlagBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from SlagBulk x where x.site.id = ${session.site}"
            def resultCount = SlagBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from SlagBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from SlagBulk as x where x.site.id = ${session.site}"
            }
            def result = SlagBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [slagBulkInstanceList: result, slagBulkInstanceTotal: resultCount[0]]
        } else {
            [slagBulkInstanceList: SlagBulk.list(params), slagBulkInstanceTotal: SlagBulk.count()]
        }
    }

    def create = {
        def slagBulkInstance = new SlagBulk()
        slagBulkInstance.properties = params
        return [slagBulkInstance: slagBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Slag"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def slagBulkInstance = new SlagBulk(params)

        // Calculate dependent values
        slagBulkInstance.setStorageFromCrate()
        slagBulkInstance.setTotalCountAndWeight()

        if (slagBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), slagBulkInstance.id])}"
            redirect(action: "show", id: slagBulkInstance.id)
        }
        else {
            render(view: "create", model: [slagBulkInstance: slagBulkInstance])
        }
    }

    def show = {
        def slagBulkInstance = SlagBulk.get(params.id)
        if (!slagBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [slagBulkInstance: slagBulkInstance]
        }
    }

    def edit = {
        def slagBulkInstance = SlagBulk.get(params.id)
        if (!slagBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [slagBulkInstance: slagBulkInstance]
        }
    }

    def update = {
        def slagBulkInstance = SlagBulk.get(params.id)
        if (slagBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (slagBulkInstance.version > version) {
                    
                    slagBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'slagBulk.label', default: 'SlagBulk')] as Object[], "Another user has updated this SlagBulk while you were editing")
                    render(view: "edit", model: [slagBulkInstance: slagBulkInstance])
                    return
                }
            }
            slagBulkInstance.properties = params

            // Calculate dependent values
            slagBulkInstance.setStorageFromCrate()
            slagBulkInstance.setTotalCountAndWeight()

            if (!slagBulkInstance.hasErrors() && slagBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), slagBulkInstance.id])}"
                redirect(action: "show", id: slagBulkInstance.id)
            }
            else {
                render(view: "edit", model: [slagBulkInstance: slagBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def slagBulkInstance = SlagBulk.get(params.id)
        if (slagBulkInstance) {
            try {
                slagBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'slagBulk.label', default: 'SlagBulk'), params.id])}"
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
            results = SlagBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[slagBulkInstanceList:results, slagBulkInstanceTotal: resultsNum])
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
