package net.calit2.archaeology.database

class OtherBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=OtherBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, OtherBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from OtherBulk x where x.site.id = ${session.site}"
            def resultCount = OtherBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from OtherBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from OtherBulk as x where x.site.id = ${session.site}"
            }
            def result = OtherBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [otherBulkInstanceList: result, otherBulkInstanceTotal: resultCount[0]]
        } else {
            [otherBulkInstanceList: OtherBulk.list(params), otherBulkInstanceTotal: OtherBulk.count()]
        }
    }

    def create = {
        def otherBulkInstance = new OtherBulk()
        otherBulkInstance.properties = params
        return [otherBulkInstance: otherBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Other"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def otherBulkInstance = new OtherBulk(params)

        // Calculate dependent values
        otherBulkInstance.setStorageFromCrate()
//        otherBulkInstance.setTotalCountAndWeight()

        if (otherBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), otherBulkInstance.id])}"
            redirect(action: "show", id: otherBulkInstance.id)
        }
        else {
            render(view: "create", model: [otherBulkInstance: otherBulkInstance])
        }
    }

    def show = {
        def otherBulkInstance = OtherBulk.get(params.id)
        if (!otherBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [otherBulkInstance: otherBulkInstance]
        }
    }

    def edit = {
        def otherBulkInstance = OtherBulk.get(params.id)
        if (!otherBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [otherBulkInstance: otherBulkInstance]
        }
    }

    def update = {
        def otherBulkInstance = OtherBulk.get(params.id)
        if (otherBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (otherBulkInstance.version > version) {
                    
                    otherBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'otherBulk.label', default: 'OtherBulk')] as Object[], "Another user has updated this OtherBulk while you were editing")
                    render(view: "edit", model: [otherBulkInstance: otherBulkInstance])
                    return
                }
            }
            otherBulkInstance.properties = params

            // Calculate dependent values
            otherBulkInstance.setStorageFromCrate()
//            otherBulkInstance.setTotalCountAndWeight()

            if (!otherBulkInstance.hasErrors() && otherBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), otherBulkInstance.id])}"
                redirect(action: "show", id: otherBulkInstance.id)
            }
            else {
                render(view: "edit", model: [otherBulkInstance: otherBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def otherBulkInstance = OtherBulk.get(params.id)
        if (otherBulkInstance) {
            try {
                otherBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'otherBulk.label', default: 'OtherBulk'), params.id])}"
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
            results = OtherBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[otherBulkInstanceList:results, otherBulkInstanceTotal: resultsNum])
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
