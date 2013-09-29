
<%@ page import="net.calit2.archaeology.database.GroundStoneGroove" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'groundStoneGroove';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'groundStoneGroove.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="length" title="${message(code: 'groundStoneGroove.length.label', default: 'Length')}" />
                        
                            <g:sortableColumn property="width" title="${message(code: 'groundStoneGroove.width.label', default: 'Width')}" />
                        
                            <g:sortableColumn property="depth" title="${message(code: 'groundStoneGroove.depth.label', default: 'Depth')}" />
                        
                            <th><g:message code="groundStoneGroove.groundStoneDiagnostic.label" default="Ground Stone Diagnostic" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groundStoneGrooveInstanceList}" status="i" var="groundStoneGrooveInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${groundStoneGrooveInstance.id}">${fieldValue(bean: groundStoneGrooveInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${groundStoneGrooveInstance.id}" data-field="length">${fieldValue(bean: groundStoneGrooveInstance, field: "length")}</td>
                        
                            <td class="editable" data-id="${groundStoneGrooveInstance.id}" data-field="width">${fieldValue(bean: groundStoneGrooveInstance, field: "width")}</td>
                        
                            <td class="editable" data-id="${groundStoneGrooveInstance.id}" data-field="depth">${fieldValue(bean: groundStoneGrooveInstance, field: "depth")}</td>
                        
                            <td class="editable" data-id="${groundStoneGrooveInstance.id}" data-field="groundStoneDiagnostic">${fieldValue(bean: groundStoneGrooveInstance, field: "groundStoneDiagnostic")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${groundStoneGrooveInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
