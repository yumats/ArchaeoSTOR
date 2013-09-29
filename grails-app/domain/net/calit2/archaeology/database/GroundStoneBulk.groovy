package net.calit2.archaeology.database

class GroundStoneBulk extends Artifact {

    Integer countVessels
    BigDecimal weightVessels
    Integer countHammerStones
    BigDecimal weightHammerStones
    Integer countGrindingTools
    BigDecimal weightGrindingTools
    Integer countPerforated
    BigDecimal weightPerforated
    Integer countOther
    BigDecimal weightOther

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
        countVessels(nullable: true, min: 0)
        weightVessels(nullable: true)
        countHammerStones(nullable: true, min: 0)
        weightHammerStones(nullable: true)
        countGrindingTools(nullable: true, min: 0)
        weightGrindingTools(nullable: true)
        countPerforated(nullable: true, min: 0)
        weightPerforated(nullable: true)
        countOther(nullable: true, min: 0)
        weightOther(nullable: true)
        description(nullable: true)
    }

    String toString() {
        "GroundStone:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setTotalCountAndWeight() {
        def counts = [countVessels, countHammerStones, countGrindingTools, countPerforated, countOther]
        count = 0
        counts.each { if (it) count += it }

        def weights = [weightVessels, weightHammerStones, weightGrindingTools, weightPerforated, weightOther]
        weight = 0.0
        weights.each { if (it) weight += it }
    }
}
