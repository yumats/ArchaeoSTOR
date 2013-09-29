package net.calit2.archaeology.database

class GroundStoneHoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=GroundStoneHole.${params.extension}")
            def fields = [] // TODO
			def labels = [:]
            exportService.export(params.format, response.outputStream, GroundStoneHole.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from GroundStoneHole x where x.site.id = ${session.site}"
            def resultCount = GroundStoneHole.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from GroundStoneHole as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from GroundStoneHole as x where x.site.id = ${session.site}"
            }
            def result = GroundStoneHole.findAll(searchQuery, ["max":max, "offset":offset])
            [groundStoneHoleInstanceList: result, groundStoneHoleInstanceTotal: resultCount[0]]
        } else {
            [groundStoneHoleInstanceList: GroundStoneHole.list(params), groundStoneHoleInstanceTotal: GroundStoneHole.count()]
        }
    }

    def create = {
        def groundStoneHoleInstance = new GroundStoneHole()
        groundStoneHoleInstance.properties = params
        return [groundStoneHoleInstance: groundStoneHoleInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
//        if (!params.get("type")) params.put("type", "")
//        if (!params.get("area")) params.put("area", "")
//        if (!params.get("storageField")) params.put("storageField", "")
//        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def groundStoneHoleInstance = new GroundStoneHole(params)

        // Calculate dependent values
//        groundStoneHoleInstance.setStorageFromCrate()
//        groundStoneHoleInstance.setTotalCountAndWeight()

        if (groundStoneHoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), groundStoneHoleInstance.id])}"
            redirect(action: "show", id: groundStoneHoleInstance.id)
        }
        else {
            render(view: "create", model: [groundStoneHoleInstance: groundStoneHoleInstance])
        }
    }

    def show = {
        def groundStoneHoleInstance = GroundStoneHole.get(params.id)
        if (!groundStoneHoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groundStoneHoleInstance: groundStoneHoleInstance]
        }
    }

    def edit = {
        def groundStoneHoleInstance = GroundStoneHole.get(params.id)
        if (!groundStoneHoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groundStoneHoleInstance: groundStoneHoleInstance]
        }
    }

    def update = {
        def groundStoneHoleInstance = GroundStoneHole.get(params.id)
        if (groundStoneHoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groundStoneHoleInstance.version > version) {
                    
                    groundStoneHoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'groundStoneHole.label', default: 'GroundStoneHole')] as Object[], "Another user has updated this GroundStoneHole while you were editing")
                    render(view: "edit", model: [groundStoneHoleInstance: groundStoneHoleInstance])
                    return
                }
            }
            groundStoneHoleInstance.properties = params

            // Calculate dependent values
//            groundStoneHoleInstance.setStorageFromCrate()
//            groundStoneHoleInstance.setTotalCountAndWeight()

            if (!groundStoneHoleInstance.hasErrors() && groundStoneHoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), groundStoneHoleInstance.id])}"
                redirect(action: "show", id: groundStoneHoleInstance.id)
            }
            else {
                render(view: "edit", model: [groundStoneHoleInstance: groundStoneHoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groundStoneHoleInstance = GroundStoneHole.get(params.id)
        if (groundStoneHoleInstance) {
            try {
                groundStoneHoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groundStoneHole.label', default: 'GroundStoneHole'), params.id])}"
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
            results = GroundStoneHole.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[groundStoneHoleInstanceList:results, groundStoneHoleInstanceTotal: resultsNum])
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
