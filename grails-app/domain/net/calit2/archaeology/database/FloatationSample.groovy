package net.calit2.archaeology.database

class FloatationSample extends Artifact {

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
    }

    String toString() {
        "FloatationSample:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
