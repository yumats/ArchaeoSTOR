
<%@ page import="net.calit2.archaeology.database.GroundStoneBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'groundStoneBulk';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'groundStoneBulk.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'groundStoneBulk.year.label', default: 'Year')}" />
                        
                            <th><g:message code="groundStoneBulk.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'groundStoneBulk.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'groundStoneBulk.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'groundStoneBulk.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'groundStoneBulk.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="groundStoneBulk.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="groundStoneBulk.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'groundStoneBulk.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'groundStoneBulk.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="countVessels" title="${message(code: 'groundStoneBulk.countVessels.label', default: 'Count Vessels')}" />
                        
                            <g:sortableColumn property="weightVessels" title="${message(code: 'groundStoneBulk.weightVessels.label', default: 'Weight Vessels')}" />
                        
                            <g:sortableColumn property="countHammerStones" title="${message(code: 'groundStoneBulk.countHammerStones.label', default: 'Count Hammer Stones')}" />
                        
                            <g:sortableColumn property="weightHammerStones" title="${message(code: 'groundStoneBulk.weightHammerStones.label', default: 'Weight Hammer Stones')}" />
                        
                            <g:sortableColumn property="countGrindingTools" title="${message(code: 'groundStoneBulk.countGrindingTools.label', default: 'Count Grinding Tools')}" />
                        
                            <g:sortableColumn property="weightGrindingTools" title="${message(code: 'groundStoneBulk.weightGrindingTools.label', default: 'Weight Grinding Tools')}" />
                        
                            <g:sortableColumn property="countPerforated" title="${message(code: 'groundStoneBulk.countPerforated.label', default: 'Count Perforated')}" />
                        
                            <g:sortableColumn property="weightPerforated" title="${message(code: 'groundStoneBulk.weightPerforated.label', default: 'Weight Perforated')}" />

                            <g:sortableColumn property="countOther" title="${message(code: 'groundStoneBulk.countOther.label', default: 'Count Other')}" />

                            <g:sortableColumn property="weightOther" title="${message(code: 'groundStoneBulk.weightOther.label', default: 'Weight Other')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groundStoneBulkInstanceList}" status="i" var="groundStoneBulkInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${groundStoneBulkInstance.id}">${fieldValue(bean: groundStoneBulkInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="year">${groundStoneBulkInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${groundStoneBulkInstance.id}" data-field="site">${fieldValue(bean: groundStoneBulkInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="area">${fieldValue(bean: groundStoneBulkInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="edm">${fieldValue(bean: groundStoneBulkInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="basket">${fieldValue(bean: groundStoneBulkInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="locus">${fieldValue(bean: groundStoneBulkInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${groundStoneBulkInstance.id}" data-field="surveyFeature">${fieldValue(bean: groundStoneBulkInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${groundStoneBulkInstance.id}" data-field="crate">${fieldValue(bean: groundStoneBulkInstance, field: "crate")}</td>
                        
                            <td class="uneditable" data-id="${groundStoneBulkInstance.id}" data-field="count">${fieldValue(bean: groundStoneBulkInstance, field: "count")}</td>
                        
                            <td class="uneditable" data-id="${groundStoneBulkInstance.id}" data-field="weight">${fieldValue(bean: groundStoneBulkInstance, field: "weight")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="countVessels">${fieldValue(bean: groundStoneBulkInstance, field: "countVessels")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="weightVessels">${fieldValue(bean: groundStoneBulkInstance, field: "weightVessels")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="countHammerStones">${fieldValue(bean: groundStoneBulkInstance, field: "countHammerStones")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="weightHammerStones">${fieldValue(bean: groundStoneBulkInstance, field: "weightHammerStones")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="countGrindingTools">${fieldValue(bean: groundStoneBulkInstance, field: "countGrindingTools")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="weightGrindingTools">${fieldValue(bean: groundStoneBulkInstance, field: "weightGrindingTools")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="countPerforated">${fieldValue(bean: groundStoneBulkInstance, field: "countPerforated")}</td>
                        
                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="weightPerforated">${fieldValue(bean: groundStoneBulkInstance, field: "weightPerforated")}</td>

                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="countOther">${fieldValue(bean: groundStoneBulkInstance, field: "countOther")}</td>

                            <td class="editable" data-id="${groundStoneBulkInstance.id}" data-field="weightOther">${fieldValue(bean: groundStoneBulkInstance, field: "weightOther")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${groundStoneBulkInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
