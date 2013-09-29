package net.calit2.archaeology.database

class GroundStoneGrooveController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=GroundStoneGroove.${params.extension}")
            def fields = [] // TODO
			def labels = [:]
            exportService.export(params.format, response.outputStream, GroundStoneGroove.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from GroundStoneGroove x where x.site.id = ${session.site}"
            def resultCount = GroundStoneGroove.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from GroundStoneGroove as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from GroundStoneGroove as x where x.site.id = ${session.site}"
            }
            def result = GroundStoneGroove.findAll(searchQuery, ["max":max, "offset":offset])
            [groundStoneGrooveInstanceList: result, groundStoneGrooveInstanceTotal: resultCount[0]]
        } else {
            [groundStoneGrooveInstanceList: GroundStoneGroove.list(params), groundStoneGrooveInstanceTotal: GroundStoneGroove.count()]
        }
    }

    def create = {
        def groundStoneGrooveInstance = new GroundStoneGroove()
        groundStoneGrooveInstance.properties = params
        return [groundStoneGrooveInstance: groundStoneGrooveInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
//        if (!params.get("type")) params.put("type", "")
//        if (!params.get("area")) params.put("area", "")
//        if (!params.get("storageField")) params.put("storageField", "")
//        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def groundStoneGrooveInstance = new GroundStoneGroove(params)

        // Calculate dependent values
//        groundStoneGrooveInstance.setStorageFromCrate()
//        groundStoneGrooveInstance.setTotalCountAndWeight()

        if (groundStoneGrooveInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), groundStoneGrooveInstance.id])}"
            redirect(action: "show", id: groundStoneGrooveInstance.id)
        }
        else {
            render(view: "create", model: [groundStoneGrooveInstance: groundStoneGrooveInstance])
        }
    }

    def show = {
        def groundStoneGrooveInstance = GroundStoneGroove.get(params.id)
        if (!groundStoneGrooveInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groundStoneGrooveInstance: groundStoneGrooveInstance]
        }
    }

    def edit = {
        def groundStoneGrooveInstance = GroundStoneGroove.get(params.id)
        if (!groundStoneGrooveInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groundStoneGrooveInstance: groundStoneGrooveInstance]
        }
    }

    def update = {
        def groundStoneGrooveInstance = GroundStoneGroove.get(params.id)
        if (groundStoneGrooveInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groundStoneGrooveInstance.version > version) {
                    
                    groundStoneGrooveInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove')] as Object[], "Another user has updated this GroundStoneGroove while you were editing")
                    render(view: "edit", model: [groundStoneGrooveInstance: groundStoneGrooveInstance])
                    return
                }
            }
            groundStoneGrooveInstance.properties = params

            // Calculate dependent values
//            groundStoneGrooveInstance.setStorageFromCrate()
//            groundStoneGrooveInstance.setTotalCountAndWeight()

            if (!groundStoneGrooveInstance.hasErrors() && groundStoneGrooveInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), groundStoneGrooveInstance.id])}"
                redirect(action: "show", id: groundStoneGrooveInstance.id)
            }
            else {
                render(view: "edit", model: [groundStoneGrooveInstance: groundStoneGrooveInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groundStoneGrooveInstance = GroundStoneGroove.get(params.id)
        if (groundStoneGrooveInstance) {
            try {
                groundStoneGrooveInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove'), params.id])}"
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
            results = GroundStoneGroove.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[groundStoneGrooveInstanceList:results, groundStoneGrooveInstanceTotal: resultsNum])
    }

//    def print = {}
//
//    def getArchData = {
//        def archService = new ArchDataService()
//        def values = archService.getDataWithBarcode(params.barcode)
//        if (values) {
//            values.each { key, value ->
//                params.put(key, value)
//            }
//            redirect(action: "create", params: params)
//        } else {
//            flash.message = "Cannot find data in ArchField"
//            redirect(action: "create")
//        }
//    }
}
