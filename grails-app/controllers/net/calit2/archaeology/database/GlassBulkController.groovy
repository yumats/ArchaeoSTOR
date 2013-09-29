package net.calit2.archaeology.database

class GlassBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=GlassBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, GlassBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from GlassBulk x where x.site.id = ${session.site}"
            def resultCount = GlassBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from GlassBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from GlassBulk as x where x.site.id = ${session.site}"
            }
            def result = GlassBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [glassBulkInstanceList: result, glassBulkInstanceTotal: resultCount[0]]
        } else {
            [glassBulkInstanceList: GlassBulk.list(params), glassBulkInstanceTotal: GlassBulk.count()]
        }
    }

    def create = {
        def glassBulkInstance = new GlassBulk()
        glassBulkInstance.properties = params
        return [glassBulkInstance: glassBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Glass"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def glassBulkInstance = new GlassBulk(params)

        // Calculate dependent values
        glassBulkInstance.setStorageFromCrate()
        glassBulkInstance.setTotalCountAndWeight()

        if (glassBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), glassBulkInstance.id])}"
            redirect(action: "show", id: glassBulkInstance.id)
        }
        else {
            render(view: "create", model: [glassBulkInstance: glassBulkInstance])
        }
    }

    def show = {
        def glassBulkInstance = GlassBulk.get(params.id)
        if (!glassBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [glassBulkInstance: glassBulkInstance]
        }
    }

    def edit = {
        def glassBulkInstance = GlassBulk.get(params.id)
        if (!glassBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [glassBulkInstance: glassBulkInstance]
        }
    }

    def update = {
        def glassBulkInstance = GlassBulk.get(params.id)
        if (glassBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (glassBulkInstance.version > version) {
                    
                    glassBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'glassBulk.label', default: 'GlassBulk')] as Object[], "Another user has updated this GlassBulk while you were editing")
                    render(view: "edit", model: [glassBulkInstance: glassBulkInstance])
                    return
                }
            }
            glassBulkInstance.properties = params

            // Calculate dependent values
            glassBulkInstance.setStorageFromCrate()
            glassBulkInstance.setTotalCountAndWeight()

            if (!glassBulkInstance.hasErrors() && glassBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), glassBulkInstance.id])}"
                redirect(action: "show", id: glassBulkInstance.id)
            }
            else {
                render(view: "edit", model: [glassBulkInstance: glassBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def glassBulkInstance = GlassBulk.get(params.id)
        if (glassBulkInstance) {
            try {
                glassBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glassBulk.label', default: 'GlassBulk'), params.id])}"
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
                    } else if (key == "year" || key.endsWith("Count") || key.endsWith("count")) {
                        condition.put(key, value as Integer)
                    } else if (key.endsWith("Weight") || key.endsWith("weight")) {
                        condition.put(key, value as BigDecimal)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = GlassBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[glassBulkInstanceList:results, glassBulkInstanceTotal: resultsNum])
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
