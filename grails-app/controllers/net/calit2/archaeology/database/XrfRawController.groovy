package net.calit2.archaeology.database

class XrfRawController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=XrfRaw.${params.extension}")
            exportService.export(params.format, response.outputStream, XrfRaw.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from XrfRaw x where x.site.id = ${session.site}"
            def resultCount = XrfRaw.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from XrfRaw as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from XrfRaw as x where x.site.id = ${session.site}"
            }
            def result = XrfRaw.findAll(searchQuery, ["max":max, "offset":offset])
            [xrfRawInstanceList: result, xrfRawInstanceTotal: resultCount[0]]
        } else {
            [xrfRawInstanceList: XrfRaw.list(params), xrfRawInstanceTotal: XrfRaw.count()]
        }
    }

    def create = {
        def xrfRawInstance = new XrfRaw()
        xrfRawInstance.properties = params
        return [xrfRawInstance: xrfRawInstance]
    }

    def save = {
        // Error Check of Diagnostic ID
        if (params.diagnostic.id && !(Diagnostic.get(params.diagnostic.id))) {
            flash.message = "Diagnostic [ID:${params.diagnostic.id}] does not exist."
            render(view: "create", model: [xrfRawInstance: new XrfRaw(params)])
            return
        }

        def xrfRawInstance = new XrfRaw(params)

        if (xrfRawInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), xrfRawInstance.id])}"
            redirect(action: "show", id: xrfRawInstance.id)
        }
        else {
            render(view: "create", model: [xrfRawInstance: xrfRawInstance])
        }
    }

    def show = {
        def xrfRawInstance = XrfRaw.get(params.id)
        if (!xrfRawInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
            redirect(action: "list")
        }
        else {
            [xrfRawInstance: xrfRawInstance]
        }
    }

    def edit = {
        def xrfRawInstance = XrfRaw.get(params.id)
        if (!xrfRawInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
            redirect(action: "list")
        }
        else {
            def i = 1
            def data = []
            xrfRawInstance.channels.split(" ").each {
                data << [i++, it]
            }
            return [xrfRawInstance: xrfRawInstance, data: data]
        }
    }

    def update = {
        def xrfRawInstance = XrfRaw.get(params.id)
        if (xrfRawInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (xrfRawInstance.version > version) {
                    xrfRawInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'xrfRaw.label', default: 'XrfRaw')] as Object[], "Another user has updated this XrfRaw while you were editing")
                    render(view: "edit", model: [xrfRawInstance: xrfRawInstance])
                    return
                }
            }

            // Error Check of Diagnostic ID
            if (params.diagnostic.id && !(Diagnostic.get(params.diagnostic.id))) {
                flash.message = "Diagnostic [ID:${params.diagnostic.id}] does not exist."
                render(view: "edit", model: [xrfRawInstance: xrfRawInstance])
                return
            }

            xrfRawInstance.properties = params

            if (!xrfRawInstance.hasErrors() && xrfRawInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), xrfRawInstance.id])}"
                redirect(action: "show", id: xrfRawInstance.id)
            }
            else {
                render(view: "edit", model: [xrfRawInstance: xrfRawInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def xrfRawInstance = XrfRaw.get(params.id)
        if (xrfRawInstance) {
            try {
                xrfRawInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'xrfRaw.label', default: 'XrfRaw'), params.id])}"
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
                    } else if (key == "time" || key == "count") {
                        condition.put(key, value as Integer)
                    } else if (key == "keyValue" || key == "microAmpsValue") {
                        condition.put(key, value as BigDecimal)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = XrfRaw.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[xrfRawInstanceList:results, xrfRawInstanceTotal: resultsNum])
    }

    def upload = {
        def f = request.getFile("payload")
        if (!f.empty) {
            String filename = f.originalFilename
            if (filename.indexOf(".") > 0) {
                filename = filename.split("\\.")[0]
            }
            params.filename = filename

            // Parse XRF Raw Data
            InputStream input = f.getInputStream()
            String channels = ""
            input.eachLine { str, line ->
                if (str != "BeginHeader" && str != "EndHeader") {
                    if (str.startsWith("Elin")) {
                        def m = (str =~ /Elin=(\S+) Eabs=(\S+)/)
                        params.elin = m[0][1]
                        params.eabs = m[0][2]
                    } else if (str.startsWith("Fano")) {
                        def m = (str =~ /Fano=(\S+) FWHM=(\S+)/)
                        params.fano = m[0][1]
                        params.fwhm = m[0][2]
                    } else {
                        channels <<= str + " "
                    }
                }
            }
            params.channels = channels
            save()
        } else {
            flash.message = "File cannot be empty."
            redirect(action: "create")
        }
    }

    def export = {
        XrfRaw xrfRawInstance = XrfRaw.get(params.id)
        if (xrfRawInstance) {
            response.contentType = "text/plain"
            response.setHeader("Content-Disposition", "attachment; filename=${xrfRawInstance.filename}.TXT")
            
            def text = "BeginHeader\r\n"
            text <<= "Elin=${xrfRawInstance.elin} Eabs=${xrfRawInstance.eabs}\r\n"
            text <<= "Fano=${xrfRawInstance.fano} FWHM=${xrfRawInstance.fwhm}\r\n"
            text <<= "EndHeader\r\n"
            text <<= xrfRawInstance.channels.replace(' ', '\r\n')

            render text

        } else {
            redirect(action: "list")
        }
    }
    
    def getDiagnostic = {
        Artifact artifact = Artifact.get(params.id)
        if (artifact?.isDiagnostic()) {
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
                    redirect(action: "create", params: ["diagnostic.id": diagnostic.id])
                } else {
                    flash.message = "Error occurred while creating diagnostic data."
                    redirect(action: "create")
                }
            }
        } else {
            flash.message = "Specify Diagnostic ID."
            redirect(action: "create")
        }
    }
}
