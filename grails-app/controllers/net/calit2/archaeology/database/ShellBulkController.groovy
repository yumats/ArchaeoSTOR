package net.calit2.archaeology.database

class ShellBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=ShellBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, ShellBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from ShellBulk x where x.site.id = ${session.site}"
            def resultCount = ShellBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from ShellBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from ShellBulk as x where x.site.id = ${session.site}"
            }
            def result = ShellBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [shellBulkInstanceList: result, shellBulkInstanceTotal: resultCount[0]]
        } else {
            [shellBulkInstanceList: ShellBulk.list(params), shellBulkInstanceTotal: ShellBulk.count()]
        }
    }

    def create = {
        def shellBulkInstance = new ShellBulk()
        shellBulkInstance.properties = params
        return [shellBulkInstance: shellBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Shell"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def shellBulkInstance = new ShellBulk(params)

        // Calculate dependent values
        shellBulkInstance.setStorageFromCrate()
        shellBulkInstance.setTotalCountAndWeight()

        if (shellBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), shellBulkInstance.id])}"
            redirect(action: "show", id: shellBulkInstance.id)
        }
        else {
            render(view: "create", model: [shellBulkInstance: shellBulkInstance])
        }
    }

    def show = {
        def shellBulkInstance = ShellBulk.get(params.id)
        if (!shellBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shellBulkInstance: shellBulkInstance]
        }
    }

    def edit = {
        def shellBulkInstance = ShellBulk.get(params.id)
        if (!shellBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shellBulkInstance: shellBulkInstance]
        }
    }

    def update = {
        def shellBulkInstance = ShellBulk.get(params.id)
        if (shellBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shellBulkInstance.version > version) {
                    
                    shellBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shellBulk.label', default: 'ShellBulk')] as Object[], "Another user has updated this ShellBulk while you were editing")
                    render(view: "edit", model: [shellBulkInstance: shellBulkInstance])
                    return
                }
            }
            shellBulkInstance.properties = params

            // Calculate dependent values
            shellBulkInstance.setStorageFromCrate()
            shellBulkInstance.setTotalCountAndWeight()

            if (!shellBulkInstance.hasErrors() && shellBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), shellBulkInstance.id])}"
                redirect(action: "show", id: shellBulkInstance.id)
            }
            else {
                render(view: "edit", model: [shellBulkInstance: shellBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shellBulkInstance = ShellBulk.get(params.id)
        if (shellBulkInstance) {
            try {
                shellBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shellBulk.label', default: 'ShellBulk'), params.id])}"
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
            results = ShellBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[shellBulkInstanceList:results, shellBulkInstanceTotal: resultsNum])
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
