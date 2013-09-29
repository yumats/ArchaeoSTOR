package net.calit2.archaeology.database

import grails.converters.JSON
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import javax.servlet.http.HttpServletRequest

class PhotoThumbnailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    private static final String FILE_PARAM = "qqfile" // Ajax uploader parameter

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

//        if (session.site) {
//            def max = params.max
//            def offset = params.offset ? params.int('offset') : 0
//            def countQuery = "select count(*) from PhotoThumbnail x where x.site.id = ${session.site}" // Need to customize
//            def resultCount = PhotoThumbnail.executeQuery(countQuery)
//            def searchQuery = "from PhotoThumbnail as x where x.site.id = ${session.site}" // Need to customize
//            def result = PhotoThumbnail.findAll(searchQuery, ["max":max, "offset":offset])
//            [photoThumbnailInstanceList: result, photoThumbnailInstanceTotal: resultCount[0]]
//        } else {
//            [photoThumbnailInstanceList
// : PhotoThumbnail.list(params), photoThumbnailInstanceTotal: PhotoThumbnail.count()]
//        }

        [photoThumbnailInstanceList: PhotoThumbnail.list(params), photoThumbnailInstanceTotal: PhotoThumbnail.count()]
    }

    def create = {
        def photoThumbnailInstance = new PhotoThumbnail()
        photoThumbnailInstance.properties = params
        return [photoThumbnailInstance: photoThumbnailInstance]
    }

    def save = {
        def photoThumbnailInstance = new PhotoThumbnail(params)

        if (photoThumbnailInstance.save(flush: true)) {
            //flash.message = "${message(code: 'default.created.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), photoThumbnailInstance.id])}"
            //redirect(action: "show", id: photoThumbnailInstance.id)
            render(text: [success:true] as JSON, contentType:'text/json')
        }
        else {
            //render(view: "create", model: [photoThumbnailInstance: photoThumbnailInstance])
            render(text: [success:false] as JSON, contentType:'text/json')
        }
    }

    def show = {
        def photoThumbnailInstance = PhotoThumbnail.get(params.id)
        if (!photoThumbnailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
            redirect(action: "list")
        }
        else {
            [photoThumbnailInstance: photoThumbnailInstance]
        }
    }

    def edit = {
        def photoThumbnailInstance = PhotoThumbnail.get(params.id)
        if (!photoThumbnailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [photoThumbnailInstance: photoThumbnailInstance]
        }
    }

    def update = {
        def photoThumbnailInstance = PhotoThumbnail.get(params.id)
        if (photoThumbnailInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (photoThumbnailInstance.version > version) {
                    
                    photoThumbnailInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail')] as Object[], "Another user has updated this PhotoThumbnail while you were editing")
                    render(view: "edit", model: [photoThumbnailInstance: photoThumbnailInstance])
                    return
                }
            }
            photoThumbnailInstance.properties = params

            if (!photoThumbnailInstance.hasErrors() && photoThumbnailInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), photoThumbnailInstance.id])}"
                redirect(action: "show", id: photoThumbnailInstance.id)
            }
            else {
                render(view: "edit", model: [photoThumbnailInstance: photoThumbnailInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def photoThumbnailInstance = PhotoThumbnail.get(params.id)
        if (photoThumbnailInstance) {
            try {
                photoThumbnailInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'photoThumbnail.label', default: 'PhotoThumbnail'), params.id])}"
            redirect(action: "list")
        }
    }

    def search = {
        return create()
    }

    def query = {
        def condition = [:]
        params.each { key, value ->
            if (value && !(value instanceof Map)) {
                if (!key.startsWith("_") && key != "action" && key != "controller") {
                    if (key.endsWith("id")) {
                        condition.put(key, value as Long)
                    } else if (key == "site") {
                        condition.put(key, value.toUpperCase())
                    } else {
                        condition.put(key, value)
                    }
                }
            }
        }
        def results
        if (condition.size != 0) {
            results = PhotoThumbnail.findAllWhere(condition)
        }
        def resultsNum = results ? results.size() : 0
        flash.message = resultsNum + " Results " + condition
        render(view:"list", model:[photoThumbnailInstanceList:results, photoThumbnailInstanceTotal: resultsNum])
    }

    def upload = {
        def filename = params[FILE_PARAM]
        def matcher = (filename =~ /^(\S+)_(\d+)_(\d+)[_,-](\d+|\d+-\d+)\.(jpg|JPG)$/)
        if (matcher) {
            params.filename = filename
            params.site = matcher[0][1]
            params.locus = matcher[0][2]
            params.basket = matcher[0][3]
            params.sequence = matcher[0][4]
            params.image = selectInputStream(request).getBytes()
            save()
        } else {
            render(text: [success:false] as JSON, contentType:'text/json')
        }
    }

    def renderImage = {
        if (params.id) {
            def photo = PhotoThumbnail.get(params.id)
            if (photo) {
                response.setContentLength(photo.image.length)
                response.outputStream.write(photo.image)
                response.outputStream.flush()
                response.outputStream.close()
            } else {
                response.sendError(404)
            }
        // To show images on maps
        } else if (params.site && params.locus && params.basket && params.index) {
            def query = [site: params.site.toUpperCase(), locus: params.locus, basket: params.basket]
            def results = PhotoThumbnail.findAllWhere(query)
            if (results && results.size() > 0) {
                def images = []
                results.each {
                    images << it.image
                }
                def index = params.index as Integer
                if (index > images.size() || index <= 0) {
                    response.sendError(404)
                } else {
                    response.setContentLength(images[index - 1].length)
                    response.outputStream.write(images[index - 1])
                    response.outputStream.flush()
                    response.outputStream.close()
                }
            } else {
                response.sendError(404)
            }
        } else {
            response.sendError(404)
        }
    }

    def getImages = {
        def snippet = "Found no photos."
        if (params.site && params.locus && params.basket) {
            def query = [site: params.site.toUpperCase(), locus: params.locus, basket: params.basket]
            def results = PhotoThumbnail.findAllWhere(query)
            if (results && results.size > 0) {
                snippet = """\
    <ul class="ppy-imglist">
    """
                for (i in 1..results.size) {
                    snippet += """\
    <li>
        <a href="/archaeology/photoThumbnail/renderImage?site=${params.site}&locus=${params.locus}&basket=${params.basket}&index=${i}">
            <img src="/archaeology/photoThumbnail/renderImage?site=${params.site}&locus=${params.locus}&basket=${params.basket}&index=${i}">
        </a>
    </li>
    """
                }
                snippet += """\
    </ul>
    <div class="ppy-outer">
        <div class="ppy-stage">
            <div class="ppy-nav">
                <a class="ppy-prev" title="Previous image">Previous image</a>
                <a class="ppy-switch-enlarge" title="Enlarge">Enlarge</a>
                <a class="ppy-switch-compact" title="Close">Close</a>
                <a class="ppy-next" title="Next image">Next image</a>
            </div>
        </div>
    </div>
    <div class="ppy-caption">
        <div class="ppy-counter">
            Image <strong class="ppy-current"></strong> of <strong class="ppy-total"></strong>
        </div>
        <span class="ppy-text"></span>
    </div>
    """
            }
        }
        render(text: snippet, contentType:'text/html')
    }

    private InputStream selectInputStream(HttpServletRequest request) {
        if (request instanceof MultipartHttpServletRequest) {
            MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
            return uploadedFile.inputStream
        }
        return request.inputStream
    }
}
