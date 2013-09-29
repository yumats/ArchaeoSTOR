package net.calit2.archaeology.database

class TextileBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=TextileBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, TextileBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from TextileBulk x where x.site.id = ${session.site}"
            def resultCount = TextileBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from TextileBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from TextileBulk as x where x.site.id = ${session.site}"
            }
            def result = TextileBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [textileBulkInstanceList: result, textileBulkInstanceTotal: resultCount[0]]
        } else {
            [textileBulkInstanceList: TextileBulk.list(params), textileBulkInstanceTotal: TextileBulk.count()]
        }
    }

    def create = {
        def textileBulkInstance = new TextileBulk()
        textileBulkInstance.properties = params
        return [textileBulkInstance: textileBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Textile"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def textileBulkInstance = new TextileBulk(params)

        // Calculate dependent values
        textileBulkInstance.setStorageFromCrate()
//        textileBulkInstance.setTotalCountAndWeight()

        if (textileBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), textileBulkInstance.id])}"
            redirect(action: "show", id: textileBulkInstance.id)
        }
        else {
            render(view: "create", model: [textileBulkInstance: textileBulkInstance])
        }
    }

    def show = {
        def textileBulkInstance = TextileBulk.get(params.id)
        if (!textileBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [textileBulkInstance: textileBulkInstance]
        }
    }

    def edit = {
        def textileBulkInstance = TextileBulk.get(params.id)
        if (!textileBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [textileBulkInstance: textileBulkInstance]
        }
    }

    def update = {
        def textileBulkInstance = TextileBulk.get(params.id)
        if (textileBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (textileBulkInstance.version > version) {
                    
                    textileBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'textileBulk.label', default: 'TextileBulk')] as Object[], "Another user has updated this TextileBulk while you were editing")
                    render(view: "edit", model: [textileBulkInstance: textileBulkInstance])
                    return
                }
            }
            textileBulkInstance.properties = params

            // Calculate dependent values
            textileBulkInstance.setStorageFromCrate()
//            textileBulkInstance.setTotalCountAndWeight()

            if (!textileBulkInstance.hasErrors() && textileBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), textileBulkInstance.id])}"
                redirect(action: "show", id: textileBulkInstance.id)
            }
            else {
                render(view: "edit", model: [textileBulkInstance: textileBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def textileBulkInstance = TextileBulk.get(params.id)
        if (textileBulkInstance) {
            try {
                textileBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'textileBulk.label', default: 'TextileBulk'), params.id])}"
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
            results = TextileBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[textileBulkInstanceList:results, textileBulkInstanceTotal: resultsNum])
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
