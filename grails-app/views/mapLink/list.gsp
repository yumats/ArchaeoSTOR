
<%@ page import="net.calit2.archaeology.util.MapLink" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mapLink.label', default: 'MapLink')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <!--
        <g:javascript src="quickedit.js" />
        -->

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'mapLink.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="layer" title="${message(code: 'mapLink.layer.label', default: 'Layer')}" />
                        
                            <g:sortableColumn property="minX" title="${message(code: 'mapLink.minX.label', default: 'Min X')}" />
                        
                            <g:sortableColumn property="minY" title="${message(code: 'mapLink.minY.label', default: 'Min Y')}" />
                        
                            <g:sortableColumn property="maxX" title="${message(code: 'mapLink.maxX.label', default: 'Max X')}" />
                        
                            <g:sortableColumn property="maxY" title="${message(code: 'mapLink.maxY.label', default: 'Max Y')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mapLinkInstanceList}" status="i" var="mapLinkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${mapLinkInstance.id}">${fieldValue(bean: mapLinkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${mapLinkInstance.id}" data-field="layer">${fieldValue(bean: mapLinkInstance, field: "layer")}</td>
                        
                            <td class="editable" data-id="${mapLinkInstance.id}" data-field="minX">${fieldValue(bean: mapLinkInstance, field: "minX")}</td>
                        
                            <td class="editable" data-id="${mapLinkInstance.id}" data-field="minY">${fieldValue(bean: mapLinkInstance, field: "minY")}</td>
                        
                            <td class="editable" data-id="${mapLinkInstance.id}" data-field="maxX">${fieldValue(bean: mapLinkInstance, field: "maxX")}</td>
                        
                            <td class="editable" data-id="${mapLinkInstance.id}" data-field="maxY">${fieldValue(bean: mapLinkInstance, field: "maxY")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${mapLinkInstanceTotal}" />
                </div>
            </g:if>
        </div>
    </body>
</html>
