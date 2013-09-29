package net.calit2.archaeology.database

class GroundStoneHole {
    static belongsTo = [groundStoneDiagnostic: GroundStoneDiagnostic]

    BigDecimal diameter
    BigDecimal depth
    String crossShape
    String location

    static mapping = {
        id generator:"hilo", params:[max_lo:1]
    }

    static constraints = {
        diameter(nullable: true)
        depth(nullable: true)
        crossShape(nullable: true)
        location(nullable: true)
    }

    String toString() {
        "GroundStoneHole:${id} (${location})"
    }
}
