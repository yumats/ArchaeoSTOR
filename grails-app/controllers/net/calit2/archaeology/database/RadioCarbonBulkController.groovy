package net.calit2.archaeology.database

class RadioCarbonBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=RadioCarbonBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, RadioCarbonBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from RadioCarbonBulk x where x.site.id = ${session.site}"
            def resultCount = RadioCarbonBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from RadioCarbonBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from RadioCarbonBulk as x where x.site.id = ${session.site}"
            }
            def result = RadioCarbonBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [radioCarbonBulkInstanceList: result, radioCarbonBulkInstanceTotal: resultCount[0]]
        } else {
            [radioCarbonBulkInstanceList: RadioCarbonBulk.list(params), radioCarbonBulkInstanceTotal: RadioCarbonBulk.count()]
        }
    }

    def create = {
        def radioCarbonBulkInstance = new RadioCarbonBulk()
        radioCarbonBulkInstance.properties = params
        return [radioCarbonBulkInstance: radioCarbonBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["RadioCarbon"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def radioCarbonBulkInstance = new RadioCarbonBulk(params)

        // Calculate dependent values
        radioCarbonBulkInstance.setStorageFromCrate()
//        radioCarbonBulkInstance.setTotalCountAndWeight()

        if (radioCarbonBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), radioCarbonBulkInstance.id])}"
            redirect(action: "show", id: radioCarbonBulkInstance.id)
        }
        else {
            render(view: "create", model: [radioCarbonBulkInstance: radioCarbonBulkInstance])
        }
    }

    def show = {
        def radioCarbonBulkInstance = RadioCarbonBulk.get(params.id)
        if (!radioCarbonBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [radioCarbonBulkInstance: radioCarbonBulkInstance]
        }
    }

    def edit = {
        def radioCarbonBulkInstance = RadioCarbonBulk.get(params.id)
        if (!radioCarbonBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [radioCarbonBulkInstance: radioCarbonBulkInstance]
        }
    }

    def update = {
        def radioCarbonBulkInstance = RadioCarbonBulk.get(params.id)
        if (radioCarbonBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (radioCarbonBulkInstance.version > version) {
                    
                    radioCarbonBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk')] as Object[], "Another user has updated this RadioCarbonBulk while you were editing")
                    render(view: "edit", model: [radioCarbonBulkInstance: radioCarbonBulkInstance])
                    return
                }
            }
            radioCarbonBulkInstance.properties = params

            // Calculate dependent values
            radioCarbonBulkInstance.setStorageFromCrate()
//            radioCarbonBulkInstance.setTotalCountAndWeight()

            if (!radioCarbonBulkInstance.hasErrors() && radioCarbonBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), radioCarbonBulkInstance.id])}"
                redirect(action: "show", id: radioCarbonBulkInstance.id)
            }
            else {
                render(view: "edit", model: [radioCarbonBulkInstance: radioCarbonBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def radioCarbonBulkInstance = RadioCarbonBulk.get(params.id)
        if (radioCarbonBulkInstance) {
            try {
                radioCarbonBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk'), params.id])}"
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
                    } else if (key == "year" || key == "maxBP" || key == "minBP" || key.startsWith("Count") || key.startsWith("count")) {
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
            results = RadioCarbonBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[radioCarbonBulkInstanceList:results, radioCarbonBulkInstanceTotal: resultsNum])
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
