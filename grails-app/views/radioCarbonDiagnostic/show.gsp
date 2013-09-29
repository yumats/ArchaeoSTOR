
<%@ page import="net.calit2.archaeology.database.RadioCarbonDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.artifact.label" default="Artifact" /></td>
                            
                            <td valign="top" class="value"><g:link controller="artifact" action="show" id="${radioCarbonDiagnosticInstance?.artifact?.id}">${radioCarbonDiagnosticInstance?.artifact?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Year</td>
                            <td valign="top" class="value">${radioCarbonDiagnosticInstance?.artifact?.year}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Site</td>
                            <td valign="top" class="value">${radioCarbonDiagnosticInstance?.artifact?.site}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Survey Feature</td>
                            <td valign="top" class="value">${radioCarbonDiagnosticInstance?.artifact?.surveyFeature}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.labNumber.label" default="Lab Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "labNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.sampleMaterial.label" default="Sample Material" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "sampleMaterial")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.species.label" default="Species" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "species")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.dateBp.label" default="Date Bp" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "dateBp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.uncertainty.label" default="Uncertainty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "uncertainty")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.description.label" default="Description" /></td>

                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "description")}</td>

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

                        <!--
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.period.label" default="Period" /></td>

                            <td valign="top" class="value">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "period")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.xrfRaws.label" default="Xrf Raws" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                    <g:each in="${radioCarbonDiagnosticInstance.xrfRaws}" var="x">
                                        <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                </ul>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="radioCarbonDiagnostic.ftirRaws.label" default="Ftir Raws" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                    <g:each in="${radioCarbonDiagnosticInstance.ftirRaws}" var="f">
                                        <li><g:link controller="ftirRaw" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                </ul>
                            </td>

                        </tr>
                        -->
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${radioCarbonDiagnosticInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
