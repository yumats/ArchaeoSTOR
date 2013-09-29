
<%@ page import="net.calit2.archaeology.database.PhotoThumbnail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'photoThumbnail.label', default: 'PhotoThumbnail')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'photoThumbnail';
        </script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'photoThumbnail.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="site" title="${message(code: 'photoThumbnail.site.label', default: 'Site')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'photoThumbnail.locus.label', default: 'Locus')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'photoThumbnail.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="sequence" title="${message(code: 'photoThumbnail.sequence.label', default: 'Sequence')}" />

                            <g:sortableColumn property="image" title="${message(code: 'photoThumbnail.image.label', default: 'Image')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${photoThumbnailInstanceList}" status="i" var="photoThumbnailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${photoThumbnailInstance.id}">${fieldValue(bean: photoThumbnailInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${photoThumbnailInstance.id}" data-field="site">${fieldValue(bean: photoThumbnailInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${photoThumbnailInstance.id}" data-field="locus">${fieldValue(bean: photoThumbnailInstance, field: "locus")}</td>
                        
                            <td class="editable" data-id="${photoThumbnailInstance.id}" data-field="basket">${fieldValue(bean: photoThumbnailInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${photoThumbnailInstance.id}" data-field="sequence">${fieldValue(bean: photoThumbnailInstance, field: "sequence")}</td>

                            <td class="editable" data-id="${photoThumbnailInstance.id}" data-field="image">
                                <g:link action="renderImage" id="${photoThumbnailInstance?.id}">
                                    <img src="<g:createLink action='renderImage' id='${photoThumbnailInstance?.id}'/>" width="200" height="150">
                                </g:link>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${photoThumbnailInstanceTotal}" />
                </div>
            </g:if>
        </div>
    </body>
</html>
