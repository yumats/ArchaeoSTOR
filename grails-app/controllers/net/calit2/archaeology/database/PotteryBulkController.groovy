package net.calit2.archaeology.database

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class PotteryBulkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=PotteryBulk.${params.extension}")
            def fields = ["id","year","date","site","area","edm","basket","locus","crateNumber","count","weight","handmadeCount","handmadeWeight","wheelmadeCount","wheelmadeWeight","cookingCount","cookingWeight","handlesCount","handlesWeight","basesCount","basesWeight","decorCount","decorWeight","diagnosticCount","diagnosticWeight","otherSpecialCount","otherSpecialWeight","type","surveyFeature","description","period","storageField","storageSanDiego"]
			def labels = ["id":"ID","area":"Area","basesCount":"BasesCount","basesWeight":"BasesWeight","basket":"Basket","cookingCount":"CookingCount","cookingWeight":"CookingWeight","count":"TotalCount","crateNumber":"CrateNumber","date":"Date","decorCount":"DecorCount","decorWeight":"DecorWeight","description":"Description","diagnosticCount":"DiagnosticCount","diagnosticWeight":"DiagnosticWeight","edm":"EDM","handlesCount":"HandlesCount","handlesWeight":"HandlesWeight","handmadeCount":"HandmadeCount","handmadeWeight":"HandmadeWeight","locus":"Locus","otherSpecialCount":"OtherSpecialCount","otherSpecialWeight":"OtherSpecialWeight","period":"Period","site":"Site","storageField":"StorageField","storageSanDiego":"StorageSanDiego","surveyFeature":"SurveyFeature","type":"Type","weight":"TotalWeight","wheelmadeCount":"WheelmadeCount","wheelmadeWeight":"WheelmadeCount","year":"Year"]
            exportService.export(params.format, response.outputStream, PotteryBulk.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from PotteryBulk x where x.site.id = ${session.site}"
            def resultCount = PotteryBulk.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from PotteryBulk as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from PotteryBulk as x where x.site.id = ${session.site}"
            }
            def result = PotteryBulk.findAll(searchQuery, ["max":max, "offset":offset])
            [potteryBulkInstanceList: result, potteryBulkInstanceTotal: resultCount[0]]
        } else {
            [potteryBulkInstanceList: PotteryBulk.list(params), potteryBulkInstanceTotal: PotteryBulk.count()]
        }
    }

    def create = {
        def potteryBulkInstance = new PotteryBulk()
        potteryBulkInstance.properties = params
        return [potteryBulkInstance: potteryBulkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
        if (!params.get("type")) params.put("type", Constants.D_CODE["Pottery"])
        if (!params.get("area")) params.put("area", "")
        if (!params.get("storageField")) params.put("storageField", "")
        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def potteryBulkInstance = new PotteryBulk(params)

        // Calculate dependent values
        potteryBulkInstance.setStorageFromCrate()
        potteryBulkInstance.setTotalCountAndWeight()

        if (potteryBulkInstance.save(flush: true)) {

            // Auto-generate pottery diagnostic data
            if (!(params.id) && params.diagnosticCount) {
                int count = params.diagnosticCount as Integer
                if (count > 0) {
                    def diagnostics = [] as Set
                    for (i in 1..count) {
                        def pd = new PotteryDiagnostic(artifact: potteryBulkInstance, registration: 0, period: "", illustration: "", rimAngle: "", rimTreatment: "", handleType: "")
                        pd.save(flush: true, failOnError: true)
                        pd.registration = pd.id
                        pd.save(flush: true, failOnError: true)
                        diagnostics << pd
                    }
                    potteryBulkInstance.diagnostics = diagnostics
                    potteryBulkInstance.save(flush: true, failOnError: true)
                }
            }

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), potteryBulkInstance.id])}"
            redirect(action: "show", id: potteryBulkInstance.id)
        }
        else {
            render(view: "create", model: [potteryBulkInstance: potteryBulkInstance])
        }
    }

    def show = {
        def potteryBulkInstance = PotteryBulk.get(params.id)
        if (!potteryBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            [potteryBulkInstance: potteryBulkInstance]
        }
    }

    def edit = {
        def potteryBulkInstance = PotteryBulk.get(params.id)
        if (!potteryBulkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [potteryBulkInstance: potteryBulkInstance]
        }
    }

    def update = {
        def potteryBulkInstance = PotteryBulk.get(params.id)
        if (potteryBulkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (potteryBulkInstance.version > version) {
                    
                    potteryBulkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'potteryBulk.label', default: 'PotteryBulk')] as Object[], "Another user has updated this PotteryBulk while you were editing")
                    render(view: "edit", model: [potteryBulkInstance: potteryBulkInstance])
                    return
                }
            }

            // For auto-generation of diagnostic data
            int prevCount = potteryBulkInstance.diagnosticCount ?: 0

            potteryBulkInstance.properties = params

            // Calculate dependent values
            potteryBulkInstance.setStorageFromCrate()
            potteryBulkInstance.setTotalCountAndWeight()

            if (!potteryBulkInstance.hasErrors() && potteryBulkInstance.save(flush: true)) {

                // Auto-generate pottery diagnostic data only if number is increased
                if (params.diagnosticCount) {
                    int count = (params.diagnosticCount as Integer) - prevCount
                    if (count > 0) {
                        def diagnostics = [] as Set
                        for (i in 1..count) {
                            def pd = new PotteryDiagnostic(artifact: potteryBulkInstance, registration: 0, period: "", illustration: "", rimAngle: "", rimTreatment: "", handleType: "")
                            pd.save(flush: true, failOnError: true)
                            pd.registration = pd.id
                            pd.save(flush: true, failOnError: true)
                            diagnostics << pd
                        }
                        if (potteryBulkInstance.diagnostics) {
                            potteryBulkInstance.diagnostics += diagnostics
                        } else {
                            potteryBulkInstance.diagnostics = diagnostics
                        }
                        potteryBulkInstance.save(flush: true, failOnError: true)
                    }
                }

                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), potteryBulkInstance.id])}"
                redirect(action: "show", id: potteryBulkInstance.id)
            }
            else {
                render(view: "edit", model: [potteryBulkInstance: potteryBulkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def potteryBulkInstance = PotteryBulk.get(params.id)
        if (potteryBulkInstance) {
            try {
                potteryBulkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryBulk.label', default: 'PotteryBulk'), params.id])}"
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
                    } else if (key == "year" || key.endsWith("Count") || key.endsWith("count")) {
                        condition.put(key, value as Integer)
                    } else if (key.endsWith("Weight") || key.endsWith("weight")) {
                        condition.put(key, value as BigDecimal)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = PotteryBulk.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[potteryBulkInstanceList:results, potteryBulkInstanceTotal: resultsNum])
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
            flash.message = "No associated diagnostic data"
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

    def deleteAllDiagnostic = {
        def potteryBulkInstance = PotteryBulk.get(params.id)
        if (potteryBulkInstance && potteryBulkInstance.diagnostics) {
            try {
                potteryBulkInstance.diagnostics.each {
                    it.delete(flush: true)
                }
                flash.message = "Deleted all the associated diagnostic data"
                redirect(action: "edit", id: params.id)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Data integrity error while deleting diagnostic data"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "Could not find data to delete."
            redirect(action: "list")
        }
    }
}
