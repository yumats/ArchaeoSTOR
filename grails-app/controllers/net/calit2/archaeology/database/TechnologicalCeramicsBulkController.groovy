package net.calit2.archaeology.database

class TechnologicalCeramicsBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=TechnologicalCeramicsBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, TechnologicalCeramicsBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from TechnologicalCeramicsBulk x where x.site.id = ${session.site}"
            def resultCount = TechnologicalCeramicsBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from TechnologicalCeramicsBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from TechnologicalCeramicsBulk as x where x.site.id = ${session.site}"
            }
            def result = TechnologicalCeramicsBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [technologicalCeramicsBulkInstanceList: result, technologicalCeramicsBulkInstanceTotal: resultCount[0]]
        } else {
            [technologicalCeramicsBulkInstanceList: TechnologicalCeramicsBulk.list(params), technologicalCeramicsBulkInstanceTotal: TechnologicalCeramicsBulk.count()]
        }
    }

    def create = {
        def technologicalCeramicsBulkInstance = new TechnologicalCeramicsBulk()
        technologicalCeramicsBulkInstance.properties = params
        return [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["TechnologicalCeramics"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def technologicalCeramicsBulkInstance = new TechnologicalCeramicsBulk(params)

        // Calculate dependent values
        technologicalCeramicsBulkInstance.setStorageFromCrate()
        technologicalCeramicsBulkInstance.setTotalCountAndWeight()

        if (technologicalCeramicsBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), technologicalCeramicsBulkInstance.id])}"
            redirect(action: "show", id: technologicalCeramicsBulkInstance.id)
        }
        else {
            render(view: "create", model: [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance])
        }
    }

    def show = {
        def technologicalCeramicsBulkInstance = TechnologicalCeramicsBulk.get(params.id)
        if (!technologicalCeramicsBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance]
        }
    }

    def edit = {
        def technologicalCeramicsBulkInstance = TechnologicalCeramicsBulk.get(params.id)
        if (!technologicalCeramicsBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance]
        }
    }

    def update = {
        def technologicalCeramicsBulkInstance = TechnologicalCeramicsBulk.get(params.id)
        if (technologicalCeramicsBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (technologicalCeramicsBulkInstance.version > version) {
                    
                    technologicalCeramicsBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk')] as Object[], "Another user has updated this TechnologicalCeramicsBulk while you were editing")
                    render(view: "edit", model: [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance])
                    return
                }
            }
            technologicalCeramicsBulkInstance.properties = params

            // Calculate dependent values
            technologicalCeramicsBulkInstance.setStorageFromCrate()
            technologicalCeramicsBulkInstance.setTotalCountAndWeight()

            if (!technologicalCeramicsBulkInstance.hasErrors() && technologicalCeramicsBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), technologicalCeramicsBulkInstance.id])}"
                redirect(action: "show", id: technologicalCeramicsBulkInstance.id)
            }
            else {
                render(view: "edit", model: [technologicalCeramicsBulkInstance: technologicalCeramicsBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def technologicalCeramicsBulkInstance = TechnologicalCeramicsBulk.get(params.id)
        if (technologicalCeramicsBulkInstance) {
            try {
                technologicalCeramicsBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk'), params.id])}"
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
            results = TechnologicalCeramicsBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[technologicalCeramicsBulkInstanceList:results, technologicalCeramicsBulkInstanceTotal: resultsNum])
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
