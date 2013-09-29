
<%@ page import="net.calit2.archaeology.database.GlassBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'glassBulk.label', default: 'GlassBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'glassBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'glassBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'glassBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="glassBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'glassBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'glassBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'glassBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'glassBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="glassBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="glassBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'glassBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'glassBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="bulkCount" title="${message(code: 'glassBulk.bulkCount.label', default: 'Bulk Count')}" />
                        
                            <g:sortableColumn property="bulkWeight" title="${message(code: 'glassBulk.bulkWeight.label', default: 'Bulk Weight')}" />
                        
                            <g:sortableColumn property="diagnosticCount" title="${message(code: 'glassBulk.diagnosticCount.label', default: 'Diagnostic Count')}" />
                        
                            <g:sortableColumn property="diagnosticWeight" title="${message(code: 'glassBulk.diagnosticWeight.label', default: 'Diagnostic Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${glassBulkInstanceList}" status="i" var="glassBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${glassBulkInstance.id}">${fieldValue(bean: glassBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="year">${fieldValue(bean: glassBulkInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${glassBulkInstance.id}" data-field="site">${fieldValue(bean: glassBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="area">${fieldValue(bean: glassBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="edm">${fieldValue(bean: glassBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="basket">${fieldValue(bean: glassBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="locus">${fieldValue(bean: glassBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${glassBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: glassBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${glassBulkInstance.id}" data-field="crate">${fieldValue(bean: glassBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="count">${fieldValue(bean: glassBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="weight">${fieldValue(bean: glassBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="bulkCount">${fieldValue(bean: glassBulkInstance, field: "bulkCount")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="bulkWeight">${fieldValue(bean: glassBulkInstance, field: "bulkWeight")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="diagnosticCount">${fieldValue(bean: glassBulkInstance, field: "diagnosticCount")}</td>
                        
                            <td class="editable" data-id="${glassBulkInstance.id}" data-field="diagnosticWeight">${fieldValue(bean: glassBulkInstance, field: "diagnosticWeight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${glassBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
