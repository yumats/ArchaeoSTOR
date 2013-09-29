
<%@ page import="net.calit2.archaeology.database.ShellBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shellBulk.label', default: 'ShellBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'shellBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'shellBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'shellBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="shellBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'shellBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'shellBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'shellBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'shellBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="shellBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="shellBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'shellBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'shellBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countSmall" title="${message(code: 'shellBulk.countSmall.label', default: 'Count Small')}" />
                        
                            <g:sortableColumn property="weightSmall" title="${message(code: 'shellBulk.weightSmall.label', default: 'Weight Small')}" />
                        
                            <g:sortableColumn property="countMedium" title="${message(code: 'shellBulk.countMedium.label', default: 'Count Medium')}" />
                        
                            <g:sortableColumn property="weightMedium" title="${message(code: 'shellBulk.weightMedium.label', default: 'Weight Medium')}" />
                        
                            <g:sortableColumn property="countLarge" title="${message(code: 'shellBulk.countLarge.label', default: 'Count Large')}" />
                        
                            <g:sortableColumn property="weightLarge" title="${message(code: 'shellBulk.weightLarge.label', default: 'Weight Large')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shellBulkInstanceList}" status="i" var="shellBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${shellBulkInstance.id}">${fieldValue(bean: shellBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="year">${shellBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${shellBulkInstance.id}" data-field="site">${fieldValue(bean: shellBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="area">${fieldValue(bean: shellBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="edm">${fieldValue(bean: shellBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="basket">${fieldValue(bean: shellBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="locus">${fieldValue(bean: shellBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${shellBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: shellBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${shellBulkInstance.id}" data-field="crate">${fieldValue(bean: shellBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${shellBulkInstance.id}" data-field="count">${fieldValue(bean: shellBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${shellBulkInstance.id}" data-field="weight">${fieldValue(bean: shellBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="countSmall">${fieldValue(bean: shellBulkInstance, field: "countSmall")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="weightSmall">${fieldValue(bean: shellBulkInstance, field: "weightSmall")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="countMedium">${fieldValue(bean: shellBulkInstance, field: "countMedium")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="weightMedium">${fieldValue(bean: shellBulkInstance, field: "weightMedium")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="countLarge">${fieldValue(bean: shellBulkInstance, field: "countLarge")}</td>
                        
                            <td class="editable" data-id="${shellBulkInstance.id}" data-field="weightLarge">${fieldValue(bean: shellBulkInstance, field: "weightLarge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${shellBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
