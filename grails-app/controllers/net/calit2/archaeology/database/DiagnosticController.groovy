package net.calit2.archaeology.database

class DiagnosticController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

//    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

//        if(params?.format && params.format != "html"){
//            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
//            response.setHeader("Content-disposition", "attachment; filename=Diagnostic.${params.extension}")
//            exportService.export(params.format, response.outputStream, Diagnostic.list(sort:"id", order:"asc"), [:], [:])
//        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from Diagnostic x where x.artifact.site.id = ${session.site}"
            def resultCount = Diagnostic.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from Diagnostic as x where x.artifact.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from Diagnostic as x where x.artifact.site.id = ${session.site}"
            }
            def result = Diagnostic.findAll(searchQuery, ["max":max, "offset":offset])
            [diagnosticInstanceList: result, diagnosticInstanceTotal: resultCount[0]]
        } else {
            [diagnosticInstanceList: Diagnostic.list(params), diagnosticInstanceTotal: Diagnostic.count()]
        }
    }

    def create = {
        def diagnosticInstance = new Diagnostic()
        diagnosticInstance.properties = params
        return [diagnosticInstance: diagnosticInstance]
    }

    def save = {
        // Error Check of Artifact ID
        if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
            flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
            render(view: "create", model: [potteryDiagnosticInstance: new Diagnostic(params)])
            return
        }

        def diagnosticInstance = new Diagnostic(params)

        if (diagnosticInstance.save(flush: true)) {
            diagnosticInstance.registration = diagnosticInstance.id
            diagnosticInstance.save(flush: true, failOnError: true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), diagnosticInstance.id])}"
            redirect(action: "edit", id: diagnosticInstance.id)
        }
        else {
            render(view: "create", model: [diagnosticInstance: diagnosticInstance])
        }
    }

    def show = {
        def diagnosticInstance = Diagnostic.get(params.id)
        if (!diagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
            redirect(action: "list")
        }
        // Redirect according to type of artifact
        def clazz = diagnosticInstance.getClass().getName()
        clazz = clazz.substring(clazz.lastIndexOf(".") + 1)
        clazz = clazz[0].toLowerCase() + clazz[1..-1]
        if (clazz.endsWith("Diagnostic")) {
            redirect(action: "show", controller: clazz, params: params)
        } else {
            [diagnosticInstance: diagnosticInstance]
        }
    }

    def edit = {
        def diagnosticInstance = Diagnostic.get(params.id)
        if (!diagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
            redirect(action: "list")
        }
        // Redirect according to type of artifact
        def clazz = diagnosticInstance.getClass().getName()
        clazz = clazz.substring(clazz.lastIndexOf(".") + 1)
        clazz = clazz[0].toLowerCase() + clazz[1..-1]
        if (clazz.endsWith("Diagnostic")) {
            redirect(action: "edit", controller: clazz, params: params)
        } else {
            [diagnosticInstance: diagnosticInstance]
        }
    }

    def update = {
        def diagnosticInstance = Diagnostic.get(params.id)
        if (diagnosticInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (diagnosticInstance.version > version) {

                    diagnosticInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'diagnostic.label', default: 'Diagnostic')] as Object[], "Another user has updated this Diagnostic while you were editing")
                    render(view: "edit", model: [diagnosticInstance: diagnosticInstance])
                    return
                }
            }

            // Error Check of Artifact ID
            if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
                flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
                render(view: "edit", model: [diagnosticInstance: diagnosticInstance])
                return
            }

            diagnosticInstance.properties = params

            if (!diagnosticInstance.hasErrors() && diagnosticInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), diagnosticInstance.id])}"
                redirect(action: "show", id: diagnosticInstance.id)
            }
            else {
                render(view: "edit", model: [diagnosticInstance: diagnosticInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def diagnosticInstance = Diagnostic.get(params.id)
        if (diagnosticInstance) {
            try {
                diagnosticInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diagnostic.label', default: 'Diagnostic'), params.id])}"
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
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = Diagnostic.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[diagnosticInstanceList:results, diagnosticInstanceTotal: resultsNum])
    }

    def print = {
        def diagnostic = Diagnostic.get(params.id)
        if (diagnostic) {
            new BarcodeService().printDiagnostic(diagnostic, response)
        } else {
            redirect(action: "edit", params: params)
        }
    }

    def identify = {}
}
