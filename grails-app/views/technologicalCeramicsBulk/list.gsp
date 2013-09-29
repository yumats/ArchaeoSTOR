
<%@ page import="net.calit2.archaeology.database.TechnologicalCeramicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'technologicalCeramicsBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'technologicalCeramicsBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'technologicalCeramicsBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="technologicalCeramicsBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'technologicalCeramicsBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'technologicalCeramicsBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'technologicalCeramicsBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'technologicalCeramicsBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="technologicalCeramicsBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="technologicalCeramicsBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'technologicalCeramicsBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'technologicalCeramicsBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countSmall" title="${message(code: 'technologicalCeramicsBulk.countSmall.label', default: 'Count Small')}" />
                        
                            <g:sortableColumn property="weightSmall" title="${message(code: 'technologicalCeramicsBulk.weightSmall.label', default: 'Weight Small')}" />
                        
                            <g:sortableColumn property="countMedium" title="${message(code: 'technologicalCeramicsBulk.countMedium.label', default: 'Count Medium')}" />
                        
                            <g:sortableColumn property="weightMedium" title="${message(code: 'technologicalCeramicsBulk.weightMedium.label', default: 'Weight Medium')}" />
                        
                            <g:sortableColumn property="countLarge" title="${message(code: 'technologicalCeramicsBulk.countLarge.label', default: 'Count Large')}" />
                        
                            <g:sortableColumn property="weightLarge" title="${message(code: 'technologicalCeramicsBulk.weightLarge.label', default: 'Weight Large')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${technologicalCeramicsBulkInstanceList}" status="i" var="technologicalCeramicsBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${technologicalCeramicsBulkInstance.id}">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="year">${technologicalCeramicsBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="site">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="area">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="edm">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="basket">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="locus">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="crate">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="count">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="weight">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="countSmall">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countSmall")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="weightSmall">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightSmall")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="countMedium">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countMedium")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="weightMedium">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightMedium")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="countLarge">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countLarge")}</td>
                        
                            <td class="editable" data-id="${technologicalCeramicsBulkInstance.id}" data-field="weightLarge">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightLarge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${technologicalCeramicsBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
