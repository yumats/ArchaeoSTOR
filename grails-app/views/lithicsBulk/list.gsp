
<%@ page import="net.calit2.archaeology.database.LithicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lithicsBulk.label', default: 'LithicsBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'lithicsBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'lithicsBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'lithicsBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="lithicsBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'lithicsBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'lithicsBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'lithicsBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'lithicsBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="lithicsBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="lithicsBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'lithicsBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'lithicsBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countDebitage" title="${message(code: 'lithicsBulk.countDebitage.label', default: 'Count Debitage')}" />
                        
                            <g:sortableColumn property="weightDebitage" title="${message(code: 'lithicsBulk.weightDebitage.label', default: 'Weight Debitage')}" />
                        
                            <g:sortableColumn property="countCores" title="${message(code: 'lithicsBulk.countCores.label', default: 'Count Cores')}" />
                        
                            <g:sortableColumn property="weightCores" title="${message(code: 'lithicsBulk.weightCores.label', default: 'Weight Cores')}" />
                        
                            <g:sortableColumn property="countTools" title="${message(code: 'lithicsBulk.countTools.label', default: 'Count Tools')}" />
                        
                            <g:sortableColumn property="weightTools" title="${message(code: 'lithicsBulk.weightTools.label', default: 'Weight Tools')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lithicsBulkInstanceList}" status="i" var="lithicsBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${lithicsBulkInstance.id}">${fieldValue(bean: lithicsBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="year">${lithicsBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${lithicsBulkInstance.id}" data-field="site">${fieldValue(bean: lithicsBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="area">${fieldValue(bean: lithicsBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="edm">${fieldValue(bean: lithicsBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="basket">${fieldValue(bean: lithicsBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="locus">${fieldValue(bean: lithicsBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${lithicsBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: lithicsBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${lithicsBulkInstance.id}" data-field="crate">${fieldValue(bean: lithicsBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${lithicsBulkInstance.id}" data-field="count">${fieldValue(bean: lithicsBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${lithicsBulkInstance.id}" data-field="weight">${fieldValue(bean: lithicsBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="countDebitage">${fieldValue(bean: lithicsBulkInstance, field: "countDebitage")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="weightDebitage">${fieldValue(bean: lithicsBulkInstance, field: "weightDebitage")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="countCores">${fieldValue(bean: lithicsBulkInstance, field: "countCores")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="weightCores">${fieldValue(bean: lithicsBulkInstance, field: "weightCores")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="countTools">${fieldValue(bean: lithicsBulkInstance, field: "countTools")}</td>
                        
                            <td class="editable" data-id="${lithicsBulkInstance.id}" data-field="weightTools">${fieldValue(bean: lithicsBulkInstance, field: "weightTools")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${lithicsBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
