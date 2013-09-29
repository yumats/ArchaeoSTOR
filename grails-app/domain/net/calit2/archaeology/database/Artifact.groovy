package net.calit2.archaeology.database

class Artifact {

//    static searchable = true
    static belongsTo = [site: Site]
    static hasMany = [diagnostics: Diagnostic]

    Integer year
    String date
    String type
    String area
    String edm
    String basket
    String locus
    SurveyFeature surveyFeature
    Integer count          // Aggregated count
    BigDecimal weight      // Aggregated weight
    String description
    String period
    String storageField
    String storageSanDiego
    Crate crate
//    String crateNumber // Obsolete

    static mapping = {
        id generator:"hilo", params:[max_lo:1]
    }

    static constraints = {
        year(nullable: true, min: 1900)
        date(nullable: true)
        site(nullable: true)
        type(inList: Constants.D_CODE.values() as List)
        area()
        edm(blank: false)
        basket(blank: false)
        locus(blank: false)
        surveyFeature(nullable: true)
        crate(nullable: true)
        diagnostics(nullable: true)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        period(inList: Constants.PERIODS)
        storageField(inList: Constants.LOCATIONS_FIELD)
        storageSanDiego(inList: Constants.LOCATIONS_SD)
        count(nullable: true)
        weight(nullable: true)
    }

    String toString() {
        "Artifact:${id} - Type:${type} EDM:${edm} Basket:${basket} Locus:${locus}"
    }

    void setStorageFromCrate() {
        if (crate) {
            storageField = crate.locationField
            storageSanDiego = crate.locationSanDiego
        } else {
            storageField = ""
            storageSanDiego = ""
        }
    }

    Boolean isDiagnostic() {
        def className = this.class.getName().split("\\.")
        def name = className[className.length - 1]
        def code = Constants.D_CODE[name - "Bulk"]
        return code && code.length() == 2
    }
}
