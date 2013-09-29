package net.calit2.archaeology.database

class CoinBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=CoinBulk.${params.extension}")
            exportService.export(params.format, response.outputStream, CoinBulk.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from CoinBulk x where x.site.id = ${session.site}"
            def resultCount = CoinBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from CoinBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from CoinBulk as x where x.site.id = ${session.site}"
            }
            def result = CoinBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [coinBulkInstanceList: result, coinBulkInstanceTotal: resultCount[0]]
        } else {
            [coinBulkInstanceList: CoinBulk.list(params), coinBulkInstanceTotal: CoinBulk.count()]
        }
    }

    def create = {
        def coinBulkInstance = new CoinBulk()
        coinBulkInstance.properties = params
        return [coinBulkInstance: coinBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Coin"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def coinBulkInstance = new CoinBulk(params)

        // Calculate dependent values
        coinBulkInstance.setStorageFromCrate()
//        coinBulkInstance.setTotalCountAndWeight()

        if (coinBulkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), coinBulkInstance.id])}"
            redirect(action: "show", id: coinBulkInstance.id)
        }
        else {
            render(view: "create", model: [coinBulkInstance: coinBulkInstance])
        }
    }

    def show = {
        def coinBulkInstance = CoinBulk.get(params.id)
        if (!coinBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [coinBulkInstance: coinBulkInstance]
        }
    }

    def edit = {
        def coinBulkInstance = CoinBulk.get(params.id)
        if (!coinBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [coinBulkInstance: coinBulkInstance]
        }
    }

    def update = {
        def coinBulkInstance = CoinBulk.get(params.id)
        if (coinBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (coinBulkInstance.version > version) {
                    
                    coinBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'coinBulk.label', default: 'CoinBulk')] as Object[], "Another user has updated this CoinBulk while you were editing")
                    render(view: "edit", model: [coinBulkInstance: coinBulkInstance])
                    return
                }
            }
            coinBulkInstance.properties = params

            // Calculate dependent values
            coinBulkInstance.setStorageFromCrate()
//            coinBulkInstance.setTotalCountAndWeight()

            if (!coinBulkInstance.hasErrors() && coinBulkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), coinBulkInstance.id])}"
                redirect(action: "show", id: coinBulkInstance.id)
            }
            else {
                render(view: "edit", model: [coinBulkInstance: coinBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def coinBulkInstance = CoinBulk.get(params.id)
        if (coinBulkInstance) {
            try {
                coinBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'coinBulk.label', default: 'CoinBulk'), params.id])}"
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
            results = CoinBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[coinBulkInstanceList:results, coinBulkInstanceTotal: resultsNum])
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
