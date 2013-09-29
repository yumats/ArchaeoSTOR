package net.calit2.archaeology.util

class MapLinkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=MapLink.${params.extension}")
            def fields = [] // TODO
			def labels = [:]
            exportService.export(params.format, response.outputStream, MapLink.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from MapLink x where x.site.id = ${session.site}" // Need to customize
            def resultCount = MapLink.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from MapLink as x where x.site.id = ${session.site} order by x.${sort} ${order}" // Need to customize
            } else {
                searchQuery = "from MapLink as x where x.site.id = ${session.site}" // Need to customize
            }
            def result = MapLink.findAll(searchQuery, ["max":max, "offset":offset])
            [mapLinkInstanceList: result, mapLinkInstanceTotal: resultCount[0]]
        } else {
            [mapLinkInstanceList: MapLink.list(params), mapLinkInstanceTotal: MapLink.count()]
        }
    }

    def create = {
        def mapLinkInstance = new MapLink()
        mapLinkInstance.properties = params
        return [mapLinkInstance: mapLinkInstance]
    }

    def save = {
        // NULL is not allowed for these parameters
//        if (!params.get("type")) params.put("type", "")
//        if (!params.get("area")) params.put("area", "")
//        if (!params.get("storageField")) params.put("storageField", "")
//        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def mapLinkInstance = new MapLink(params)

        // Calculate dependent values
//        mapLinkInstance.setStorageFromCrate()
//        mapLinkInstance.setTotalCountAndWeight()

        if (mapLinkInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mapLink.label', default: 'MapLink'), mapLinkInstance.id])}"
            redirect(action: "show", id: mapLinkInstance.id)
        }
        else {
            render(view: "create", model: [mapLinkInstance: mapLinkInstance])
        }
    }

    def show = {
        def mapLinkInstance = MapLink.get(params.id)
        if (!mapLinkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mapLinkInstance: mapLinkInstance]
        }
    }

    def edit = {
        def mapLinkInstance = MapLink.get(params.id)
        if (!mapLinkInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mapLinkInstance: mapLinkInstance]
        }
    }

    def update = {
        def mapLinkInstance = MapLink.get(params.id)
        if (mapLinkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mapLinkInstance.version > version) {
                    
                    mapLinkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mapLink.label', default: 'MapLink')] as Object[], "Another user has updated this MapLink while you were editing")
                    render(view: "edit", model: [mapLinkInstance: mapLinkInstance])
                    return
                }
            }
            mapLinkInstance.properties = params

            // Calculate dependent values
//            mapLinkInstance.setStorageFromCrate()
//            mapLinkInstance.setTotalCountAndWeight()

            if (!mapLinkInstance.hasErrors() && mapLinkInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mapLink.label', default: 'MapLink'), mapLinkInstance.id])}"
                redirect(action: "show", id: mapLinkInstance.id)
            }
            else {
                render(view: "edit", model: [mapLinkInstance: mapLinkInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mapLinkInstance = MapLink.get(params.id)
        if (mapLinkInstance) {
            try {
                mapLinkInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapLink.label', default: 'MapLink'), params.id])}"
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
            results = MapLink.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[mapLinkInstanceList:results, mapLinkInstanceTotal: resultsNum])
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
