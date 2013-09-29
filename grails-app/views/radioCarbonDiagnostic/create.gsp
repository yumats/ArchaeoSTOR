

<%@ page import="net.calit2.archaeology.database.RadioCarbonDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${radioCarbonDiagnosticInstance}">
            <div class="errors">
                <g:renderErrors bean="${radioCarbonDiagnosticInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artifact"><g:message code="radioCarbonDiagnostic.artifact.label" default="Radio Carbon Bulk ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'artifact', 'errors')}">
                                    <g:textField name="artifact.id" value="${radioCarbonDiagnosticInstance?.artifact?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="labNumber"><g:message code="radioCarbonDiagnostic.labNumber.label" default="Lab Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'labNumber', 'errors')}">
                                    <g:textField name="labNumber" value="${radioCarbonDiagnosticInstance?.labNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sampleMaterial"><g:message code="radioCarbonDiagnostic.sampleMaterial.label" default="Sample Material" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'sampleMaterial', 'errors')}">
                                    <g:textField name="sampleMaterial" value="${radioCarbonDiagnosticInstance?.sampleMaterial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="species"><g:message code="radioCarbonDiagnostic.species.label" default="Species" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'species', 'errors')}">
                                    <g:textField name="species" value="${radioCarbonDiagnosticInstance?.species}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateBp"><g:message code="radioCarbonDiagnostic.dateBp.label" default="Date Bp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'dateBp', 'errors')}">
                                    <g:textField name="dateBp" value="${fieldValue(bean: radioCarbonDiagnosticInstance, field: 'dateBp')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uncertainty"><g:message code="radioCarbonDiagnostic.uncertainty.label" default="Uncertainty" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'uncertainty', 'errors')}">
                                    <g:textField name="uncertainty" value="${fieldValue(bean: radioCarbonDiagnosticInstance, field: 'uncertainty')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="radioCarbonDiagnostic.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${radioCarbonDiagnosticInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
