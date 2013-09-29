package net.calit2.archaeology.database

class CoinBulk extends Artifact {

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
        period(inList: Constants.PERIODS)
    }

    String toString() {
        "Coin:${id} - EDM:${edm} Basket:${basket} Locus:${locus}"
    }
}
