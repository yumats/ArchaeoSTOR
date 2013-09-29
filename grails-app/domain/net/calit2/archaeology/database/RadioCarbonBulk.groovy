package net.calit2.archaeology.database

class RadioCarbonBulk extends Artifact {

//    Integer maxBp
//    Integer minBp

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
        count(nullable: true, min: 0)
        weight(nullable: true)
//        maxBp(nullable: true, min: 0)
//        minBp(nullable: true, min: 0)
    }

    String toString() {
        "RadioCarbon:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
