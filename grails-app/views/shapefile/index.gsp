<%@ page import="net.calit2.archaeology.database.Site" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">
        input {
            margin-right: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        </style>
        <title>Import Shapefile</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1>Import Shapefile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:uploadForm name="shapeUpload" action="upload">
                <div class="dialog">
                    <table>
                        <tr><td style="padding-top:10px">SRID</td><td><g:select name="srid" from="${Site.SRIDS.values()}" keys="${Site.SRIDS.keySet() as List}" value="32636" /></td></tr>
                        <tr><td style="padding-top:20px">dbf file</td><td><input type="file" name="dbfFile"/></td></tr>
                        <tr><td style="padding-top:20px">prj file</td><td><input type="file" name="prjFile"/></td></tr>
                        <tr><td style="padding-top:20px">shp file</td><td><input type="file" name="shpFile"/></td></tr>
                        <tr><td style="padding-top:20px">shx file</td><td><input type="file" name="shxFile"/></td></tr>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="upload" class="upload" value="Upload" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
