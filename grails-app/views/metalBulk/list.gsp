
<%@ page import="net.calit2.archaeology.database.MetalBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'metalBulk.label', default: 'MetalBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'metalBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'metalBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'metalBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="metalBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'metalBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'metalBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'metalBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'metalBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="metalBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="metalBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'metalBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'metalBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countLumps" title="${message(code: 'metalBulk.countLumps.label', default: 'Count Lumps')}" />
                        
                            <g:sortableColumn property="weightLumps" title="${message(code: 'metalBulk.weightLumps.label', default: 'Weight Lumps')}" />
                        
                            <g:sortableColumn property="countObject" title="${message(code: 'metalBulk.countObject.label', default: 'Count Object')}" />
                        
                            <g:sortableColumn property="weightObject" title="${message(code: 'metalBulk.weightObject.label', default: 'Weight Object')}" />

                            <g:sortableColumn property="metalType" title="${message(code: 'metalBulk.metalType.label', default: 'Metal Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${metalBulkInstanceList}" status="i" var="metalBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${metalBulkInstance.id}">${fieldValue(bean: metalBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="year">${metalBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="site">${fieldValue(bean: metalBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="area">${fieldValue(bean: metalBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="edm">${fieldValue(bean: metalBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="basket">${fieldValue(bean: metalBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="locus">${fieldValue(bean: metalBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: metalBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="crate">${fieldValue(bean: metalBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="count">${fieldValue(bean: metalBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="weight">${fieldValue(bean: metalBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="countLumps">${fieldValue(bean: metalBulkInstance, field: "countLumps")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="weightLumps">${fieldValue(bean: metalBulkInstance, field: "weightLumps")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="countObject">${fieldValue(bean: metalBulkInstance, field: "countObject")}</td>
                        
                            <td class="editable" data-id="${metalBulkInstance.id}" data-field="weightObject">${fieldValue(bean: metalBulkInstance, field: "weightObject")}</td>

                            <td class="uneditable" data-id="${metalBulkInstance.id}" data-field="metalType">${fieldValue(bean: metalBulkInstance, field: "metalType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${metalBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
