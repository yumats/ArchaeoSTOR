package net.calit2.archaeology.database

import org.joda.time.DateTime

class RadioCarbonDiagnosticController {

    private static String OXCAL_URL = "http://c14.arch.ox.ac.uk/oxcal/OxCal.html?Command="

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=RadioCarbonDiagnostic.${params.extension}")
            exportService.export(params.format, response.outputStream, RadioCarbonDiagnostic.list(sort:"id", order:"asc"), [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from RadioCarbonDiagnostic x where x.artifact.site.id = ${session.site}"
            def resultCount = RadioCarbonDiagnostic.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from RadioCarbonDiagnostic as x where x.artifact.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from RadioCarbonDiagnostic as x where x.artifact.site.id = ${session.site}"
            }
            def result = RadioCarbonDiagnostic.findAll(searchQuery, ["max":max, "offset":offset])
            [radioCarbonDiagnosticInstanceList: result, radioCarbonDiagnosticInstanceTotal: resultCount[0]]
        } else {
            [radioCarbonDiagnosticInstanceList: RadioCarbonDiagnostic.list(params), radioCarbonDiagnosticInstanceTotal: RadioCarbonDiagnostic.count()]
        }
    }

    def create = {
        def radioCarbonDiagnosticInstance = new RadioCarbonDiagnostic()
        radioCarbonDiagnosticInstance.properties = params
        return [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance]
    }

    def save = {
        // Error Check of Artifact ID
        if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
            flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
            render(view: "create", model: [potteryDiagnosticInstance: new PotteryDiagnostic(params)])
            return
        }

        // NULL is not allowed for these parameters
        if (!params.get("registration")) params.put("registration", 0)
        if (!params.get("period")) params.put("period", "")

        def radioCarbonDiagnosticInstance = new RadioCarbonDiagnostic(params)
        radioCarbonDiagnosticInstance.timestamp = DateTime.now()

        if (radioCarbonDiagnosticInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), radioCarbonDiagnosticInstance.id])}"
            redirect(action: "show", id: radioCarbonDiagnosticInstance.id)
        }
        else {
            render(view: "create", model: [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance])
        }
    }

    def show = {
        def radioCarbonDiagnosticInstance = RadioCarbonDiagnostic.get(params.id)
        if (!radioCarbonDiagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
            redirect(action: "list")
        }
        else {
            [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance]
        }
    }

    def edit = {
        def radioCarbonDiagnosticInstance = RadioCarbonDiagnostic.get(params.id)
        if (!radioCarbonDiagnosticInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance]
        }
    }

    def update = {
        def radioCarbonDiagnosticInstance = RadioCarbonDiagnostic.get(params.id)
        if (radioCarbonDiagnosticInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (radioCarbonDiagnosticInstance.version > version) {
                    
                    radioCarbonDiagnosticInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')] as Object[], "Another user has updated this RadioCarbonDiagnostic while you were editing")
                    render(view: "edit", model: [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance])
                    return
                }
            }

            // Error Check of Artifact ID
            if (params.artifact.id && !(Artifact.get(params.artifact.id))) {
                flash.message = "Artifact [ID:${params.artifact.id}] does not exist."
                render(view: "edit", model: [potteryDiagnosticInstance: potteryDiagnosticInstance])
                return
            }

            radioCarbonDiagnosticInstance.properties = params

            if (!radioCarbonDiagnosticInstance.hasErrors() && radioCarbonDiagnosticInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), radioCarbonDiagnosticInstance.id])}"
                redirect(action: "show", id: radioCarbonDiagnosticInstance.id)
            }
            else {
                render(view: "edit", model: [radioCarbonDiagnosticInstance: radioCarbonDiagnosticInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def radioCarbonDiagnosticInstance = RadioCarbonDiagnostic.get(params.id)
        if (radioCarbonDiagnosticInstance) {
            try {
                radioCarbonDiagnosticInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic'), params.id])}"
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
                    } else if (key == "registration" || key == "dateBp" || key == "uncertainty") {
                        condition.put(key, value as Integer)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }

        def results
        if (condition.size != 0) {
            // HQL
            if (condition["artifact.site.id"]) {
                def q = "from RadioCarbonDiagnostic as x where "
                condition.each {key, value ->
                    if (value instanceof String) {
                        q += "x.${key}='${value}' and "
                    } else {
                        q += "x.${key}=${value} and "
                    }
                }
                q = q[0..-6]
                results = RadioCarbonDiagnostic.findAll(q)
            } else {
                results = RadioCarbonDiagnostic.findAllWhere(condition)
            }
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[radioCarbonDiagnosticInstanceList:results, radioCarbonDiagnosticInstanceTotal: resultsNum])
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

    def sendToOxcal = {
        def command = ""
        params.each { key, value ->
            if (key.startsWith("checkBox")) {
                command += "R_Date(${value});"
            }
        }
        if (command) {
            redirect(url: OXCAL_URL + command)
        } else {
            redirect(action: "list")
        }
    }

    def imports = {}

    def upload = {
        def f = request.getFile("content")
        if (!f.empty) {
            // Parse RadioCarbon output file
            InputStream input = f.getInputStream()
            def results = []
            input.eachLine { line ->
                def data = line.split("\",")
                if (data.length != 7 || data[0] == "") {
                    return
                }
                data = data.collect {
                    if (it.startsWith("\"")) {
                        return it[1..-1]
                    } else {
                        return it
                    }
                }
                def labNum = data[0]
                if (labNum.startsWith("R_Date ")) {
                    labNum = labNum[7..-1]
                }
                def rc = RadioCarbonDiagnostic.findByLabNumber(labNum)
                if (rc) {
                    rc.unmodelledOneSigFrom = data[1] as Integer
                    rc.unmodelledOneSigTo = data[2] as Integer
                    rc.unmodelledTwoSigFrom = data[4] as Integer
                    rc.unmodelledTwoSigTo = data[5] as Integer
                    rc.save()
                    results << rc
                }
            }
            flash.message = "Imported ${results.size()} data."
            render(view:"list", model:[radioCarbonDiagnosticInstanceList:results, radioCarbonDiagnosticInstanceTotal: results.size()])
        } else {
            flash.message = "File cannot be empty."
            redirect(action: "imports")
        }
    }
}
