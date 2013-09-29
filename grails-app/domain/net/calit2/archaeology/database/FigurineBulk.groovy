package net.calit2.archaeology.database

class FigurineBulk extends Artifact {
    static List FIGURINE_TYPES = ['', 'animal', 'human', 'unknown', 'other']

    String figurineType

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
        figurineType(inList: FIGURINE_TYPES)
    }

    String toString() {
        "Figurine:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
