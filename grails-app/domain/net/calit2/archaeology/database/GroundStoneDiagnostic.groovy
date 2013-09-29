package net.calit2.archaeology.database

class GroundStoneDiagnostic extends Diagnostic {

    static final CATEGORIES = ["Hammer Stone","Bead Shaper","Shaft Straightener","Perforated","Pendant","Pestle","Grinding Slab","Handstone","Cuphole","Weight","Mortar Bowl","Other"]

    static hasMany = [grooves: GroundStoneGroove, holes: GroundStoneHole]

    // Integer bagNumber // ???
    // Integer boxNumber // ???
    // Integer pointNumber // ???

    String category
    String type
    String subType
    Boolean isBroken
    String material
    BigDecimal length
    BigDecimal width
    BigDecimal thickness
    BigDecimal weight
    BigDecimal diameter // including perforationDiameter
    BigDecimal height

    String crossSection // hammer, perforated, pendant, pestles, handstone, cuphole
    String shape // bead, shaft, handstone, cuphole
    String workSurfaceNumber // pestle, handstone
    String workSurfaceShape // pestle, handstone
    Integer percent // HammerStone, MortarBowl

    // Hammer Stone
    Boolean isSpheroid
    Boolean isCuboid
    Boolean isCombined
    Boolean isIrregular
    Boolean isPyramidical
    Boolean isSmall
    Integer flatSides
    Boolean isGriding

    // Bead Shaper & Shaft Straightener
    String outline
    String surface
    Integer totalGrooves
    Boolean hasGroovesSameSide
    String grooveShape
    String grooveDepth

    // Perforated & Pendant
    Boolean isBiConical
    Boolean isConical
    Boolean isStraight
    String typeNumber

    // Pestle
    String transverse

    // Grinding Slab

    // Handstone
    String overallDimension

    // Cuphole
    Integer totalCupholes

    // Other

    // Weight
    BigDecimal circum

    // Mortar Bowl
    Boolean isGlobular
    Boolean isAngledUpright
    Boolean isPlatter
    Boolean isFlatBase
    Boolean isSolidFoot
    Boolean isFashionedRim
    Boolean isStraightThinWall
    Boolean isSmallBowl
    Boolean isSmallPlatter

    Boolean isPlatterAMortar
    Boolean isPlatterBMortar
    Boolean isRobust
    Boolean isMultiUse
    Boolean isGlobularMortar
    Boolean isShallowBowlMortar
    Boolean isMortars
    Boolean isSmallCobbleMortar
    Boolean isSmallMortar
    Boolean isSmallShallowMortar
    Boolean isMiniatureMortar

    Boolean hasDecoration

    Boolean isRim
    Boolean isBase
    Boolean isMid

    Boolean isGrinding
    Boolean isPecking
    Boolean isPounding
    Boolean isIncising

    static constraints = {
        registration(nullable: true, min: 0)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
    }

    String toString() {
        "GroundStoneDiagnostic:${id}"
    }
}
