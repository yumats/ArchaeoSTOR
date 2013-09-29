package net.calit2.archaeology.database

class GroundStoneBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=GroundStoneBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, GroundStoneBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from GroundStoneBulk x where x.site.id = ${session.site}"
            def resultCount = GroundStoneBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from GroundStoneBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from GroundStoneBulk as x where x.site.id = ${session.site}"
            }
            def result = GroundStoneBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [groundStoneBulkInstanceList: result, groundStoneBulkInstanceTotal: resultCount[0]]
        } else {
            [groundStoneBulkInstanceList: GroundStoneBulk.list(params), groundStoneBulkInstanceTotal: GroundStoneBulk.count()]
        }
    }

    def create = {
        def groundStoneBulkInstance = new GroundStoneBulk()
        groundStoneBulkInstance.properties = params
        return [groundStoneBulkInstance: groundStoneBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["GroundStone"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def groundStoneBulkInstance = new GroundStoneBulk(params)

        // Calculate dependent values
        groundStoneBulkInstance.setStorageFromCrate()
        groundStoneBulkInstance.setTotalCountAndWeight()

        if (groundStoneBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), groundStoneBulkInstance.id])}"
            redirect(action: "show", id: groundStoneBulkInstance.id)
        }
        else {
            render(view: "create", model: [groundStoneBulkInstance: groundStoneBulkInstance])
        }
    }

    def show = {
        def groundStoneBulkInstance = GroundStoneBulk.get(params.id)
        if (!groundStoneBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groundStoneBulkInstance: groundStoneBulkInstance]
        }
    }

    def edit = {
        def groundStoneBulkInstance = GroundStoneBulk.get(params.id)
        if (!groundStoneBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groundStoneBulkInstance: groundStoneBulkInstance]
        }
    }

    def update = {
        def groundStoneBulkInstance = GroundStoneBulk.get(params.id)
        if (groundStoneBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groundStoneBulkInstance.version > version) {
                    
                    groundStoneBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk')] as Object[], "Another user has updated this GroundStoneBulk while you were editing")
                    render(view: "edit", model: [groundStoneBulkInstance: groundStoneBulkInstance])
                    return
                }
            }
            groundStoneBulkInstance.properties = params

            // Calculate dependent values
            groundStoneBulkInstance.setStorageFromCrate()
            groundStoneBulkInstance.setTotalCountAndWeight()

            if (!groundStoneBulkInstance.hasErrors() && groundStoneBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), groundStoneBulkInstance.id])}"
                redirect(action: "show", id: groundStoneBulkInstance.id)
            }
            else {
                render(view: "edit", model: [groundStoneBulkInstance: groundStoneBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groundStoneBulkInstance = GroundStoneBulk.get(params.id)
        if (groundStoneBulkInstance) {
            try {
                groundStoneBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk'), params.id])}"
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
            results = GroundStoneBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[groundStoneBulkInstanceList:results, groundStoneBulkInstanceTotal: resultsNum])
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
