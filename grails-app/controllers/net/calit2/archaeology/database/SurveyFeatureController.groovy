package net.calit2.archaeology.database

class SurveyFeatureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)

        if (session.site) {
            def max = params.max
            def offset = params.offset ? params.int('offset') : 0
            def sort = params.sort
            def order = params.order
            def countQuery = "select count(*) from SurveyFeature x where x.site.id = ${session.site}"
            def resultCount = SurveyFeature.executeQuery(countQuery)
            def searchQuery
            if (sort && (order == "asc" || order == "desc")) {
                searchQuery = "from SurveyFeature as x where x.site.id = ${session.site} order by x.${sort} ${order}"
            } else {
                searchQuery = "from SurveyFeature as x where x.site.id = ${session.site}"
            }
            def result = SurveyFeature.findAll(searchQuery, ["max":max, "offset":offset])
            [surveyFeatureInstanceList: result, surveyFeatureInstanceTotal: resultCount[0]]
        } else {
            [surveyFeatureInstanceList: SurveyFeature.list(params), surveyFeatureInstanceTotal: SurveyFeature.count()]
        }
    }

    def create = {
        def surveyFeatureInstance = new SurveyFeature()
        surveyFeatureInstance.properties = params
        return [surveyFeatureInstance: surveyFeatureInstance]
    }

    def save = {
        def surveyFeatureInstance = new SurveyFeature(params)
        if (surveyFeatureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), surveyFeatureInstance.id])}"
            redirect(action: "show", id: surveyFeatureInstance.id)
        }
        else {
            render(view: "create", model: [surveyFeatureInstance: surveyFeatureInstance])
        }
    }

    def show = {
        def surveyFeatureInstance = SurveyFeature.get(params.id)
        if (!surveyFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            [surveyFeatureInstance: surveyFeatureInstance]
        }
    }

    def edit = {
        def surveyFeatureInstance = SurveyFeature.get(params.id)
        if (!surveyFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [surveyFeatureInstance: surveyFeatureInstance]
        }
    }

    def update = {
        def surveyFeatureInstance = SurveyFeature.get(params.id)
        if (surveyFeatureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surveyFeatureInstance.version > version) {
                    
                    surveyFeatureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surveyFeature.label', default: 'SurveyFeature')] as Object[], "Another user has updated this SurveyFeature while you were editing")
                    render(view: "edit", model: [surveyFeatureInstance: surveyFeatureInstance])
                    return
                }
            }
            surveyFeatureInstance.properties = params
            if (!surveyFeatureInstance.hasErrors() && surveyFeatureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), surveyFeatureInstance.id])}"
                redirect(action: "show", id: surveyFeatureInstance.id)
            }
            else {
                render(view: "edit", model: [surveyFeatureInstance: surveyFeatureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def surveyFeatureInstance = SurveyFeature.get(params.id)
        if (surveyFeatureInstance) {
            try {
                surveyFeatureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyFeature.label', default: 'SurveyFeature'), params.id])}"
            redirect(action: "list")
        }
    }
}
