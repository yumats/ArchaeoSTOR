package net.calit2.archaeology.database

class FtirRaw {

    Diagnostic diagnostic
    String filename
    byte[] content

    static constraints = {
        diagnostic(nullable: true)
        filename(blank: false, unique: true)
        content(blank: false)
    }

    String toString() {
        "FTIR:${id} - ${filename}"
    }
}
