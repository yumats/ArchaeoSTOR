package net.calit2.archaeology.database

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ArtifactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def exportService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        // Export data
        if (params?.format && params.format != "html"){
            response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Artifact.${params.extension}")
            def fields = ["id","year","date","site","type","area","edm","basket","locus","surveyFeature","count","weight","description","period","storageField","storageSanDiego","crateNumber"]
			def labels = ["id":"ID","area":"Area","basket":"Basket","count":"TotalCount","crateNumber":"CrateNumber","date":"Date","description":"Description","edm":"EDM","locus":"Locus","period":"Period","site":"Site","storageField":"StorageField","storageSanDiego":"StorageSanDiego","surveyFeature":"SurveyFeature","type":"Type","weight":"TotalWeight","year":"Year"]
            def result
            if (session.site) {
                result = Artifact.findAll("from Artifact as x where x.site.id = ${session.site} order by x.id asc")
            } else {
                result = Artifact.list(sort:"id", order:"asc")
            }
            exportService.export(params.format, response.outputStream, result, fields, labels, [:], [:])
        }

        // Display data
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from Artifact x where x.site.id = ${session.site}"
            def resultCount = Artifact.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from Artifact as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from Artifact as x where x.site.id = ${session.site}"
            }
            def result = Artifact.findAll(searchQuery, ["max":max, "offset":offset])
            [artifactInstanceList: result, artifactInstanceTotal: resultCount[0]]
        } else {
            [artifactInstanceList: Artifact.list(params), artifactInstanceTotal: Artifact.count()]
        }
    }

    def create = {
        def artifactInstance = new Artifact()
        artifactInstance.properties = params
        return [artifactInstance: artifactInstance]
    }

    def save = {
        def artifactInstance = new Artifact(params)

        // 09.08.2011
        artifactInstance.setStorageFromCrate()

        if (artifactInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'artifact.label', default: 'Artifact'), artifactInstance.id])}"
            redirect(action: "show", id: artifactInstance.id)
        }
        else {
            render(view: "create", model: [artifactInstance: artifactInstance])
        }
    }

    def show = {
        def artifactInstance = Artifact.get(params.id)
        if (!artifactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
        // Redirect according to type of artifact
        def clazz = artifactInstance.getClass().getName()
        clazz = clazz.substring(clazz.lastIndexOf(".") + 1)
        clazz = clazz[0].toLowerCase() + clazz[1..-1]
        if (clazz.endsWith("Bulk") || clazz.endsWith("Sample")) {
            redirect(action: "show", controller: clazz, params: params)
        } else {
            [artifactInstance: artifactInstance]
        }
    }

    def edit = {
        def artifactInstance = Artifact.get(params.id)
        if (!artifactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
        // Redirect according to type of artifact
        def clazz = artifactInstance.getClass().getName()
        clazz = clazz.substring(clazz.lastIndexOf(".") + 1)
        clazz = clazz[0].toLowerCase() + clazz[1..-1]
        if (clazz.endsWith("Bulk") || clazz.endsWith("Sample")) {
            redirect(action: "edit", controller: clazz, params: params)
        } else {
            [artifactInstance: artifactInstance]
        }
    }

    def update = {
        def artifactInstance = Artifact.get(params.id)
        if (artifactInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (artifactInstance.version > version) {
                    
                    artifactInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'artifact.label', default: 'Artifact')] as Object[], "Another user has updated this Artifact while you were editing")
                    render(view: "edit", model: [artifactInstance: artifactInstance])
                    return
                }
            }
            artifactInstance.properties = params

            // 09.08.2011
            artifactInstance.setStorageFromCrate()

            if (!artifactInstance.hasErrors() && artifactInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'artifact.label', default: 'Artifact'), artifactInstance.id])}"
                redirect(action: "show", id: artifactInstance.id)
            }
            else {
                render(view: "edit", model: [artifactInstance: artifactInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def artifactInstance = Artifact.get(params.id)
        if (artifactInstance) {
            try {
                artifactInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
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
                    } else if (key == "year" || key.endsWith("Count") || key.endsWith("count")) {
                        condition.put(key, value as Integer)
                    } else if (key.endsWith("Weight") || key.endsWith("weight")) {
                        condition.put(key, value as BigDecimal)
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = Artifact.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[artifactInstanceList:results, artifactInstanceTotal: resultsNum])
    }

    def identify = {}

    def diagnose = {}

    def showDiagnostic = {
        def artifactInstance = Artifact.get(params.id)
        if (!artifactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        } else {
            redirect(action: "query", controller: "diagnostic", params: ["artifact.id": artifactInstance.id])
        }
    }

    def crate = {}

    def move = {}

    def movesd = {}

    def print = {
        def artifact = Artifact.get(params.id)
        if (artifact) {
            new BarcodeService().printArtifact(artifact, response)
        } else {
            redirect(action: "show", params: [id: params.id])
        }
    }

    def printStorageField = {
        new BarcodeService().printSheet(Constants.LOCATIONS_FIELD, response)
    }

    def printStorageSD = {
        new BarcodeService().printSheet(Constants.LOCATIONS_SD, response)
    }
}
