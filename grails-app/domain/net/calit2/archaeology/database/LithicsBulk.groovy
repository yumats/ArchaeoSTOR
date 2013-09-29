package net.calit2.archaeology.database

class LithicsBulk extends Artifact {

    Integer countDebitage
    BigDecimal weightDebitage
    Integer countCores
    BigDecimal weightCores
    Integer countTools
    BigDecimal weightTools

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
        countDebitage(nullable: true, min: 0)
        weightDebitage(nullable: true)
        countCores(nullable: true, min: 0)
        weightCores(nullable: true)
        countTools(nullable: true, min: 0)
        weightTools(nullable: true)
        description(nullable: true)
    }

    String toString() {
        "Lithics:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [countDebitage, countCores, countTools]
        count = 0
        counts.each { if (it) count += it }

        def weights = [weightDebitage, weightCores, weightTools]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
