package net.calit2.archaeology.database

class Crate {

    static hasMany = [artifacts: Artifact]

    String number
    Site site
    Integer year
    String locationField
    String locationSanDiego
    String contents

    static mapping = {
        id generator:"hilo", params:[max_lo:1]
    }

    static constraints = {
        number(blank: false)
        site(nullable: true)
        year(nullable: true)
        locationField(inList: Constants.LOCATIONS_FIELD)
        locationSanDiego(inList: Constants.LOCATIONS_SD)
        contents(nullable: true)
    }

    String toString() {
        "#${number}"
    }
}
