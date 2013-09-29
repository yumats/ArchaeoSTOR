
<%@ page import="net.calit2.archaeology.database.ChemistrySample" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'chemistrySample.label', default: 'ChemistrySample')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'chemistrySample';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'chemistrySample.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'chemistrySample.year.label', default: 'Year')}" />
                        
                            <th><g:message code="chemistrySample.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'chemistrySample.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'chemistrySample.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'chemistrySample.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'chemistrySample.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="chemistrySample.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="chemistrySample.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'chemistrySample.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'chemistrySample.weight.label', default: 'Weight')}" />

                            <g:sortableColumn property="sampleNumber" title="${message(code: 'chemistrySample.weight.label', default: 'Sample Number')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${chemistrySampleInstanceList}" status="i" var="chemistrySampleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${chemistrySampleInstance.id}">${fieldValue(bean: chemistrySampleInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="year">${chemistrySampleInstance?.year}</td>
                        
                            <td class="uneditable" data-id="${chemistrySampleInstance.id}" data-field="site">${fieldValue(bean: chemistrySampleInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="area">${fieldValue(bean: chemistrySampleInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="edm">${fieldValue(bean: chemistrySampleInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="basket">${fieldValue(bean: chemistrySampleInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="locus">${fieldValue(bean: chemistrySampleInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${chemistrySampleInstance.id}" data-field="surveyFeature">${fieldValue(bean: chemistrySampleInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${chemistrySampleInstance.id}" data-field="crate">${fieldValue(bean: chemistrySampleInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="count">${fieldValue(bean: chemistrySampleInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="weight">${fieldValue(bean: chemistrySampleInstance, field: "weight")}</td>

                            <td class="editable" data-id="${chemistrySampleInstance.id}" data-field="sampleNumber">${fieldValue(bean: chemistrySampleInstance, field: "sampleNumber")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${chemistrySampleInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
