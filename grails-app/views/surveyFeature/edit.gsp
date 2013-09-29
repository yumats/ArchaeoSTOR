

<%@ page import="net.calit2.archaeology.database.SurveyFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyFeature.label', default: 'SurveyFeature')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyFeatureInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyFeatureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${surveyFeatureInstance?.id}" />
                <g:hiddenField name="version" value="${surveyFeatureInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="surveyFeature.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${surveyFeatureInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="surveyFeature.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${surveyFeatureInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="number"><g:message code="surveyFeature.number.label" default="Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'number', 'errors')}">
                                    <g:textField name="number" value="${surveyFeatureInstance?.number}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="surveyFeature.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${surveyFeatureInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="areaDescription"><g:message code="surveyFeature.areaDescription.label" default="Area Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'areaDescription', 'errors')}">
                                    <g:textField name="areaDescription" value="${surveyFeatureInstance?.areaDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="function"><g:message code="surveyFeature.function.label" default="Function" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'function', 'errors')}">
                                    <g:textField name="function" value="${surveyFeatureInstance?.function}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="spatialData"><g:message code="surveyFeature.spatialData.label" default="Spatial Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyFeatureInstance, field: 'spatialData', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
