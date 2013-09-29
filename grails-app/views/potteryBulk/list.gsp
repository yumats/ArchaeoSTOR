
<%@ page import="net.calit2.archaeology.database.PotteryBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryBulk.label', default: 'PotteryBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'potteryBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'potteryBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'potteryBulk.year.label', default: 'Year')}" />
                            
                            <th><g:message code="potteryBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'potteryBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'potteryBulk.edm.label', default: 'EDM')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'potteryBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'potteryBulk.locus.label', default: 'Locus')}" />

                            <th><g:message code="potteryBulk.surveyFeature.label" default="Survey Feature" /></th>

                            <g:sortableColumn property="crate" title="${message(code: 'potteryBulk.crate.label', default: 'Crate')}" />
                        
                            <g:sortableColumn property="count" title="${message(code: 'potteryBulk.count.label', default: 'Total Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'potteryBulk.weight.label', default: 'Total Weight')}" />
                        
                            <g:sortableColumn property="handmadeCount" title="${message(code: 'potteryBulk.handmadeCount.label', default: 'Handmade Count')}" />
                        
                            <g:sortableColumn property="handmadeWeight" title="${message(code: 'potteryBulk.handmadeWeight.label', default: 'Handmade Weight')}" />
                        
                            <g:sortableColumn property="wheelmadeCount" title="${message(code: 'potteryBulk.wheelmadeCount.label', default: 'Wheelmade Count')}" />
                        
                            <g:sortableColumn property="wheelmadeWeight" title="${message(code: 'potteryBulk.wheelmadeWeight.label', default: 'Wheelmade Weight')}" />
                        
                            <g:sortableColumn property="cookingCount" title="${message(code: 'potteryBulk.cookingCount.label', default: 'Cooking Count')}" />

                            <g:sortableColumn property="cookingWeight" title="${message(code: 'potteryBulk.cookingWeight.label', default: 'Cooking Weight')}" />

                            <g:sortableColumn property="handlesCount" title="${message(code: 'potteryBulk.handlesCount.label', default: 'Handles Count')}" />

                            <g:sortableColumn property="handlesWeight" title="${message(code: 'potteryBulk.handlesWeight.label', default: 'Handles Weight')}" />

                            <g:sortableColumn property="basesCount" title="${message(code: 'potteryBulk.basesCount.label', default: 'Bases Count')}" />

                            <g:sortableColumn property="basesWeight" title="${message(code: 'potteryBulk.basesWeight.label', default: 'Bases Weight')}" />

                            <g:sortableColumn property="decorCount" title="${message(code: 'potteryBulk.decorCount.label', default: 'Decor Count')}" />

                            <g:sortableColumn property="decorWeight" title="${message(code: 'potteryBulk.decorWeight.label', default: 'Decor Weight')}" />

                            <g:sortableColumn property="diagnosticCount" title="${message(code: 'potteryBulk.diagnosticCount.label', default: 'Diagnostic Count')}" />

                            <g:sortableColumn property="diagnosticWeight" title="${message(code: 'potteryBulk.diagnosticWeight.label', default: 'Diagnostic Weight')}" />
                            
                            <g:sortableColumn property="otherSpecialCount" title="${message(code: 'potteryBulk.otherSpecialCount.label', default: 'Other Count')}" />

                            <g:sortableColumn property="otherSpecialWeight" title="${message(code: 'potteryBulk.otherSpecialWeight.label', default: 'Other Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${potteryBulkInstanceList}" status="i" var="potteryBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${potteryBulkInstance.id}">${fieldValue(bean: potteryBulkInstance, field: "id")}</g:link></td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="year">${potteryBulkInstance?.year}</td>

                            <td class="uneditable" data-id="${potteryBulkInstance.id}" data-field="site">${fieldValue(bean: potteryBulkInstance, field: "site")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="area">${fieldValue(bean: potteryBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="edm">${fieldValue(bean: potteryBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="basket">${fieldValue(bean: potteryBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="locus">${fieldValue(bean: potteryBulkInstance, field: "locus")}</td>

                            <td class="uneditable" data-id="${potteryBulkInstance.id}" data-field="year">${fieldValue(bean: potteryBulkInstance, field: "surveyFeature")}</td>

                            <td class="uneditable" data-id="${potteryBulkInstance.id}" data-field="year">${fieldValue(bean: potteryBulkInstance, field: "crate")}</td>

                            <td class="uneditable" data-id="${potteryBulkInstance.id}" data-field="year">${fieldValue(bean: potteryBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${potteryBulkInstance.id}" data-field="year">${fieldValue(bean: potteryBulkInstance, field: "weight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="handmadeCount">${fieldValue(bean: potteryBulkInstance, field: "handmadeCount")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="handmadeWeight">${fieldValue(bean: potteryBulkInstance, field: "handmadeWeight")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="wheelmadeCount">${fieldValue(bean: potteryBulkInstance, field: "wheelmadeCount")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="wheelmadeWeight">${fieldValue(bean: potteryBulkInstance, field: "wheelmadeWeight")}</td>
                        
                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="cookingCount">${fieldValue(bean: potteryBulkInstance, field: "cookingCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="cookingWeight">${fieldValue(bean: potteryBulkInstance, field: "cookingWeight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="handlesCount">${fieldValue(bean: potteryBulkInstance, field: "handlesCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="handlesWeight">${fieldValue(bean: potteryBulkInstance, field: "handlesWeight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="basesCount">${fieldValue(bean: potteryBulkInstance, field: "basesCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="basesWeight">${fieldValue(bean: potteryBulkInstance, field: "basesWeight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="decorCount">${fieldValue(bean: potteryBulkInstance, field: "decorCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="decorWeight">${fieldValue(bean: potteryBulkInstance, field: "decorWeight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="diagnosticCount">${fieldValue(bean: potteryBulkInstance, field: "diagnosticCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="diagnosticWeight">${fieldValue(bean: potteryBulkInstance, field: "diagnosticWeight")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="otherSpecialCount">${fieldValue(bean: potteryBulkInstance, field: "otherSpecialCount")}</td>

                            <td class="editable" data-id="${potteryBulkInstance.id}" data-field="otherSpecialWeight">${fieldValue(bean: potteryBulkInstance, field: "otherSpecialWeight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${potteryBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
