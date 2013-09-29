

<%@ page import="net.calit2.archaeology.database.RadioCarbonDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${radioCarbonDiagnosticInstance}">
            <div class="errors">
                <g:renderErrors bean="${radioCarbonDiagnosticInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${radioCarbonDiagnosticInstance?.id}" />
                <g:hiddenField name="version" value="${radioCarbonDiagnosticInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="artifact"><g:message code="radioCarbonDiagnostic.artifact.label" default="Radio Carbon Bulk ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'artifact', 'errors')}">
                                    <g:textField name="artifact.id" value="${radioCarbonDiagnosticInstance?.artifact?.id}"  />
                                    <g:if test="${radioCarbonDiagnosticInstance?.artifact?.id}">
                                        <g:link controller="artifact" action="edit" id="${radioCarbonDiagnosticInstance?.artifact?.id}">(Show Artifact)</g:link>
                                    </g:if>
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
                                <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.timestamp.label" default="Timestamp" /></td>

                                <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "timestamp")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.unmodelledOneSigFrom.label" default="Unmodelled One Sig From" /></td>

                                <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledOneSigFrom")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.unmodelledOneSigTo.label" default="Unmodelled One Sig To" /></td>

                                <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledOneSigTo")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.unmodelledTwoSigFrom.label" default="Unmodelled Two Sig From" /></td>

                                <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledTwoSigFrom")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.unmodelledTwoSigTo.label" default="Unmodelled Two Sig To" /></td>

                                <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledTwoSigTo")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="radioCarbonDiagnostic.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${radioCarbonDiagnosticInstance?.description}" />
                                </td>
                            </tr>

                            <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period"><g:message code="radioCarbonDiagnostic.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${radioCarbonDiagnosticInstance.constraints.period.inList}" value="${radioCarbonDiagnosticInstance?.period}" valueMessagePrefix="radioCarbonDiagnostic.period"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="xrfRaws"><g:message code="radioCarbonDiagnostic.xrfRaws.label" default="Xrf Raws" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'xrfRaws', 'errors')}">

                                    <ul>
                                        <g:each in="${radioCarbonDiagnosticInstance?.xrfRaws?}" var="x">
                                            <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
                                        </g:each>
                                    </ul>
                                    <g:link controller="xrfRaw" action="create" params="['radioCarbonDiagnostic.id': radioCarbonDiagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'xrfRaw.label', default: 'XrfRaw')])}</g:link>

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ftirRaws"><g:message code="radioCarbonDiagnostic.ftirRaws.label" default="Ftir Raws" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonDiagnosticInstance, field: 'ftirRaws', 'errors')}">

                                    <ul>
                                        <g:each in="${radioCarbonDiagnosticInstance?.ftirRaws?}" var="f">
                                            <li><g:link controller="ftirRaw" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                        </g:each>
                                    </ul>
                                    <g:link controller="ftirRaw" action="create" params="['radioCarbonDiagnostic.id': radioCarbonDiagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ftirRaw.label', default: 'FtirRaw')])}</g:link>

                                </td>
                            </tr>
                            -->
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
