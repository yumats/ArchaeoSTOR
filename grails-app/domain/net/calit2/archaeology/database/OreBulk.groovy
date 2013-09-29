package net.calit2.archaeology.database

class OreBulk extends Artifact {

    Integer countSmall
    BigDecimal weightSmall
    Integer countMedium
    BigDecimal weightMedium
    Integer countLarge
    BigDecimal weightLarge

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
        countSmall(nullable: true, min: 0)
        weightSmall(nullable: true)
        countMedium(nullable: true, min: 0)
        weightMedium(nullable: true)
        countLarge(nullable: true, min: 0)
        weightLarge(nullable: true)
        description(nullable: true)
    }

    String toString() {
        "Ore:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [countSmall, countMedium, countLarge]
        count = 0
        counts.each { if (it) count += it }

        def weights = [weightSmall, weightMedium, weightLarge]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
