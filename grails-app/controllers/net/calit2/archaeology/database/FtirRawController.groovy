package net.calit2.archaeology.database

class FtirRawController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=FtirRaw.${params.extension}")
            exportService.export(params.format, response.outputStream, FtirRaw.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from FtirRaw x where x.site.id = ${session.site}"
            def resultCount = FtirRaw.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from FtirRaw as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from FtirRaw as x where x.site.id = ${session.site}"
            }
            def result = FtirRaw.findAll(searchQuery, ["max":max, "offset":offset])
            [ftirRawInstanceList: result, ftirRawInstanceTotal: resultCount[0]]
        } else {
            [ftirRawInstanceList: FtirRaw.list(params), ftirRawInstanceTotal: FtirRaw.count()]
        }
    }

    def create = {
        def ftirRawInstance = new FtirRaw()
        ftirRawInstance.properties = params
        return [ftirRawInstance: ftirRawInstance]
    }

    def save = {
        // Error Check of Diagnostic ID
        if (params.diagnostic.id && !(Diagnostic.get(params.diagnostic.id))) {
            flash.message = "Diagnostic [ID:${params.diagnostic.id}] does not exist."
            render(view: "create", model: [ftirRawInstance: new FtirRaw(params)])
            return
        }

        def ftirRawInstance = new FtirRaw(params)

        if (ftirRawInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), ftirRawInstance.id])}"
            redirect(action: "show", id: ftirRawInstance.id)
        }
        else {
            render(view: "create", model: [ftirRawInstance: ftirRawInstance])
        }
    }

    def show = {
        def ftirRawInstance = FtirRaw.get(params.id)
        if (!ftirRawInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ftirRawInstance: ftirRawInstance]
        }
    }

    def edit = {
        def ftirRawInstance = FtirRaw.get(params.id)
        if (!ftirRawInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ftirRawInstance: ftirRawInstance]
        }
    }

    def update = {
        def ftirRawInstance = FtirRaw.get(params.id)
        if (ftirRawInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ftirRawInstance.version > version) {
                    
                    ftirRawInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ftirRaw.label', default: 'FtirRaw')] as Object[], "Another user has updated this FtirRaw while you were editing")
                    render(view: "edit", model: [ftirRawInstance: ftirRawInstance])
                    return
                }
            }

            // Error Check of Diagnostic ID
            if (params.diagnostic.id && !(Diagnostic.get(params.diagnostic.id))) {
                flash.message = "Diagnostic [ID:${params.diagnostic.id}] does not exist."
                render(view: "edit", model: [ftirRawInstance: ftirRawInstance])
                return
            }

            ftirRawInstance.properties = params

            if (!ftirRawInstance.hasErrors() && ftirRawInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), ftirRawInstance.id])}"
                redirect(action: "show", id: ftirRawInstance.id)
            }
            else {
                render(view: "edit", model: [ftirRawInstance: ftirRawInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ftirRawInstance = FtirRaw.get(params.id)
        if (ftirRawInstance) {
            try {
                ftirRawInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ftirRaw.label', default: 'FtirRaw'), params.id])}"
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
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = FtirRaw.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[ftirRawInstanceList:results, ftirRawInstanceTotal: resultsNum])
    }

    def upload = {
        def f = request.getFile("content")
        if (!f.empty) {
            String filename = f.originalFilename
            if (filename.indexOf(".") > 0) {
                filename = filename.split("\\.")[0]
            }
            params.filename = filename
            save()
        } else {
            flash.message = "File cannot be empty."
            redirect(action: "create")
        }
    }

    def export = {
        def ftirRawInstance = FtirRaw.get(params.id)
        if (ftirRawInstance) {
            response.setHeader("Content-Disposition", "attachment; filename=${ftirRawInstance.filename}.SPA")
            response.setContentLength(ftirRawInstance.content.length)
            response.outputStream.write(ftirRawInstance.content)

        } else {
            redirect(action: "list")
        }
    }

    def getDiagnostic = {
        Artifact artifact = Artifact.get(params.id)
        if (!artifact) {
            flash.message = "Artifact data do not exist."
            redirect(action: "create")
        }
        if (artifact.isDiagnostic()) {
            if (artifact.diagnostics) {
                def list = artifact.diagnostics as List
                if (list.size() == 1) {
                    def diagnostic = list[0]
                    redirect(action: "create", params: ["diagnostic.id": diagnostic.id])
                } else {
                    flash.message = "Multiple diagnositc data found."
                    redirect(action: "create")
                }
            } else {
                def diagnostic = new Diagnostic(artifact: artifact, registration: 0)
                if (diagnostic.save(flush: true)) {
                    diagnostic.registration = diagnostic.id
                    diagnostic.save(flush: true)
                    flash.message = "Diagnositc data created."
                    redirect(action: "create", params: ["diagnostic.id": diagnostic.id])
                } else {
                    flash.message = "Error occurred while creating diagnostic data."
                    redirect(action: "create")
                }
            }
        } else {
            flash.message = "This artifact does not have a diagnositc nature. Specify Diagnostic ID."
            redirect(action: "create")
        }
    }
}
