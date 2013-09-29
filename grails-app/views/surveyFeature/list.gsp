
<%@ page import="net.calit2.archaeology.database.SurveyFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyFeature.label', default: 'SurveyFeature')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'surveyFeature.id.label', default: 'Id')}" />
                        
                            <th><g:message code="surveyFeature.site.label" default="Site" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'surveyFeature.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="number" title="${message(code: 'surveyFeature.number.label', default: 'Number')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'surveyFeature.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="areaDescription" title="${message(code: 'surveyFeature.areaDescription.label', default: 'Area Description')}" />
                        
                            <g:sortableColumn property="function" title="${message(code: 'surveyFeature.function.label', default: 'Function')}" />
                        
                            <g:sortableColumn property="spatialData" title="${message(code: 'surveyFeature.spatialData.label', default: 'Spatial Data')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyFeatureInstanceList}" status="i" var="surveyFeatureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${surveyFeatureInstance.id}">${fieldValue(bean: surveyFeatureInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "site")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "number")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "areaDescription")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "function")}</td>
                        
                            <td>${fieldValue(bean: surveyFeatureInstance, field: "spatialData")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${surveyFeatureInstanceTotal}" />
                </div>
            </g:if>
        </div>
    </body>
</html>
