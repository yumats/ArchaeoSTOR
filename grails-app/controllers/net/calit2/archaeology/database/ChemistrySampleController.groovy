package net.calit2.archaeology.database

class ChemistrySampleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=ChemistrySample.${params.extension}")
            exportService.export(params.format, response.outputStream, ChemistrySample.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from ChemistrySample x where x.site.id = ${session.site}"
            def resultCount = ChemistrySample.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from ChemistrySample as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from ChemistrySample as x where x.site.id = ${session.site}"
            }
            def result = ChemistrySample.findAll(searchQuery, ["max":max, "offset":offset])
            [chemistrySampleInstanceList: result, chemistrySampleInstanceTotal: resultCount[0]]
        } else {
            [chemistrySampleInstanceList: ChemistrySample.list(params), chemistrySampleInstanceTotal: ChemistrySample.count()]
        }
    }

    def create = {
        def chemistrySampleInstance = new ChemistrySample()
        chemistrySampleInstance.properties = params
        return [chemistrySampleInstance: chemistrySampleInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["ChemistrySample"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def chemistrySampleInstance = new ChemistrySample(params)

        // Calculate dependent values
        chemistrySampleInstance.setStorageFromCrate()
//        chemistrySampleInstance.setTotalCountAndWeight()

        if (chemistrySampleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), chemistrySampleInstance.id])}"
            redirect(action: "show", id: chemistrySampleInstance.id)
        }
        else {
            render(view: "create", model: [chemistrySampleInstance: chemistrySampleInstance])
        }
    }

    def show = {
        def chemistrySampleInstance = ChemistrySample.get(params.id)
        if (!chemistrySampleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
            redirect(action: "list")
        }
        else {
            [chemistrySampleInstance: chemistrySampleInstance]
        }
    }

    def edit = {
        def chemistrySampleInstance = ChemistrySample.get(params.id)
        if (!chemistrySampleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [chemistrySampleInstance: chemistrySampleInstance]
        }
    }

    def update = {
        def chemistrySampleInstance = ChemistrySample.get(params.id)
        if (chemistrySampleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (chemistrySampleInstance.version > version) {
                    
                    chemistrySampleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'chemistrySample.label', default: 'ChemistrySample')] as Object[], "Another user has updated this ChemistrySample while you were editing")
                    render(view: "edit", model: [chemistrySampleInstance: chemistrySampleInstance])
                    return
                }
            }
            chemistrySampleInstance.properties = params

            // Calculate dependent values
            chemistrySampleInstance.setStorageFromCrate()
//            chemistrySampleInstance.setTotalCountAndWeight()

            if (!chemistrySampleInstance.hasErrors() && chemistrySampleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), chemistrySampleInstance.id])}"
                redirect(action: "show", id: chemistrySampleInstance.id)
            }
            else {
                render(view: "edit", model: [chemistrySampleInstance: chemistrySampleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def chemistrySampleInstance = ChemistrySample.get(params.id)
        if (chemistrySampleInstance) {
            try {
                chemistrySampleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chemistrySample.label', default: 'ChemistrySample'), params.id])}"
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
            results = ChemistrySample.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[chemistrySampleInstanceList:results, chemistrySampleInstanceTotal: resultsNum])
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
