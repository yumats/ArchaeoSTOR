
<%@ page import="net.calit2.archaeology.database.OtherBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherBulk.label', default: 'OtherBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'otherBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'otherBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'otherBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="otherBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'otherBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'otherBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'otherBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'otherBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="otherBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="otherBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'otherBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'otherBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="dCode" title="${message(code: 'otherBulk.dCode.label', default: 'Dcode')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${otherBulkInstanceList}" status="i" var="otherBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${otherBulkInstance.id}">${fieldValue(bean: otherBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="year">${fieldValue(bean: otherBulkInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${otherBulkInstance.id}" data-field="site">${fieldValue(bean: otherBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="area">${fieldValue(bean: otherBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="edm">${fieldValue(bean: otherBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="basket">${fieldValue(bean: otherBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="locus">${fieldValue(bean: otherBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${otherBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: otherBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${otherBulkInstance.id}" data-field="crate">${fieldValue(bean: otherBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="count">${fieldValue(bean: otherBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${otherBulkInstance.id}" data-field="weight">${fieldValue(bean: otherBulkInstance, field: "weight")}</td>
                        
                            <td class="uneditable" data-id="${otherBulkInstance.id}" data-field="dCode">${fieldValue(bean: otherBulkInstance, field: "dCode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${otherBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
