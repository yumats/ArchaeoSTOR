package net.calit2.archaeology.database

class GlassBulk extends Artifact {

    Integer bulkCount
    BigDecimal bulkWeight
    Integer diagnosticCount
    BigDecimal diagnosticWeight

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
        bulkCount(nullable: true, min: 0)
        bulkWeight(nullable: true)
        diagnosticCount(nullable: true, min: 0)
        diagnosticWeight(nullable: true)
    }

    String toString() {
        "Glass:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [bulkCount, diagnosticCount]
        count = 0
        counts.each { if (it) count += it }

        def weights = [bulkWeight, diagnosticWeight]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
