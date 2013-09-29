
<%@ page import="net.calit2.archaeology.database.TextileBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'textileBulk.label', default: 'TextileBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'textileBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'textileBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'textileBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="textileBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'textileBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'textileBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'textileBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'textileBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="textileBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="textileBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'textileBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'textileBulk.weight.label', default: 'Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${textileBulkInstanceList}" status="i" var="textileBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${textileBulkInstance.id}">${fieldValue(bean: textileBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="year">${fieldValue(bean: textileBulkInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${textileBulkInstance.id}" data-field="site">${fieldValue(bean: textileBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="area">${fieldValue(bean: textileBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="edm">${fieldValue(bean: textileBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="basket">${fieldValue(bean: textileBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="locus">${fieldValue(bean: textileBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${textileBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: textileBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${textileBulkInstance.id}" data-field="crate">${fieldValue(bean: textileBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="count">${fieldValue(bean: textileBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${textileBulkInstance.id}" data-field="weight">${fieldValue(bean: textileBulkInstance, field: "weight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${textileBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
