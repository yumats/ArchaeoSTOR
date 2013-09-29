
<%@ page import="net.calit2.archaeology.database.RadioCarbonBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'radioCarbonBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'radioCarbonBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'radioCarbonBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="radioCarbonBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'radioCarbonBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'radioCarbonBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'radioCarbonBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'radioCarbonBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="radioCarbonBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="radioCarbonBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'radioCarbonBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'radioCarbonBulk.weight.label', default: 'Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${radioCarbonBulkInstanceList}" status="i" var="radioCarbonBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${radioCarbonBulkInstance.id}">${fieldValue(bean: radioCarbonBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="year">${fieldValue(bean: radioCarbonBulkInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${radioCarbonBulkInstance.id}" data-field="site">${fieldValue(bean: radioCarbonBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="area">${fieldValue(bean: radioCarbonBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="edm">${fieldValue(bean: radioCarbonBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="basket">${fieldValue(bean: radioCarbonBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="locus">${fieldValue(bean: radioCarbonBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${radioCarbonBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: radioCarbonBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${radioCarbonBulkInstance.id}" data-field="crate">${fieldValue(bean: radioCarbonBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="count">${fieldValue(bean: radioCarbonBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${radioCarbonBulkInstance.id}" data-field="weight">${fieldValue(bean: radioCarbonBulkInstance, field: "weight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${radioCarbonBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
