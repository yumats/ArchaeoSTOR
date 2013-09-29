package net.calit2.archaeology.database

class PotteryBulk extends Artifact {

    Integer handmadeCount
    BigDecimal handmadeWeight
    Integer wheelmadeCount
    BigDecimal wheelmadeWeight
    Integer cookingCount
    BigDecimal cookingWeight
    Integer handlesCount
    BigDecimal handlesWeight
    Integer basesCount
    BigDecimal basesWeight
    Integer decorCount
    BigDecimal decorWeight
    Integer diagnosticCount
    BigDecimal diagnosticWeight
    Integer otherSpecialCount
    BigDecimal otherSpecialWeight

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
//        crateNumber(nullable: true) // Obsolete
        count(nullable: true)
        weight(nullable: true)
        handmadeCount(nullable: true, min: 0)
        handmadeWeight(nullable: true)
        wheelmadeCount(nullable: true, min: 0)
        wheelmadeWeight(nullable: true)
        cookingCount(nullable: true, min: 0)
        cookingWeight(nullable: true)
        handlesCount(nullable: true, min: 0)
        handlesWeight(nullable: true)
        basesCount(nullable: true, min: 0)
        basesWeight(nullable: true)
        decorCount(nullable: true, min: 0)
        decorWeight(nullable: true)
        diagnosticCount(nullable: true, min: 0)
        diagnosticWeight(nullable: true)
        otherSpecialCount(nullable: true, min: 0)
        otherSpecialWeight(nullable: true)
    }

    String toString() {
        "Pottery:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [basesCount, cookingCount, decorCount, diagnosticCount, handlesCount, handmadeCount, otherSpecialCount, wheelmadeCount]
        count = 0
        counts.each { if (it) count += it }

        def weights = [basesWeight, cookingWeight, decorWeight, diagnosticWeight, handlesWeight, handmadeWeight, otherSpecialWeight, wheelmadeWeight]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
