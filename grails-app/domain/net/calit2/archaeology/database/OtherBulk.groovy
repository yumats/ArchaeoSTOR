package net.calit2.archaeology.database

class OtherBulk extends Artifact {

    String dCode

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
        count(nullable: true)
        weight(nullable: true)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        dCode(nullable: true, inList: Constants.ARCH_D_CODE)
    }

    String toString() {
        "Other:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
