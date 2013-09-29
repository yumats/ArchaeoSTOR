
<%@ page import="net.calit2.archaeology.database.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <!--
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            -->
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'artifact.id.label', default: 'Id')}" />

                            <g:sortableColumn property="year" title="${message(code: 'artifact.year.label', default: 'Year')}" />

                            <g:sortableColumn property="date" title="${message(code: 'artifact.date.label', default: 'Date')}" />

                            <th><g:message code="artifact.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="type" title="${message(code: 'artifact.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="area" title="${message(code: 'artifact.area.label', default: 'Area')}" />
                        
                            <g:sortableColumn property="edm" title="${message(code: 'artifact.edm.label', default: 'EDM')}" />
                        
                            <g:sortableColumn property="basket" title="${message(code: 'artifact.basket.label', default: 'Basket')}" />
                        
                            <g:sortableColumn property="locus" title="${message(code: 'artifact.locus.label', default: 'Locus')}" />
                        
                            <th><g:message code="artifact.surveyFeature.label" default="Survey Feature" /></th>
                        
                            <g:sortableColumn property="count" title="${message(code: 'artifact.count.label', default: 'Count')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'artifact.weight.label', default: 'Weight')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'artifact.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="period" title="${message(code: 'artifact.period.label', default: 'Period')}" />
                        
                            <g:sortableColumn property="storageField" title="${message(code: 'artifact.storageField.label', default: 'Storage Field')}" />
                        
                            <g:sortableColumn property="storageSanDiego" title="${message(code: 'artifact.storageSanDiego.label', default: 'Storage San Diego')}" />
                        
                            <g:sortableColumn property="crate" title="${message(code: 'artifact.crate.label', default: 'Crate')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artifactInstanceList}" status="i" var="artifactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${artifactInstance.id}">${fieldValue(bean: artifactInstance, field: "id")}</g:link></td>

                            <td>${artifactInstance?.year}</td>

                            <td>${fieldValue(bean: artifactInstance, field: "date")}</td>

                            <td>${fieldValue(bean: artifactInstance, field: "site")}</td>

                            <td>${fieldValue(bean: artifactInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "area")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "edm")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "basket")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "locus")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "surveyFeature")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "count")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "weight")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "period")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "storageField")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "storageSanDiego")}</td>
                        
                            <td>${fieldValue(bean: artifactInstance, field: "crate")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${artifactInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
