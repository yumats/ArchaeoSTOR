
<%@ page import="net.calit2.archaeology.database.XrfRaw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'xrfRaw.label', default: 'XrfRaw')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />

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
                        
                            <g:sortableColumn property="id" title="${message(code: 'xrfRaw.id.label', default: 'Id')}" />

                            <th>Diagnostic ID</th>

                            <g:sortableColumn property="filename" title="${message(code: 'xrfRaw.filename.label', default: 'Filename')}" />
                        
                            <g:sortableColumn property="machineSerialNumber" title="${message(code: 'xrfRaw.machineSerialNumber.label', default: 'Machine Serial #')}" />
                        
                            <g:sortableColumn property="materialType" title="${message(code: 'xrfRaw.materialType.label', default: 'Material Type')}" />

                            <g:sortableColumn property="isHeterogeneous" title="${message(code: 'xrfRaw.isHeterogeneous.label', default: 'Heterogeneous')}" />

                            <g:sortableColumn property="isGround" title="${message(code: 'xrfRaw.isGround.label', default: 'Ground')}" />
                        
                            <g:sortableColumn property="time" title="${message(code: 'xrfRaw.time.label', default: 'Time')}" />
                        
                            <g:sortableColumn property="filter" title="${message(code: 'xrfRaw.filter.label', default: 'Filter')}" />
                        
                            <g:sortableColumn property="isVacuumOn" title="${message(code: 'xrfRaw.isVacuumOn.label', default: 'Vacuum On')}" />
                        
                            <g:sortableColumn property="keyValue" title="${message(code: 'xrfRaw.keyValue.label', default: 'Key Value')}" />
                        
                            <g:sortableColumn property="microAmpsValue" title="${message(code: 'xrfRaw.microAmpsValue.label', default: 'Micro Amps')}" />
                        
                            <g:sortableColumn property="count" title="${message(code: 'xrfRaw.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="notes" title="${message(code: 'xrfRaw.notes.label', default: 'Notes')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${xrfRawInstanceList}" status="i" var="xrfRawInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${xrfRawInstance.id}">${fieldValue(bean: xrfRawInstance, field: "id")}</g:link></td>
                        
                            <td><g:link controller="diagnostic" action="edit" id="${xrfRawInstance?.diagnostic?.id}">${xrfRawInstance?.diagnostic?.id}</g:link></td>

                            <td class="uneditable" data-id="${xrfRawInstance.filename}" data-field="filename">${fieldValue(bean: xrfRawInstance, field: "filename")}</td>

                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="machineSerialNumber">${fieldValue(bean: xrfRawInstance, field: "machineSerialNumber")}</td>
                        
                            <td class="uneditable" data-id="${xrfRawInstance.id}" data-field="materialType">${fieldValue(bean: xrfRawInstance, field: "materialType")}</td>

                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="isHeterogeneous"><g:formatBoolean boolean="${xrfRawInstance.isHeterogeneous}" /></td>

                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="isGround"><g:formatBoolean boolean="${xrfRawInstance.isGround}" /></td>
                        
                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="time">${fieldValue(bean: xrfRawInstance, field: "time")}</td>
                        
                            <td class="uneditable" data-id="${xrfRawInstance.id}" data-field="filter">${fieldValue(bean: xrfRawInstance, field: "filter")}</td>
                        
                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="isVacuumOn"><g:formatBoolean boolean="${xrfRawInstance.isVacuumOn}" /></td>
                        
                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="keyValue">${fieldValue(bean: xrfRawInstance, field: "keyValue")}</td>
                        
                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="microAmpsValue">${fieldValue(bean: xrfRawInstance, field: "microAmpsValue")}</td>
                        
                            <td class="uneditable" data-id="${xrfRawInstance.id}" data-field="count">${fieldValue(bean: xrfRawInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${xrfRawInstance.id}" data-field="notes">${fieldValue(bean: xrfRawInstance, field: "notes")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${xrfRawInstanceTotal}" />
                </div>
            </g:if>
            <!--
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
            -->
        </div>
    </body>
</html>
