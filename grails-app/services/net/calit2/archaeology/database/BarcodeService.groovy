package net.calit2.archaeology.database

import com.itextpdf.text.Document
import com.itextpdf.text.PageSize
import com.itextpdf.text.Rectangle
import com.itextpdf.text.pdf.Barcode39
import com.itextpdf.text.pdf.Barcode128
import com.itextpdf.text.pdf.BaseFont
import com.itextpdf.text.pdf.PdfWriter

/**
 * Service to generate various barcode in PDF
 *
 * User: yuma
 * Date: 8/4/11
 * Time: 3:08 PM
 */
class BarcodeService {

    private static final Number LABEL_DPI = 72
    private static final Number LABEL_WIDTH = 3.5
    private static final Number LABEL_HEIGHT = 1.125

    void printLabels(List info, int fontSize, def response) { // info: [[code, firstLine, secondLine], ...]
        def byteOut = new ByteArrayOutputStream()
        def pageSize = new Rectangle(LABEL_WIDTH * LABEL_DPI as float, LABEL_HEIGHT * LABEL_DPI as float)
        def doc = new Document(pageSize, 0, 0, 0, 0)
        def writer = PdfWriter.getInstance(doc, byteOut)
        doc.open()
        def content = writer.getDirectContent()

        info.each {
            def barcode = new Barcode39()
            barcode.setCode(it[0])
            def image = barcode.createImageWithBarcode(content, null, null)
            content.addImage(image, image.width * 2.5 as float, 0f, 0f, image.height * 1.25 as float, 30f, (doc.top() - 80) as float)

            def font = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.WINANSI, false)
            content.setFontAndSize(font, fontSize)
            content.beginText()
            content.moveText(30f, (doc.top() - 15) as float)
            content.showText(it[1])
            content.endText()

            content.beginText()
            content.moveText(30f, (doc.top() - 30) as float)
            content.showText(it[2])
            content.endText()
            
            doc.newPage()
        }

        doc.close()
        response.contentType = "application/pdf"
        response.contentLength = byteOut.size()
        response.outputStream << byteOut.toByteArray()
        response.outputStream.flush()
    }

    void printArtifact(Artifact artifact, def response) {
        def year = (artifact?.year) ? artifact?.year as String : ""
        def first = "EDM:${artifact?.edm} Basket:${artifact?.basket} Locus:${artifact?.locus} Area:${artifact?.area}"
        def second = "Site:${artifact?.site} DC:${artifact?.type} Year:${year}"
        printLabels([[artifact.id as String, first, second]], 10, response)
    }

    void printDiagnostic(Diagnostic diagnostic, def response) {
        printAllDiagnostics([diagnostic], response)
    }

    void printAllDiagnostics(def diagnostics, def response) {
        def info = []
        diagnostics.each { diagnostic ->
            def registration = (diagnostic?.registration) ? diagnostic?.registration as String : ""
            def bulk = diagnostic?.artifact
            def year = (bulk?.year) ? bulk?.year as String : ""
            def feature = (bulk?.surveyFeature) ? bulk?.surveyFeature.toString() : ""
            def first = "Basket:${bulk?.basket} Locus:${bulk?.locus} Feature:${feature}"
            def siteInfo = (year == "") ? bulk?.site : "${bulk?.site} (${year})"
            def second = "Reg:${registration}   ${siteInfo}"
            info << [diagnostic.id as String, first, second]
        }
        printLabels(info, 10, response)
    }

    void printSheet(List list, def response) {
        def byteOut = new ByteArrayOutputStream()
        def doc = new Document(PageSize.LETTER, 0, 0, 0, 0)
        def writer = PdfWriter.getInstance(doc, byteOut)
        doc.open()
        def content = writer.getDirectContent()
        def topMargin = 120

        list.each {
            if (it) {
                def barcode = new Barcode128()
                barcode.setCode(it)
                def image = barcode.createImageWithBarcode(content, null, null)
                content.addImage(image, image.width * 1.5 as float, 0f, 0f, image.height * 1.5 as float, 70f, (doc.top() - topMargin) as float)
                topMargin += 80
            }
        }

        doc.close()
        response.contentType = "application/pdf"
        response.contentLength = byteOut.size()
        response.outputStream << byteOut.toByteArray()
        response.outputStream.flush()
    }
}
