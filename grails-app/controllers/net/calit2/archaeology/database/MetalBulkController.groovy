package net.calit2.archaeology.database

class MetalBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=MetalBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, MetalBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from MetalBulk x where x.site.id = ${session.site}"
            def resultCount = MetalBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from MetalBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from MetalBulk as x where x.site.id = ${session.site}"
            }
            def result = MetalBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [metalBulkInstanceList: result, metalBulkInstanceTotal: resultCount[0]]
        } else {
            [metalBulkInstanceList: MetalBulk.list(params), metalBulkInstanceTotal: MetalBulk.count()]
        }
    }

    def create = {
        def metalBulkInstance = new MetalBulk()
        metalBulkInstance.properties = params
        return [metalBulkInstance: metalBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Metal"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def metalBulkInstance = new MetalBulk(params)

        // Calculate dependent values
        metalBulkInstance.setStorageFromCrate()
        metalBulkInstance.setTotalCountAndWeight()

        if (metalBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), metalBulkInstance.id])}"
            redirect(action: "show", id: metalBulkInstance.id)
        }
        else {
            render(view: "create", model: [metalBulkInstance: metalBulkInstance])
        }
    }

    def show = {
        def metalBulkInstance = MetalBulk.get(params.id)
        if (!metalBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [metalBulkInstance: metalBulkInstance]
        }
    }

    def edit = {
        def metalBulkInstance = MetalBulk.get(params.id)
        if (!metalBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [metalBulkInstance: metalBulkInstance]
        }
    }

    def update = {
        def metalBulkInstance = MetalBulk.get(params.id)
        if (metalBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (metalBulkInstance.version > version) {
                    
                    metalBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'metalBulk.label', default: 'MetalBulk')] as Object[], "Another user has updated this MetalBulk while you were editing")
                    render(view: "edit", model: [metalBulkInstance: metalBulkInstance])
                    return
                }
            }
            metalBulkInstance.properties = params

            // Calculate dependent values
            metalBulkInstance.setStorageFromCrate()
            metalBulkInstance.setTotalCountAndWeight()

            if (!metalBulkInstance.hasErrors() && metalBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), metalBulkInstance.id])}"
                redirect(action: "show", id: metalBulkInstance.id)
            }
            else {
                render(view: "edit", model: [metalBulkInstance: metalBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def metalBulkInstance = MetalBulk.get(params.id)
        if (metalBulkInstance) {
            try {
                metalBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'metalBulk.label', default: 'MetalBulk'), params.id])}"
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
            results = MetalBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[metalBulkInstanceList:results, metalBulkInstanceTotal: resultsNum])
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
