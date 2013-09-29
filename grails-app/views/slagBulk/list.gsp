
<%@ page import="net.calit2.archaeology.database.SlagBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'slagBulk.label', default: 'SlagBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'slagBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'slagBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'slagBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="slagBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'slagBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'slagBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'slagBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'slagBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="slagBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="slagBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'slagBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'slagBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countSmall" title="${message(code: 'slagBulk.countSmall.label', default: 'Count Small')}" />
                        
                            <g:sortableColumn property="weightSmall" title="${message(code: 'slagBulk.weightSmall.label', default: 'Weight Small')}" />
                        
                            <g:sortableColumn property="countMedium" title="${message(code: 'slagBulk.countMedium.label', default: 'Count Medium')}" />
                        
                            <g:sortableColumn property="weightMedium" title="${message(code: 'slagBulk.weightMedium.label', default: 'Weight Medium')}" />
                        
                            <g:sortableColumn property="countLarge" title="${message(code: 'slagBulk.countLarge.label', default: 'Count Large')}" />
                        
                            <g:sortableColumn property="weightLarge" title="${message(code: 'slagBulk.weightLarge.label', default: 'Weight Large')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${slagBulkInstanceList}" status="i" var="slagBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${slagBulkInstance.id}">${fieldValue(bean: slagBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="year">${slagBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${slagBulkInstance.id}" data-field="site">${fieldValue(bean: slagBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="area">${fieldValue(bean: slagBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="edm">${fieldValue(bean: slagBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="basket">${fieldValue(bean: slagBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="locus">${fieldValue(bean: slagBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${slagBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: slagBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${slagBulkInstance.id}" data-field="crate">${fieldValue(bean: slagBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${slagBulkInstance.id}" data-field="count">${fieldValue(bean: slagBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${slagBulkInstance.id}" data-field="weight">${fieldValue(bean: slagBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="countSmall">${fieldValue(bean: slagBulkInstance, field: "countSmall")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="weightSmall">${fieldValue(bean: slagBulkInstance, field: "weightSmall")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="countMedium">${fieldValue(bean: slagBulkInstance, field: "countMedium")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="weightMedium">${fieldValue(bean: slagBulkInstance, field: "weightMedium")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="countLarge">${fieldValue(bean: slagBulkInstance, field: "countLarge")}</td>
                        
                            <td class="editable" data-id="${slagBulkInstance.id}" data-field="weightLarge">${fieldValue(bean: slagBulkInstance, field: "weightLarge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${slagBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
