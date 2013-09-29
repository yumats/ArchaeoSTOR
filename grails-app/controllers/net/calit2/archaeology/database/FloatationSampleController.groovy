package net.calit2.archaeology.database

class FloatationSampleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=FloatationSample.${params.extension}")
            exportService.export(params.format, response.outputStream, FloatationSample.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from FloatationSample x where x.site.id = ${session.site}"
            def resultCount = FloatationSample.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from FloatationSample as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from FloatationSample as x where x.site.id = ${session.site}"
            }
            def result = FloatationSample.findAll(searchQuery, ["max":max, "offset":offset])
            [floatationSampleInstanceList: result, floatationSampleInstanceTotal: resultCount[0]]
        } else {
            [floatationSampleInstanceList: FloatationSample.list(params), floatationSampleInstanceTotal: FloatationSample.count()]
        }
    }

    def create = {
        def floatationSampleInstance = new FloatationSample()
        floatationSampleInstance.properties = params
        return [floatationSampleInstance: floatationSampleInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["FloatationSample"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def floatationSampleInstance = new FloatationSample(params)

        // Calculate dependent values
        floatationSampleInstance.setStorageFromCrate()
//        floatationSampleInstance.setTotalCountAndWeight()

        if (floatationSampleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), floatationSampleInstance.id])}"
            redirect(action: "show", id: floatationSampleInstance.id)
        }
        else {
            render(view: "create", model: [floatationSampleInstance: floatationSampleInstance])
        }
    }

    def show = {
        def floatationSampleInstance = FloatationSample.get(params.id)
        if (!floatationSampleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
            redirect(action: "list")
        }
        else {
            [floatationSampleInstance: floatationSampleInstance]
        }
    }

    def edit = {
        def floatationSampleInstance = FloatationSample.get(params.id)
        if (!floatationSampleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [floatationSampleInstance: floatationSampleInstance]
        }
    }

    def update = {
        def floatationSampleInstance = FloatationSample.get(params.id)
        if (floatationSampleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (floatationSampleInstance.version > version) {
                    
                    floatationSampleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'floatationSample.label', default: 'FloatationSample')] as Object[], "Another user has updated this FloatationSample while you were editing")
                    render(view: "edit", model: [floatationSampleInstance: floatationSampleInstance])
                    return
                }
            }
            floatationSampleInstance.properties = params

            // Calculate dependent values
            floatationSampleInstance.setStorageFromCrate()
//            floatationSampleInstance.setTotalCountAndWeight()

            if (!floatationSampleInstance.hasErrors() && floatationSampleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), floatationSampleInstance.id])}"
                redirect(action: "show", id: floatationSampleInstance.id)
            }
            else {
                render(view: "edit", model: [floatationSampleInstance: floatationSampleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def floatationSampleInstance = FloatationSample.get(params.id)
        if (floatationSampleInstance) {
            try {
                floatationSampleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floatationSample.label', default: 'FloatationSample'), params.id])}"
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
            results = FloatationSample.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[floatationSampleInstanceList:results, floatationSampleInstanceTotal: resultsNum])
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
