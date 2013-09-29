package net.calit2.archaeology.database

import groovy.sql.Sql

/**
 * Service to interact with ArchField data
 *
 * User: yuma
 * Date: 10/24/11
 * Time: 12:53 AM
 */
class ArchDataService {

    Map getDataWithBarcode(String barcode) {
        /**if (barcode.length() != 14) {
            return null
        }
        */

        def db = Sql.newInstance(
            'jdbc:postgresql://192.168.1.2:5432/archfield',
            'grails',
            'grails',
            'org.postgresql.Driver')

        // TODO Dirty Hack: Query 3 fixed tables
        def query = makeQuery('kf201216_a', barcode)
        def result = db.firstRow(query)
        if (result == null) {
            query = makeQuery('kf201116_a', barcode)
            result = db.firstRow(query)
        }
        if (result == null) {
            query = makeQuery('kf201218_a',barcode)
            result = db.firstRow(query)
        }

        return result
    }

    private String makeQuery(String table, String barcode) {
        return """
            SELECT year, date, area, edm, basket, locus FROM ${table}
            WHERE barcode LIKE '${barcode}'
        """ as String
    }
}
