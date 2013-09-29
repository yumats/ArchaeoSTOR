package net.calit2.archaeology.database

class XrfRaw {

    private static final List FILTER_VALUES = ["", "Red", "Yellow", "Blue", "Green"]
    private static final List COUNT_VALUES = [0, 256, 512, 1024, 2048, 4096, 8192]

    Diagnostic diagnostic
    String filename
    String machineSerialNumber
    String materialType
    Boolean isHeterogeneous
    Boolean isGround
    Integer time
    String filter
    Boolean isVacuumOn
    BigDecimal keyValue
    BigDecimal microAmpsValue
    Integer count
    String notes

    // Raw Data
    BigDecimal elin
    Integer eabs
    BigDecimal fano
    Integer fwhm
    String channels

    static constraints = {
        filename(blank: false, unique: true)
        diagnostic(nullable: true)
        machineSerialNumber(nullable: true)
        materialType(inList: Constants.D_CODE.values() as List)
        isHeterogeneous(nullable: true)
        isGround(nullable: true)
        time(nullable: true)
        filter(inList: FILTER_VALUES)
        isVacuumOn(nullable: true)
        keyValue(nullable: true)
        microAmpsValue(nullable: true)
        count(inList: COUNT_VALUES)
        notes(nullable: true, size: Constants.DESCRIPTION_SIZE)

        channels(nullable: true, size: 0..10240)
    }

    String toString() {
        "XRF:${id} - ${filename}"
    }

    // Element Data
//    Integer elementAc
//    Integer elementAg
//    Integer elementAl
//    Integer elementAm
//    Integer elementAr
//    Integer elementAs
//    Integer elementAt
//    Integer elementAu
//    Integer elementB
//    Integer elementBa
//    Integer elementBe
//    Integer elementBh
//    Integer elementBi
//    Integer elementBk
//    Integer elementBr
//    Integer elementC
//    Integer elementCa
//    Integer elementCd
//    Integer elementCe
//    Integer elementCf
//    Integer elementCl
//    Integer elementCm
//    Integer elementCo
//    Integer elementCn
//    Integer elementCr
//    Integer elementCs
//    Integer elementCu
//    Integer elementDb
//    Integer elementDs
//    Integer elementDy
//    Integer elementEr
//    Integer elementEs
//    Integer elementEu
//    Integer elementF
//    Integer elementFe
//    Integer elementFm
//    Integer elementFr
//    Integer elementGa
//    Integer elementGd
//    Integer elementGe
//    Integer elementH
//    Integer elementHe
//    Integer elementHf
//    Integer elementHg
//    Integer elementHo
//    Integer elementHs
//    Integer elementI
//    Integer elementIn
//    Integer elementIr
//    Integer elementK
//    Integer elementKr
//    Integer elementLa
//    Integer elementLi
//    Integer elementLr
//    Integer elementLu
//    Integer elementMd
//    Integer elementMg
//    Integer elementMn
//    Integer elementMo
//    Integer elementMt
//    Integer elementN
//    Integer elementNa
//    Integer elementNb
//    Integer elementNd
//    Integer elementNe
//    Integer elementNi
//    Integer elementNo
//    Integer elementNp
//    Integer elementO
//    Integer elementOs
//    Integer elementP
//    Integer elementPa
//    Integer elementPb
//    Integer elementPd
//    Integer elementPm
//    Integer elementPo
//    Integer elementPr
//    Integer elementPt
//    Integer elementPu
//    Integer elementRa
//    Integer elementRb
//    Integer elementRe
//    Integer elementRf
//    Integer elementRg
//    Integer elementRh
//    Integer elementRn
//    Integer elementRu
//    Integer elementS
//    Integer elementSb
//    Integer elementSc
//    Integer elementSe
//    Integer elementSg
//    Integer elementSi
//    Integer elementSm
//    Integer elementSn
//    Integer elementSr
//    Integer elementTa
//    Integer elementTb
//    Integer elementTc
//    Integer elementTe
//    Integer elementTh
//    Integer elementTi
//    Integer elementTl
//    Integer elementTm
//    Integer elementU
//    Integer elementUuh
//    Integer elementUun
//    Integer elementUuo
//    Integer elementUup
//    Integer elementUuq
//    Integer elementUus
//    Integer elementUut
//    Integer elementUuu
//    Integer elementV
//    Integer elementW
//    Integer elementXe
//    Integer elementY
//    Integer elementYb
//    Integer elementZn
//    Integer elementZr
}
