package net.calit2.archaeology.database

class XrfArtax {

    static hasMany = [xrfRaws: XrfRaw]

    String method
    String values
    byte[] file

    static constraints = {
        method(nullable: true)
        values(nullable: true)
        xrfRaws(nullable: true)
    }

    String toString() {
        "XrfArtax:${id}"
    }
}
