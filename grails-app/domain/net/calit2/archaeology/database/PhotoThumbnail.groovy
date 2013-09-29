package net.calit2.archaeology.database

class PhotoThumbnail {

    String filename
    String site
    String locus
    String basket
    String sequence
    byte[] image

    static constraints = {
        filename(blak: false, unique: true)
        site(blank: false)
        locus(blank: false)
        basket(blank: false)
        sequence(blank: false)
        image(blank: false)
    }

    String toString() {
        "Photo: ${site}_${locus}_${basket}-${sequence}"
    }
}
