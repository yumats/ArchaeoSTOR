package net.calit2.archaeology.database

class BeadBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=BeadBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, BeadBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from BeadBulk x where x.site.id = ${session.site}"
            def resultCount = BeadBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from BeadBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from BeadBulk as x where x.site.id = ${session.site}"
            }
            def result = BeadBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [beadBulkInstanceList: result, beadBulkInstanceTotal: resultCount[0]]
        } else {
            [beadBulkInstanceList: BeadBulk.list(params), beadBulkInstanceTotal: BeadBulk.count()]
        }
    }

    def create = {
        def beadBulkInstance = new BeadBulk()
        beadBulkInstance.properties = params
        return [beadBulkInstance: beadBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", "")
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def beadBulkInstance = new BeadBulk(params)

        // Calculate dependent values
        beadBulkInstance.setStorageFromCrate()
//        beadBulkInstance.setTotalCountAndWeight()

        if (beadBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), beadBulkInstance.id])}"
            redirect(action: "show", id: beadBulkInstance.id)
        }
        else {
            render(view: "create", model: [beadBulkInstance: beadBulkInstance])
        }
    }

    def show = {
        def beadBulkInstance = BeadBulk.get(params.id)
        if (!beadBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [beadBulkInstance: beadBulkInstance]
        }
    }

    def edit = {
        def beadBulkInstance = BeadBulk.get(params.id)
        if (!beadBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [beadBulkInstance: beadBulkInstance]
        }
    }

    def update = {
        def beadBulkInstance = BeadBulk.get(params.id)
        if (beadBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (beadBulkInstance.version > version) {
                    
                    beadBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'beadBulk.label', default: 'BeadBulk')] as Object[], "Another user has updated this BeadBulk while you were editing")
                    render(view: "edit", model: [beadBulkInstance: beadBulkInstance])
                    return
                }
            }
            beadBulkInstance.properties = params

            // Calculate dependent values
            beadBulkInstance.setStorageFromCrate()
//            beadBulkInstance.setTotalCountAndWeight()

            if (!beadBulkInstance.hasErrors() && beadBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), beadBulkInstance.id])}"
                redirect(action: "show", id: beadBulkInstance.id)
            }
            else {
                render(view: "edit", model: [beadBulkInstance: beadBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def beadBulkInstance = BeadBulk.get(params.id)
        if (beadBulkInstance) {
            try {
                beadBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'beadBulk.label', default: 'BeadBulk'), params.id])}"
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
            results = BeadBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[beadBulkInstanceList:results, beadBulkInstanceTotal: resultsNum])
    }

    def print = {
        def artifact = Artifact.get(params.id)
        if (artifact) {
            new BarcodeService().printArtifact(artifact, response)
        } else {
            redirect(action: "show", params: [id: params.id])
        }
    }

    def printAllDiagnostics = {
        def artifact = Artifact.get(params.id)
        if (artifact.diagnostics) {
            new BarcodeService().printAllDiagnostics(artifact.diagnostics, response)
        } else {
            redirect(action: "edit", params:[id: params.id])
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
