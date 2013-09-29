package net.calit2.archaeology.util

class MapLink {

    String layer
    BigDecimal minX
    BigDecimal minY
    BigDecimal maxX
    BigDecimal maxY

    static constraints = {
        layer(blank: false)
        minX()
        minY()
        maxX()
        maxY()
    }

    String toString() {
        "${layer}"
    }
}
