package net.calit2.archaeology.database

import org.joda.time.DateTime

class RadioCarbonDiagnostic extends Diagnostic {

    String labNumber
    String sampleMaterial
    String species
    Integer dateBp
    Integer uncertainty
    DateTime timestamp
    Integer unmodelledOneSigFrom
    Integer unmodelledOneSigTo
    Integer unmodelledTwoSigFrom
    Integer unmodelledTwoSigTo

    static constraints = {
        labNumber(blank: false)
        sampleMaterial(nullable: true)
        species(nullable: true)
        dateBp(nullable: true, min: 0)
        uncertainty(nullable: true, min: 0)
        timestamp(nullable: true)
        unmodelledOneSigFrom(nullable: true)
        unmodelledOneSigTo(nullable: true)
        unmodelledTwoSigFrom(nullable: true)
        unmodelledTwoSigTo(nullable: true)
    }

    String toString() {
        "RadioCarbonDiagnostic:${id} - Lab#:${labNumber}"
    }

    static List listSites() {
        def sites = [] as Set
        RadioCarbonDiagnostic.list().each {
            def site = it.artifact.site
            if (site) {
                sites << site
            }
        }
        return sites as List
    }
}
