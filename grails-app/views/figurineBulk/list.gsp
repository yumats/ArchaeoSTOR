
<%@ page import="net.calit2.archaeology.database.FigurineBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'figurineBulk.label', default: 'FigurineBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'figurineBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'figurineBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'figurineBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="figurineBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'figurineBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'figurineBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'figurineBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'figurineBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="figurineBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="figurineBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'figurineBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'figurineBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="figurineType" title="${message(code: 'figurineBulk.figurineType.label', default: 'Figurine Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${figurineBulkInstanceList}" status="i" var="figurineBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${figurineBulkInstance.id}">${fieldValue(bean: figurineBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="year">${fieldValue(bean: figurineBulkInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${figurineBulkInstance.id}" data-field="site">${fieldValue(bean: figurineBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="area">${fieldValue(bean: figurineBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="edm">${fieldValue(bean: figurineBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="basket">${fieldValue(bean: figurineBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="locus">${fieldValue(bean: figurineBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${figurineBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: figurineBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${figurineBulkInstance.id}" data-field="crate">${fieldValue(bean: figurineBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="count">${fieldValue(bean: figurineBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${figurineBulkInstance.id}" data-field="weight">${fieldValue(bean: figurineBulkInstance, field: "weight")}</td>
                        
                            <td class="uneditable" data-id="${figurineBulkInstance.id}" data-field="figurineType">${fieldValue(bean: figurineBulkInstance, field: "figurineType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${figurineBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
