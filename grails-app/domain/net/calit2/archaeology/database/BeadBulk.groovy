package net.calit2.archaeology.database

class BeadBulk extends Artifact {

    String material

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
        material(nullable: true, size: Constants.DESCRIPTION_SIZE)
    }

    String toString() {
        "Bead:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
