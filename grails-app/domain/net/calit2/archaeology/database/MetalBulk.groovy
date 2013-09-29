package net.calit2.archaeology.database

class MetalBulk extends Artifact {
    static final List METAL_TYPES = ['', 'bronze', 'copper', 'gold', 'iron', 'lead', 'silver', 'other']

    Integer countLumps
    BigDecimal weightLumps
    Integer countObject
    BigDecimal weightObject
    String metalType

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
        countLumps(nullable: true, min: 0)
        weightLumps(nullable: true)
        countObject(nullable: true, min: 0)
        weightObject(nullable: true)
        metalType(inList: METAL_TYPES)
        description(nullable: true)
    }

    String toString() {
        "Metal:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [countLumps, countObject]
        count = 0
        counts.each { if (it) count += it }

        def weights = [weightLumps, weightObject]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
