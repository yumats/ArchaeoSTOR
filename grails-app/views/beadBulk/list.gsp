
<%@ page import="net.calit2.archaeology.database.BeadBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'beadBulk.label', default: 'BeadBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'beadBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'beadBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'beadBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="beadBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'beadBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'beadBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'beadBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'beadBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="beadBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="beadBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'beadBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'beadBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="material" title="${message(code: 'beadBulk.material.label', default: 'Material')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${beadBulkInstanceList}" status="i" var="beadBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${beadBulkInstance.id}">${fieldValue(bean: beadBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="year">${beadBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${beadBulkInstance.id}" data-field="site">${fieldValue(bean: beadBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="area">${fieldValue(bean: beadBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="edm">${fieldValue(bean: beadBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="basket">${fieldValue(bean: beadBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="locus">${fieldValue(bean: beadBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${beadBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: beadBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${beadBulkInstance.id}" data-field="crate">${fieldValue(bean: beadBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="count">${fieldValue(bean: beadBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="weight">${fieldValue(bean: beadBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${beadBulkInstance.id}" data-field="material">${fieldValue(bean: beadBulkInstance, field: "material")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${beadBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
