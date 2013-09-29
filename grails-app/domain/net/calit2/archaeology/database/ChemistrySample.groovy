package net.calit2.archaeology.database

class ChemistrySample extends Artifact {

    String sampleNumber

    static constraints = {
        year(nullable:true)
        date(nullable:true)
        site(nullable: true)
        area()
        edm(blank: false)
        basket(blank: false)
        locus(blank: false)
        surveyFeature(nullable: true)
        crate(nullable: true)
        sampleNumber(nullable: true)
    }

    String toString() {
        "ChemistrySample:${id} - #${sampleNumber}"
    }
}
