
<%@ page import="net.calit2.archaeology.database.CoinBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'coinBulk.label', default: 'CoinBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'coinBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'coinBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'coinBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="coinBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'coinBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'coinBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'coinBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'coinBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="coinBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="coinBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'coinBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'coinBulk.weight.label', default: 'Weight')}" />

                            <g:sortableColumn property="period" title="${message(code: 'coinBulk.period.label', default: 'Period')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${coinBulkInstanceList}" status="i" var="coinBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${coinBulkInstance.id}">${fieldValue(bean: coinBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="year">${coinBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${coinBulkInstance.id}" data-field="site">${fieldValue(bean: coinBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="area">${fieldValue(bean: coinBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="edm">${fieldValue(bean: coinBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="basket">${fieldValue(bean: coinBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="locus">${fieldValue(bean: coinBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${coinBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: coinBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${coinBulkInstance.id}" data-field="crate">${fieldValue(bean: coinBulkInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="count">${fieldValue(bean: coinBulkInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${coinBulkInstance.id}" data-field="weight">${fieldValue(bean: coinBulkInstance, field: "weight")}</td>

                            <td>${fieldValue(bean: coinBulkInstance, field: "period")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${coinBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
