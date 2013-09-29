package net.calit2.archaeology.database

class PotteryDiagnostic extends Diagnostic {
    private static final List ILLUSTRATIONS = ["", "Nothing", "To be drawn", "Drawn"]
    private static final List RIM_ANGLES = ["", "Inverted", "Everted", "Plain"]
    static final List RIM_TREATMENTS = ["", "Thinned", "Thickened", "Collared", "Plain", "Squared", "T-Shaped", "S-Shaped", "Flanged", "Ledged", "Groved", "Rolled Out", "Rolled In", "Curved", "Beveled", "Triangle"]
//    private static final List RIM_THICKENING = ["", "Interior", "Slight Interior", "None", "Slight Exterior", "Exterior"]
    private static final List HANDLE_TYPES = ["", "Strap", "Ledgehandle", "Loop", "Lug", "Other"]

    String generalType
    String type

    // Basic Information
    String illustration
    String fabric
    String ware
    String exterior
    String interior
    String core
    
    // Rim
    BigDecimal rimDiameter
    BigDecimal rimThickness
    BigDecimal rimComplete
    String rimAngle
    String rimTreatment
    
    // Handle
    String attachmentPoint
    String handleType
    BigDecimal handleThickness
    Boolean isLedgeCut
    Integer rippleCount
    
    // Base
    BigDecimal basalDiameter
    BigDecimal baseComplete
    BigDecimal angleOpening
    
    // Lid
    BigDecimal lidDiameter
    BigDecimal lidThickness
    
    // Decorative
    Boolean isPainted // Dependant on next two, if either yes, then yes
    Boolean isPaintedInside
    Boolean isPaintedOutside
    Boolean isSlipped // Dependant on next two, if either yes, then yes
    Boolean isSlippedInside
    Boolean isSlippedOutside
    Boolean isBurnished // Dependant on next two, if either yes, then yes
    Boolean isBurnishedInside
    Boolean isBurnishedOutside
    Boolean isGlazed
    Boolean isGlazedInside
    Boolean isGlazedOutside
    String insideColor
    String outsideColor
    String designDescription
    Boolean isPlasticApplication
    String plasticDescription
    Boolean isIncised
    String incisedDescription

    static constraints = {
        registration(blank: false, min: 0)
        artifact(nullable: true)
        generalType(nullable: true)
        type(nullable: true)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        period(inList: Constants.PERIODS)
        illustration(inList: ILLUSTRATIONS)
        fabric(nullable: true)
        ware(nullable: true)
        exterior(nullable: true)
        interior(nullable: true)
        core(nullable: true)

        rimDiameter(nullable: true)
        rimThickness(nullable: true)
        rimComplete(nullable: true)
        rimAngle(inList: RIM_ANGLES)
        rimTreatment(inList: RIM_TREATMENTS)

        attachmentPoint(nullable: true)
        handleType(inList: HANDLE_TYPES)
        handleThickness(nullable: true)
        isLedgeCut(nullable: true)
        rippleCount(nullable: true)

        basalDiameter(nullable: true)
        baseComplete(nullable: true)
        angleOpening(nullable: true)

        lidDiameter(nullable: true)
        lidThickness(nullable: true)

        isPainted(nullable: true)
        isPaintedInside(nullable: true)
        isPaintedOutside(nullable: true)
        isSlipped(nullable: true)
        isSlippedInside(nullable: true)
        isSlippedOutside(nullable: true)
        isBurnished(nullable: true)
        isBurnishedInside(nullable: true)
        isBurnishedOutside(nullable: true)
        isGlazed(nullable: true)
        isGlazedInside(nullable: true)
        isGlazedOutside(nullable: true)
        insideColor(nullable: true)
        outsideColor(nullable: true)
        designDescription(nullable: true)
        isPlasticApplication(nullable: true)
        plasticDescription(nullable: true)
        isIncised(nullable: true)
        incisedDescription(nullable: true)

        xrfRaws(nullable: true)
        ftirRaws(nullable: true)
    }

    String toString() {
        "PotteryDiagnostic:${id}"
    }

    void setDependentValues() {
        isPainted = isPaintedInside | isPaintedOutside
        isSlipped = isSlippedInside | isSlippedOutside
        isBurnished = isBurnishedInside | isBurnishedOutside
        isGlazed = isGlazedInside | isGlazedOutside
    }
}
