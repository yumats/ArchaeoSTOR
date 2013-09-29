
<%@ page import="net.calit2.archaeology.database.OrganicBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'organicBulk.label', default: 'OrganicBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'organicBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'organicBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'organicBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="organicBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'organicBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'organicBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'organicBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'organicBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="organicBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="organicBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'organicBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'organicBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countSmall" title="${message(code: 'organicBulk.countSmall.label', default: 'Count Small')}" />
                        
                            <g:sortableColumn property="weightSmall" title="${message(code: 'organicBulk.weightSmall.label', default: 'Weight Small')}" />
                        
                            <g:sortableColumn property="countMedium" title="${message(code: 'organicBulk.countMedium.label', default: 'Count Medium')}" />
                        
                            <g:sortableColumn property="weightMedium" title="${message(code: 'organicBulk.weightMedium.label', default: 'Weight Medium')}" />
                        
                            <g:sortableColumn property="countLarge" title="${message(code: 'organicBulk.countLarge.label', default: 'Count Large')}" />
                        
                            <g:sortableColumn property="weightLarge" title="${message(code: 'organicBulk.weightLarge.label', default: 'Weight Large')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${organicBulkInstanceList}" status="i" var="organicBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${organicBulkInstance.id}">${fieldValue(bean: organicBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="year">${organicBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${organicBulkInstance.id}" data-field="site">${fieldValue(bean: organicBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="area">${fieldValue(bean: organicBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="edm">${fieldValue(bean: organicBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="basket">${fieldValue(bean: organicBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="locus">${fieldValue(bean: organicBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${organicBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: organicBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${organicBulkInstance.id}" data-field="crate">${fieldValue(bean: organicBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${organicBulkInstance.id}" data-field="count">${fieldValue(bean: organicBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${organicBulkInstance.id}" data-field="weight">${fieldValue(bean: organicBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="countSmall">${fieldValue(bean: organicBulkInstance, field: "countSmall")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="weightSmall">${fieldValue(bean: organicBulkInstance, field: "weightSmall")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="countMedium">${fieldValue(bean: organicBulkInstance, field: "countMedium")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="weightMedium">${fieldValue(bean: organicBulkInstance, field: "weightMedium")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="countLarge">${fieldValue(bean: organicBulkInstance, field: "countLarge")}</td>
                        
                            <td class="editable" data-id="${organicBulkInstance.id}" data-field="weightLarge">${fieldValue(bean: organicBulkInstance, field: "weightLarge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${organicBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
