<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if(params?.format && params.format != "html"){
            response.contentType = org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=${className}.\${params.extension}")
            def fields = [] // TODO
			def labels = [:]
            exportService.export(params.format, response.outputStream, ${className}.list(sort:"id", order:"asc"), fields, labels, [:], [:])
        }

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from ${className} x where x.site.id = \${session.site}" // Need to customize
            def resultCount = ${className}.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from ${className} as x where x.site.id = \${session.site} order by x.\${sort} \${order}" // Need to customize
            } else {
                searchQuery = "from ${className} as x where x.site.id = \${session.site}" // Need to customize
            }
            def result = ${className}.findAll(searchQuery, ["max":max, "offset":offset])
            [${propertyName}List: result, ${propertyName}Total: resultCount[0]]
        } else {
            [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
        }
    }

    def create = {
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return [${propertyName}: ${propertyName}]
    }

    def save = {
        // NULL is not allowed for these parameters
//        if (!params.get("type")) params.put("type", "")
//        if (!params.get("area")) params.put("area", "")
//        if (!params.get("storageField")) params.put("storageField", "")
//        if (!params.get("storageSanDiego")) params.put("storageSanDiego", "")

        def ${propertyName} = new ${className}(params)

        // Calculate dependent values
//        ${propertyName}.setStorageFromCrate()
//        ${propertyName}.setTotalCountAndWeight()

        if (${propertyName}.save(flush: true)) {
            flash.message = "\${message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
            redirect(action: "show", id: ${propertyName}.id)
        }
        else {
            render(view: "create", model: [${propertyName}: ${propertyName}])
        }
    }

    def show = {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            [${propertyName}: ${propertyName}]
        }
    }

    def edit = {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [${propertyName}: ${propertyName}]
        }
    }

    def update = {
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            if (params.version) {
                def version = params.version.toLong()
                if (${propertyName}.version > version) {
                    <% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
                    ${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[], "Another user has updated this ${className} while you were editing")
                    render(view: "edit", model: [${propertyName}: ${propertyName}])
                    return
                }
            }
            ${propertyName}.properties = params

            // Calculate dependent values
//            ${propertyName}.setStorageFromCrate()
//            ${propertyName}.setTotalCountAndWeight()

            if (!${propertyName}.hasErrors() && ${propertyName}.save(flush: true)) {
                flash.message = "\${message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
                redirect(action: "show", id: ${propertyName}.id)
            }
            else {
                render(view: "edit", model: [${propertyName}: ${propertyName}])
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            try {
                ${propertyName}.delete(flush: true)
                flash.message = "\${message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "\${message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
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
            results = ${className}.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[${propertyName}List:results, ${propertyName}Total: resultsNum])
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
