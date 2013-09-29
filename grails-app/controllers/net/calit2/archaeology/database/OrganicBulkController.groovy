package net.calit2.archaeology.database

class OrganicBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=OrganicBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, OrganicBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from OrganicBulk x where x.site.id = ${session.site}"
            def resultCount = OrganicBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from OrganicBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from OrganicBulk as x where x.site.id = ${session.site}"
            }
            def result = OrganicBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [organicBulkInstanceList: result, organicBulkInstanceTotal: resultCount[0]]
        } else {
            [organicBulkInstanceList: OrganicBulk.list(params), organicBulkInstanceTotal: OrganicBulk.count()]
        }
    }

    def create = {
        def organicBulkInstance = new OrganicBulk()
        organicBulkInstance.properties = params
        return [organicBulkInstance: organicBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Organic"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def organicBulkInstance = new OrganicBulk(params)

        // Calculate dependent values
        organicBulkInstance.setStorageFromCrate()
        organicBulkInstance.setTotalCountAndWeight()

        if (organicBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), organicBulkInstance.id])}"
            redirect(action: "show", id: organicBulkInstance.id)
        }
        else {
            render(view: "create", model: [organicBulkInstance: organicBulkInstance])
        }
    }

    def show = {
        def organicBulkInstance = OrganicBulk.get(params.id)
        if (!organicBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [organicBulkInstance: organicBulkInstance]
        }
    }

    def edit = {
        def organicBulkInstance = OrganicBulk.get(params.id)
        if (!organicBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [organicBulkInstance: organicBulkInstance]
        }
    }

    def update = {
        def organicBulkInstance = OrganicBulk.get(params.id)
        if (organicBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (organicBulkInstance.version > version) {
                    
                    organicBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'organicBulk.label', default: 'OrganicBulk')] as Object[], "Another user has updated this OrganicBulk while you were editing")
                    render(view: "edit", model: [organicBulkInstance: organicBulkInstance])
                    return
                }
            }
            organicBulkInstance.properties = params

            // Calculate dependent values
            organicBulkInstance.setStorageFromCrate()
            organicBulkInstance.setTotalCountAndWeight()

            if (!organicBulkInstance.hasErrors() && organicBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), organicBulkInstance.id])}"
                redirect(action: "show", id: organicBulkInstance.id)
            }
            else {
                render(view: "edit", model: [organicBulkInstance: organicBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def organicBulkInstance = OrganicBulk.get(params.id)
        if (organicBulkInstance) {
            try {
                organicBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'organicBulk.label', default: 'OrganicBulk'), params.id])}"
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
            results = OrganicBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[organicBulkInstanceList:results, organicBulkInstanceTotal: resultsNum])
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
