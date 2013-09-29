
<%@ page import="net.calit2.archaeology.database.BoneBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'boneBulk.label', default: 'BoneBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'boneBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'boneBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'boneBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="boneBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'boneBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'boneBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'boneBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'boneBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="boneBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="boneBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'boneBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'boneBulk.weight.label', default: 'Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${boneBulkInstanceList}" status="i" var="boneBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${boneBulkInstance.id}">${fieldValue(bean: boneBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="year">${boneBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${boneBulkInstance.id}" data-field="site">${fieldValue(bean: boneBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="area">${fieldValue(bean: boneBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="edm">${fieldValue(bean: boneBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="basket">${fieldValue(bean: boneBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="locus">${fieldValue(bean: boneBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${boneBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: boneBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${boneBulkInstance.id}" data-field="crate">${fieldValue(bean: boneBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="count">${fieldValue(bean: boneBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${boneBulkInstance.id}" data-field="weight">${fieldValue(bean: boneBulkInstance, field: "weight")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${boneBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
