package net.calit2.archaeology.database

class FigurineBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=FigurineBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, FigurineBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from FigurineBulk x where x.site.id = ${session.site}"
            def resultCount = FigurineBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from FigurineBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from FigurineBulk as x where x.site.id = ${session.site}"
            }
            def result = FigurineBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [figurineBulkInstanceList: result, figurineBulkInstanceTotal: resultCount[0]]
        } else {
            [figurineBulkInstanceList: FigurineBulk.list(params), figurineBulkInstanceTotal: FigurineBulk.count()]
        }
    }

    def create = {
        def figurineBulkInstance = new FigurineBulk()
        figurineBulkInstance.properties = params
        return [figurineBulkInstance: figurineBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Figurine"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def figurineBulkInstance = new FigurineBulk(params)

        // Calculate dependent values
        figurineBulkInstance.setStorageFromCrate()
//        figurineBulkInstance.setTotalCountAndWeight()

        if (figurineBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), figurineBulkInstance.id])}"
            redirect(action: "show", id: figurineBulkInstance.id)
        }
        else {
            render(view: "create", model: [figurineBulkInstance: figurineBulkInstance])
        }
    }

    def show = {
        def figurineBulkInstance = FigurineBulk.get(params.id)
        if (!figurineBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [figurineBulkInstance: figurineBulkInstance]
        }
    }

    def edit = {
        def figurineBulkInstance = FigurineBulk.get(params.id)
        if (!figurineBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [figurineBulkInstance: figurineBulkInstance]
        }
    }

    def update = {
        def figurineBulkInstance = FigurineBulk.get(params.id)
        if (figurineBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (figurineBulkInstance.version > version) {
                    
                    figurineBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'figurineBulk.label', default: 'FigurineBulk')] as Object[], "Another user has updated this FigurineBulk while you were editing")
                    render(view: "edit", model: [figurineBulkInstance: figurineBulkInstance])
                    return
                }
            }
            figurineBulkInstance.properties = params

            // Calculate dependent values
            figurineBulkInstance.setStorageFromCrate()
//            figurineBulkInstance.setTotalCountAndWeight()

            if (!figurineBulkInstance.hasErrors() && figurineBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), figurineBulkInstance.id])}"
                redirect(action: "show", id: figurineBulkInstance.id)
            }
            else {
                render(view: "edit", model: [figurineBulkInstance: figurineBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def figurineBulkInstance = FigurineBulk.get(params.id)
        if (figurineBulkInstance) {
            try {
                figurineBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'figurineBulk.label', default: 'FigurineBulk'), params.id])}"
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
            results = FigurineBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[figurineBulkInstanceList:results, figurineBulkInstanceTotal: resultsNum])
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
