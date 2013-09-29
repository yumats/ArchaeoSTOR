
<%@ page import="net.calit2.archaeology.database.GroundStoneHole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneHole.label', default: 'GroundStoneHole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'groundStoneHole';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'groundStoneHole.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="diameter" title="${message(code: 'groundStoneHole.diameter.label', default: 'Diameter')}" />
                        
                            <g:sortableColumn property="depth" title="${message(code: 'groundStoneHole.depth.label', default: 'Depth')}" />
                        
                            <g:sortableColumn property="crossShape" title="${message(code: 'groundStoneHole.crossShape.label', default: 'Cross Shape')}" />
                        
                            <g:sortableColumn property="location" title="${message(code: 'groundStoneHole.location.label', default: 'Location')}" />
                        
                            <th><g:message code="groundStoneHole.groundStoneDiagnostic.label" default="Ground Stone Diagnostic" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groundStoneHoleInstanceList}" status="i" var="groundStoneHoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${groundStoneHoleInstance.id}">${fieldValue(bean: groundStoneHoleInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${groundStoneHoleInstance.id}" data-field="diameter">${fieldValue(bean: groundStoneHoleInstance, field: "diameter")}</td>
                        
                            <td class="editable" data-id="${groundStoneHoleInstance.id}" data-field="depth">${fieldValue(bean: groundStoneHoleInstance, field: "depth")}</td>
                        
                            <td class="editable" data-id="${groundStoneHoleInstance.id}" data-field="crossShape">${fieldValue(bean: groundStoneHoleInstance, field: "crossShape")}</td>
                        
                            <td class="editable" data-id="${groundStoneHoleInstance.id}" data-field="location">${fieldValue(bean: groundStoneHoleInstance, field: "location")}</td>
                        
                            <td class="editable" data-id="${groundStoneHoleInstance.id}" data-field="groundStoneDiagnostic">${fieldValue(bean: groundStoneHoleInstance, field: "groundStoneDiagnostic")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${groundStoneHoleInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
