
<%@ page import="net.calit2.archaeology.database.Diagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
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
                            <td valign="top" class="name"><g:message code="diagnostic.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: diagnosticInstance, field: "id")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="diagnostic.registration.label" default="Registration" /></td>

                            <td valign="top" class="value">${fieldValue(bean: diagnosticInstance, field: "registration")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Year</td>
                            <td valign="top" class="value">${diagnosticInstance?.artifact?.year}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Site</td>
                            <td valign="top" class="value">${diagnosticInstance?.artifact?.site}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="diagnostic.artifact.label" default="Artifact" /></td>
                            
                            <td valign="top" class="value"><g:link controller="artifact" action="show" id="${diagnosticInstance?.artifact?.id}">${diagnosticInstance?.artifact?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="diagnostic.xrfRaws.label" default="XRF" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${diagnosticInstance.xrfRaws}" var="x">
                                    <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="diagnostic.ftirRaws.label" default="FTIR" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${diagnosticInstance.ftirRaws}" var="x">
                                    <li><g:link controller="ftirRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${diagnosticInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
