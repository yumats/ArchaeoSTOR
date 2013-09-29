
<%@ page import="net.calit2.archaeology.database.FloatationSample" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'floatationSample.label', default: 'FloatationSample')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'floatationSample';
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'floatationSample.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'floatationSample.year.label', default: 'Year')}" />
                        
                            <th><g:message code="floatationSample.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="area" title="${message(code: 'floatationSample.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'floatationSample.edm.label', default: 'Edm')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'floatationSample.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'floatationSample.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="floatationSample.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <th><g:message code="floatationSample.crate.label" default="Crate" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'floatationSample.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'floatationSample.weight.label', default: 'Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${floatationSampleInstanceList}" status="i" var="floatationSampleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${floatationSampleInstance.id}">${fieldValue(bean: floatationSampleInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="year">${fieldValue(bean: floatationSampleInstance, field: "year")}</td>
                        
                            <td class="uneditable" data-id="${floatationSampleInstance.id}" data-field="site">${fieldValue(bean: floatationSampleInstance, field: "site")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="area">${fieldValue(bean: floatationSampleInstance, field: "area")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="edm">${fieldValue(bean: floatationSampleInstance, field: "edm")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="basket">${fieldValue(bean: floatationSampleInstance, field: "basket")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="locus">${fieldValue(bean: floatationSampleInstance, field: "locus")}</td>
                        
                            <td class="uneditable" data-id="${floatationSampleInstance.id}" data-field="surveyFeature">${fieldValue(bean: floatationSampleInstance, field: "surveyFeature")}</td>
                        
                            <td class="uneditable" data-id="${floatationSampleInstance.id}" data-field="crate">${fieldValue(bean: floatationSampleInstance, field: "crate")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="count">${fieldValue(bean: floatationSampleInstance, field: "count")}</td>
                        
                            <td class="editable" data-id="${floatationSampleInstance.id}" data-field="weight">${fieldValue(bean: floatationSampleInstance, field: "weight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${floatationSampleInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
