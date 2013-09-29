package net.calit2.archaeology.database

class CrateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Crate.${params.extension}")
            exportService.export(params.format, response.outputStream, Crate.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from Crate x where x.site.id = ${session.site}"
            def resultCount = Crate.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from Crate as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from Crate as x where x.site.id = ${session.site}"
            }
            def result = Crate.findAll(searchQuery, ["max":max, "offset":offset])
            [crateInstanceList: result, crateInstanceTotal: resultCount[0]]
        } else {
            [crateInstanceList: Crate.list(params), crateInstanceTotal: Crate.count()]
        }
    }

    def create = {
        def crateInstance = new Crate()
        crateInstance.properties = params
        return [crateInstance: crateInstance]
    }

    def save = {
        def crateInstance = new Crate(params)
        if (crateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'crate.label', default: 'Crate'), crateInstance.id])}"
            redirect(action: "show", id: crateInstance.id)
        }
        else {
            render(view: "create", model: [crateInstance: crateInstance])
        }
    }

    def show = {
        def crateInstance = Crate.get(params.id)
        if (!crateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [crateInstance: crateInstance]
        }
    }

    def edit = {
        def crateInstance = Crate.get(params.id)
        if (!crateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [crateInstance: crateInstance]
        }
    }

    def update = {
        def crateInstance = Crate.get(params.id)
        if (crateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (crateInstance.version > version) {
                    
                    crateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'crate.label', default: 'Crate')] as Object[], "Another user has updated this Crate while you were editing")
                    render(view: "edit", model: [crateInstance: crateInstance])
                    return
                }
            }

            // Update storage locations of artifacts in a crate
            def artifacts = crateInstance.artifacts
            if (artifacts) {
                for (artifact in artifacts) {
                    boolean isChanged = false
                    if (params.locationField && artifact.storageField != params.locationField) {
                        artifact.storageField = params.locationField
                        isChanged = true
                    }
                    if (params.locationSanDiego && artifact.storageSanDiego != params.locationSanDiego) {
                        artifact.storageSanDiego = params.locationSanDiego
                        isChanged = true
                    }
                    if (isChanged) {
                        artifact.save(failOnError: true)
                    }
                }
            }

            crateInstance.properties = params
            if (!crateInstance.hasErrors() && crateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'crate.label', default: 'Crate'), crateInstance.id])}"
                redirect(action: "show", id: crateInstance.id)
            }
            else {
                render(view: "edit", model: [crateInstance: crateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def crateInstance = Crate.get(params.id)
        if (crateInstance) {
            try {
                crateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crate.label', default: 'Crate'), params.id])}"
            redirect(action: "list")
        }
    }

//    def search = {
//        return create()
//    }
//
//    def query = {
//        def condition = [:]
//        params.each { key, value ->
//            if (value && !(value instanceof Map)) {
//                if (!key.startsWith("_") && key != "action" && key != "controller") {
//                    if (key.endsWith("id")) {
//                        condition.put(key, value as Long)
//                    } else if (key == "year" || key.endsWith("Count") || key.endsWith("count")) {
//                        condition.put(key, value as Integer)
//                    } else if (key.endsWith("Weight") || key.endsWith("weight")) {
//                        condition.put(key, value as BigDecimal)
//                    } else {
//                        condition.put(key, value)
//                    }
//                }
//            }
//        }
//        def results
//        if (condition.size != 0) {
//            results = Crate.findAllWhere(condition)
//        }
//        def resultsNum = results ? results.size() : 0
//        flash.message = resultsNum + " Results " + condition
//        render(view:"list", model:[crateInstanceList:results, crateInstanceTotal: resultsNum])
//    }

    def print = {
        Crate crate = Crate.get(params.id)
        if (!crate) {
            flash.message = "Crate ID ${params.id} was not found."
            redirect(action: "list")
        } else {
            def crateLabel = "Crate #${crate.number}"
            def siteLabel = "${crate.site ? crate.site : ""} ${crate.year ? '(' + crate.year + ')' : ""}"
            new BarcodeService().printLabels([[params.id, crateLabel, siteLabel]], 11, response)
        }
    }

    def identify = {}

    def move = {}

    def movesd = {}

    def report = {
        def crateInstance = new Crate()
        crateInstance.properties = params
        return [crateInstance: crateInstance]
    }

    def export = {
        def siteId = params.site?.id
        if (!siteId) {
            redirect(action: "report")
        }

        response.contentType = "text/plain"
        response.setHeader("Content-Disposition", "attachment; filename=crate_report.csv")
        def body = "Crate ID, Crate Number, Artifact ID, Artifact Type, Site, Year, EDM, Basket, Locus\n"

        def results = Crate.findAll("from Crate as x where x.site.id = ${siteId}")
        for (crate in results) {
            if (crate.artifacts) {
                for (artifact in crate.artifacts) {
                    body <<= "${crate.id}, ${crate.number}, ${artifact.id}, ${artifact.type}, ${artifact.site}, ${artifact.year}, ${artifact.edm}, ${artifact.basket}, ${artifact.locus}\n"
                }
            } else {
                body <<= "${crate.id}, ${crate.number}\n"
            }
        }
        render body
    }
}
