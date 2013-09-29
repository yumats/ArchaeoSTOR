package net.calit2.archaeology.database

import com.vividsolutions.jts.geom.Geometry
import org.hibernatespatial.postgis.PGGeometryUserType

class SurveyFeature {

    static belongsTo = [site: Site]

    static mapping = {
        spatialData type:PGGeometryUserType
    }
    
    String name
    String number
    String description
    String areaDescription
    String function    // TODO From list?
    Geometry spatialData

    static constraints = {
        site(nullable: true)
        name(blank: false)
        number(blank: false)
        description(nullable: true, size: Constants.DESCRIPTION_SIZE)
        areaDescription(nullable: true, size: Constants.DESCRIPTION_SIZE)
        function(nullable: true)
        spatialData(nullable: true)
    }

    String toString() {
        "${id}:${name}:${number}"
    }
}
