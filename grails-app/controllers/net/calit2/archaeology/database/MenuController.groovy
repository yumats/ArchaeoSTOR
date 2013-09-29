package net.calit2.archaeology.database

class MenuController {

    def index = {
        if (params.site) {
            session.site = params.site
        } else {
            session.site = ""
        }

        if (params.institution) {
            session.institution = params.institution
        } else {
            session.institution = "UCSD"
        }

        render(view:"index")
    }

    def saveSession = {
        if (params.artifact != null) {
            session.artifact = params.artifact
        }

        render(text:"artifact: ${params.artifact}")
    }
}
