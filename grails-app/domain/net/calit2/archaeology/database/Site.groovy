package net.calit2.archaeology.database

import groovy.sql.Sql
import com.vividsolutions.jts.geom.Point
import org.hibernatespatial.postgis.PGGeometryUserType

class Site {
    private static final Integer DEFAULT_SRID = 32636

    static final Map SRIDS = [
            0: "",
            28193: "28193: Israeli CS Grid",
            32636: "32636: UTM 36N"]

    static final List VERIFICATION_NUMBERS = 0..7

    static final List VERIFICATION_KNOWLEDGE = [
            "0: No evidence",
            "1: Some evidence or transitional, no knowledge of artifact type",
            "2: Definite no knowledge of artifact type",
            "3: Definite Lithic",
            "4: Definite Pottery",
            "5: Definite Pottery and Lithic",
            "6: Radiocarbon",
            "7: Unknown"]

    static hasMany = [artifacts:Artifact, surveyFeatures:SurveyFeature]

    static mapping = {
        geometry type:PGGeometryUserType
    }

    def dataSource

    Point geometry
    BigDecimal northing  // Geospatial
    BigDecimal easting   // Geospatial
    BigDecimal latitude  // Geospatial
    BigDecimal longitude // Geospatial
    BigDecimal elevation // Geospatial
    Integer srid         // Geospatial
    String name
    String linkName
    String otherNames
    String number
    String majorPeriods
    String otherPeriods
    Integer type         // TODO Needs a explaining table
    Integer type2
    Integer type3
    String description
    String surveyors
    String excavationInstitution
    String permitNumber
    String publicationBibliography
    String collectionStrategy
    Integer paleolithic
    Integer natufian
    Integer neo
    Integer ppn
    Integer ppna
    Integer ppnbc
    Integer pn
    Integer prehistoric
    Integer chal
    Integer eb
    Integer eb1
    Integer eb23
    Integer ib
    Integer mb
    Integer mb2a
    Integer mb2bc
    Integer lb
    Integer ia
    Integer ia1
    Integer ia2
    Integer ia3
    Integer classical
    Integer hel
    Integer rom
    Integer erom
    Integer lrom
    Integer byz
    Integer ebyz
    Integer lbyz
    Integer islamic
    Integer ei
    Integer mi1
    Integer mi23
    Integer li
    Integer mandateModern
    String comments

    static constraints = {
        geometry(nullable: true)
        northing(nullable: true)
        easting(nullable: true)
        latitude(nullable: true)
        longitude(nullable: true)
        elevation(nullable: true)
        srid(blank: false)
        name(blank: false)
        linkName(nullable: true)
        otherNames(nullable: true)
        number(blank: false)
        majorPeriods(nullable: true)
        otherPeriods(nullable: true)
        type(nullable: true)
        type2(nullable: true)
        type3(nullable: true)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        surveyors(nullable: true)
        excavationInstitution(nullable: true)
        permitNumber(nullable: true)
        publicationBibliography(nullable: true)
        collectionStrategy(nullable: true)
        paleolithic(range: VERIFICATION_NUMBERS)
        natufian(range: VERIFICATION_NUMBERS)
        neo(range: VERIFICATION_NUMBERS)
        ppn(range: VERIFICATION_NUMBERS)
        ppna(range: VERIFICATION_NUMBERS)
        ppnbc(range: VERIFICATION_NUMBERS)
        pn(range: VERIFICATION_NUMBERS)
        prehistoric(range: VERIFICATION_NUMBERS)
        chal(range: VERIFICATION_NUMBERS)
        eb(range: VERIFICATION_NUMBERS)
        eb1(range: VERIFICATION_NUMBERS)
        eb23(range: VERIFICATION_NUMBERS)
        ib(range: VERIFICATION_NUMBERS)
        mb(range: VERIFICATION_NUMBERS)
        mb2a(range: VERIFICATION_NUMBERS)
        mb2bc(range: VERIFICATION_NUMBERS)
        lb(range: VERIFICATION_NUMBERS)
        ia(range: VERIFICATION_NUMBERS)
        ia1(range: VERIFICATION_NUMBERS)
        ia2(range: VERIFICATION_NUMBERS)
        ia3(range: VERIFICATION_NUMBERS)
        classical(range: VERIFICATION_NUMBERS)
        hel(range: VERIFICATION_NUMBERS)
        rom(range: VERIFICATION_NUMBERS)
        erom(range: VERIFICATION_NUMBERS)
        lrom(range: VERIFICATION_NUMBERS)
        byz(range: VERIFICATION_NUMBERS)
        ebyz(range: VERIFICATION_NUMBERS)
        lbyz(range: VERIFICATION_NUMBERS)
        islamic(range: VERIFICATION_NUMBERS)
        ei(range: VERIFICATION_NUMBERS)
        mi1(range: VERIFICATION_NUMBERS)
        mi23(range: VERIFICATION_NUMBERS)
        li(range: VERIFICATION_NUMBERS)
        mandateModern(range: VERIFICATION_NUMBERS)
        comments(nullable: true, size: Constants.DESCRIPTION_SIZE)
    }

    String toString() {
        "${name}"
    }

    void updateGeometry() {
        if (srid && northing && easting) {
            def sql = new Sql(dataSource)
            def query
            if (srid == DEFAULT_SRID) {
                query = "UPDATE site SET geometry = ST_SetSRID(ST_Point(${easting}, ${northing}), ${srid}) WHERE id = ${id}"
            } else {
                query = "UPDATE site SET geometry = ST_Transform(ST_SetSRID(ST_Point(${easting}, ${northing}), ${srid}), ${DEFAULT_SRID}) WHERE id = ${id}"
            }

            sql.execute(query)
        }
    }

    static List getInstitutions() {
        def institutions = list().collect { site ->
            site.excavationInstitution
        } as Set
        institutions.remove(null)
        return institutions as List
    }
}
