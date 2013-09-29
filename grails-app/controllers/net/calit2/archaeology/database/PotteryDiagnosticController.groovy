package net.calit2.archaeology.database

class PotteryDiagnosticController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=PotteryDiagnostic.${params.extension}")
            def fields = ["id","registration","artifact.id","artifact.locus","artifact.basket","artifact.site.id","artifact.site.surveyFeatures","generalType","type","illustration","fabric","ware","exterior","interior","core","rimDiameter","rimThickness","rimComplete","rimAngle","rimTreatment","attachmentPoint","handleType","handleThickness","isLedgeCut","rippleCount","basalDiameter","baseComplete","angleOpening","lidDiameter","lidThickness","isPainted","isPaintedInside","isPaintedOutside","isSlipped","isSlippedInside","isSlippedOutside","isBurnished","isBurnishedInside","isBurnishedOutside","insideColor","outsideColor","designDescription","isPlasticApplication","plasticDescription","isIncised","incisedDescription","period","description"]
			def labels = [:]
            exportService.export(params.format, response.outputStream, PotteryDiagnostic.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from PotteryDiagnostic x where x.artifact.site.id = ${session.site}"
            def resultCount = PotteryDiagnostic.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from PotteryDiagnostic as x where x.artifact.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from PotteryDiagnostic as x where x.artifact.site.id = ${session.site}"
            }
            def result = PotteryDiagnostic.findAll(searchQuery, ["max":max, "offset":offset])
            [potteryDiagnosticInstanceList: result, potteryDiagnosticInstanceTotal: resultCount[0]]
        } else {
            [potteryDiagnosticInstanceList: PotteryDiagnostic.list(params), potteryDiagnosticInstanceTotal: PotteryDiagnostic.count()]
        }
    }

    def create = {
        def potteryDiagnosticInstance = new PotteryDiagnostic()
        potteryDiagnosticInstance.properties = params
        return [potteryDiagnosticInstance: potteryDiagnosticInstance]
    }

    def save = {
        // Error Check of Artifact ID
        if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
            flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
            render(view: "create", model: [potteryDiagnosticInstance: new PotteryDiagnostic(params)])
            return
        }

        def potteryDiagnosticInstance = new PotteryDiagnostic(params)

        // Set dependent boolean
        potteryDiagnosticInstance.setDependentValues()

        if (potteryDiagnosticInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), potteryDiagnosticInstance.id])}"
            redirect(action: "show", id: potteryDiagnosticInstance.id)
        }
        else {
            render(view: "create", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
        }
    }

    def show = {
        def potteryDiagnosticInstance = PotteryDiagnostic.get(params.id)
        if (!potteryDiagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
            redirect(action: "list")
        }
        else {
            [potteryDiagnosticInstance: potteryDiagnosticInstance]
        }
    }

//    def showDiagnostic = {
//        def query = "from PotteryDiagnostic x where x.artifact.id=${params.id}"
//        def potteryDiagnosticInstance = PotteryDiagnostic.find(query)
//        if (!potteryDiagnosticInstance) {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
//            redirect(action: "list")
//        }
//        else {
//            render(view: "show", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
//        }
//    }

    def edit = {
        def potteryDiagnosticInstance = PotteryDiagnostic.get(params.id)
        if (!potteryDiagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [potteryDiagnosticInstance: potteryDiagnosticInstance]
        }
    }

    def update = {
        def potteryDiagnosticInstance = PotteryDiagnostic.get(params.id)
        if (potteryDiagnosticInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (potteryDiagnosticInstance.version > version) {
                    
                    potteryDiagnosticInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic')] as Object[], "Another user has updated this PotteryDiagnostic while you were editing")
                    render(view: "edit", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
                    return
                }
            }

            // Error Check of Artifact ID
            if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
                flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
                render(view: "edit", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
                return
            }

            potteryDiagnosticInstance.properties = params

            // Set dependent boolean
            potteryDiagnosticInstance.setDependentValues()

            if (!potteryDiagnosticInstance.hasErrors() && potteryDiagnosticInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), potteryDiagnosticInstance.id])}"
                redirect(action: "show", id: potteryDiagnosticInstance.id)
            }
            else {
                render(view: "edit", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def potteryDiagnosticInstance = PotteryDiagnostic.get(params.id)
        if (potteryDiagnosticInstance) {
            try {
                potteryDiagnosticInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic'), params.id])}"
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
                    } else if (key == "registration") {
                        condition.put(key, value as Integer)
                    } else if (key.startsWith("is") || key.startsWith("has")) {
                        condition.put(key, value as Boolean)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = PotteryDiagnostic.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[potteryDiagnosticInstanceList:results, potteryDiagnosticInstanceTotal: resultsNum])
    }

    def print = {
        def diagnostic = Diagnostic.get(params.id)
        if (diagnostic) {
            def barcode = new BarcodeService()
            barcode.printDiagnostic(diagnostic, response)
        } else {
            redirect(action: "edit", params: params)
        }
    }
}
