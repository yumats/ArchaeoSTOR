package net.calit2.archaeology.database

class BoneBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=BoneBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, BoneBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from BoneBulk x where x.site.id = ${session.site}"
            def resultCount = BoneBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from BoneBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from BoneBulk as x where x.site.id = ${session.site}"
            }
            def result = BoneBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [boneBulkInstanceList: result, boneBulkInstanceTotal: resultCount[0]]
        } else {
            [boneBulkInstanceList: BoneBulk.list(params), boneBulkInstanceTotal: BoneBulk.count()]
        }
    }

    def create = {
        def boneBulkInstance = new BoneBulk()
        boneBulkInstance.properties = params
        return [boneBulkInstance: boneBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Bone"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def boneBulkInstance = new BoneBulk(params)

        // Calculate dependent values
        boneBulkInstance.setStorageFromCrate()

        if (boneBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), boneBulkInstance.id])}"
            redirect(action: "show", id: boneBulkInstance.id)
        }
        else {
            render(view: "create", model: [boneBulkInstance: boneBulkInstance])
        }
    }

    def show = {
        def boneBulkInstance = BoneBulk.get(params.id)
        if (!boneBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [boneBulkInstance: boneBulkInstance]
        }
    }

    def edit = {
        def boneBulkInstance = BoneBulk.get(params.id)
        if (!boneBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [boneBulkInstance: boneBulkInstance]
        }
    }

    def update = {
        def boneBulkInstance = BoneBulk.get(params.id)
        if (boneBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (boneBulkInstance.version > version) {
                    
                    boneBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'boneBulk.label', default: 'BoneBulk')] as Object[], "Another user has updated this BoneBulk while you were editing")
                    render(view: "edit", model: [boneBulkInstance: boneBulkInstance])
                    return
                }
            }
            boneBulkInstance.properties = params

            // Calculate dependent values
            boneBulkInstance.setStorageFromCrate()

            if (!boneBulkInstance.hasErrors() && boneBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), boneBulkInstance.id])}"
                redirect(action: "show", id: boneBulkInstance.id)
            }
            else {
                render(view: "edit", model: [boneBulkInstance: boneBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def boneBulkInstance = BoneBulk.get(params.id)
        if (boneBulkInstance) {
            try {
                boneBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'boneBulk.label', default: 'BoneBulk'), params.id])}"
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
            results = BoneBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[boneBulkInstanceList:results, boneBulkInstanceTotal: resultsNum])
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
