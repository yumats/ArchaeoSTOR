
<%@ page import="net.calit2.archaeology.database.OreBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oreBulk.label', default: 'OreBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'oreBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'oreBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'oreBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="oreBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'oreBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'oreBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'oreBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'oreBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="oreBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="oreBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'oreBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'oreBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countSmall" title="${message(code: 'oreBulk.countSmall.label', default: 'Count Small')}" />
                        
                            <g:sortableColumn property="weightSmall" title="${message(code: 'oreBulk.weightSmall.label', default: 'Weight Small')}" />
                        
                            <g:sortableColumn property="countMedium" title="${message(code: 'oreBulk.countMedium.label', default: 'Count Medium')}" />
                        
                            <g:sortableColumn property="weightMedium" title="${message(code: 'oreBulk.weightMedium.label', default: 'Weight Medium')}" />
                        
                            <g:sortableColumn property="countLarge" title="${message(code: 'oreBulk.countLarge.label', default: 'Count Large')}" />
                        
                            <g:sortableColumn property="weightLarge" title="${message(code: 'oreBulk.weightLarge.label', default: 'Weight Large')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${oreBulkInstanceList}" status="i" var="oreBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${oreBulkInstance.id}">${fieldValue(bean: oreBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="year">${oreBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${oreBulkInstance.id}" data-field="site">${fieldValue(bean: oreBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="area">${fieldValue(bean: oreBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="edm">${fieldValue(bean: oreBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="basket">${fieldValue(bean: oreBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="locus">${fieldValue(bean: oreBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${oreBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: oreBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${oreBulkInstance.id}" data-field="crate">${fieldValue(bean: oreBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${oreBulkInstance.id}" data-field="count">${fieldValue(bean: oreBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${oreBulkInstance.id}" data-field="weight">${fieldValue(bean: oreBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="countSmall">${fieldValue(bean: oreBulkInstance, field: "countSmall")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="weightSmall">${fieldValue(bean: oreBulkInstance, field: "weightSmall")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="countMedium">${fieldValue(bean: oreBulkInstance, field: "countMedium")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="weightMedium">${fieldValue(bean: oreBulkInstance, field: "weightMedium")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="countLarge">${fieldValue(bean: oreBulkInstance, field: "countLarge")}</td>
                        
                            <td class="editable" data-id="${oreBulkInstance.id}" data-field="weightLarge">${fieldValue(bean: oreBulkInstance, field: "weightLarge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${oreBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
