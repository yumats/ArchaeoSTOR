package net.calit2.archaeology.database

class Diagnostic {

//    static searchable = true
    static belongsTo = [artifact: Artifact]
    static hasMany = [xrfRaws: XrfRaw, ftirRaws: FtirRaw]

    Integer registration
    String period
    String description

    static constraints = {
        registration(nullable: true, min: 0)
        artifact(nullable: true)
        period(inList: Constants.PERIODS)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        xrfRaws(nullable: true)
        ftirRaws(nullable: true)
    }

    static mapping = {
        id generator:"hilo", params:[max_lo:1]
    }

    String toString() {
        "Diagnostic:${id}"
    }
}
