package net.calit2.archaeology.database

class GroundStoneGroove {
    static belongsTo = [groundStoneDiagnostic: GroundStoneDiagnostic]

    BigDecimal length
    BigDecimal width
    BigDecimal depth

    static mapping = {
        id generator:"hilo", params:[max_lo:1]
    }

    static constraints = {
        length(nullable: true)
        width(nullable: true)
        depth(nullable: true)
    }

    String toString() {
        "GroundStoneGroove:${id}"
    }
}
