

<%@ page import="net.calit2.archaeology.database.PhotoThumbnail" %>
<html>
    <head>
        <g:javascript library="jquery" plugin="jquery" />
        <uploader:head css="/archaeology/css/uploader.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'photoThumbnail.label', default: 'PhotoThumbnail')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1 id="caption">Import Photos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${photoThumbnailInstance}">
            <div class="errors">
                <g:renderErrors bean="${photoThumbnailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div style="padding-top:20px; padding-bottom: 10px">
                <ul>
                    <li>Drag and drop multiple files on the button or click and select files in the dialog.</li>
                    <br>
                    <li>File name should be "&lt;SiteLinkName&gt;_&lt;Locus&gt;_&lt;Basket&gt;_&lt;Sequence&gt;.jpg."</li>
                </ul>
            </div>
            <div style="margin-top:15px">
                <uploader:uploader id="photoUploader" url="${[controller:'photoThumbnail', action:'upload']}">
                    <uploader:onComplete>
                        if (!responseJSON.success) {
                            $('#caption').after('<div class="errors">Uploading ' + fileName + ' failed. The file name might be invalid or the file has been already uploaded.</div>');
                        }
                        //setTimeout(function() {window.location = "/archaeology/photoThumbnail/list";}, 2500);
                    </uploader:onComplete>
                </uploader:uploader>
            </div>
            <!--

            <g:uploadForm action="upload">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name" style="padding-top:12px">
                                    <label for="image"><g:message code="photoThumbnail.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'image', 'errors')}">
                                    <input type="file" id="image" name="image" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>

            -->
        </div>
    </body>
</html>
