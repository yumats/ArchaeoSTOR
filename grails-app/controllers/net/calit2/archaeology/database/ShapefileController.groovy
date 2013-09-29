package net.calit2.archaeology.database

class ShapefileController {

    private static final String WORK_DIR = "/tmp"
    private static final String SHP2PGSQL = "/usr/bin/shp2pgsql"
    private static final String PSQL = "/usr/bin/psql"
    private static final String DB_USER = "grails"
    private static final String DB_PASS = "grails"

    def index = {}

    def upload = {
        def srid = params.srid
        def dbfFile = request.getFile("dbfFile")
        def prjFile = request.getFile("prjFile")
        def shpFile = request.getFile("shpFile")
        def shxFile = request.getFile("shxFile")
        if (srid && srid != "0" && !dbfFile.empty && !shpFile.empty && !shxFile.empty) {
            String filename = shpFile.originalFilename.split("\\.")[0]
            filename = filename.replaceAll(" ", "_")
            filename = filename.replaceAll(".") { it.toLowerCase() }
            dbfFile.transferTo(new File("${WORK_DIR}/${filename}.dbf"))
            if (prjFile) {
                prjFile.transferTo(new File("${WORK_DIR}/${filename}.prj"))
            }
            shpFile.transferTo(new File("${WORK_DIR}/${filename}.shp"))
            shxFile.transferTo(new File("${WORK_DIR}/${filename}.shx"))

            // Convert and import shapefile
            // TODO security consideration
            def p = "${SHP2PGSQL} -s ${srid} ${WORK_DIR}/${filename}.shp".execute()
            //p.waitFor()
            if (p.exitValue() == 0) {
                new File("${WORK_DIR}/${filename}.sql").write(p.in.text)
                "${PSQL} --no-password -q -f ${WORK_DIR}/${filename}.sql -U ${DB_USER} ${DB_PASS}".execute()
            } else {
                flash.message = "Could not process the shapefile."
                redirect(action: "index")
            }
        }
        else {
            flash.message = "File and SRID cannot be empty."
            redirect(action: "index")
        }
    }
}
