

<%@ page import="net.calit2.archaeology.database.Diagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
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
            <g:hasErrors bean="${diagnosticInstance}">
            <div class="errors">
                <g:renderErrors bean="${diagnosticInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${diagnosticInstance?.id}" />
                <g:hiddenField name="version" value="${diagnosticInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registration"><g:message code="diagnostic.registration.label" default="Registration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diagnosticInstance, field: 'registration', 'errors')}">
                                    <g:textField name="registration" value="${fieldValue(bean: diagnosticInstance, field: 'registration')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="artifact"><g:message code="diagnostic.artifact.label" default="Artifact ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diagnosticInstance, field: 'artifact', 'errors')}">
                                    <g:textField name="artifact.id" value="${diagnosticInstance?.artifact?.id}"  />
                                    <g:if test="${diagnosticInstance?.artifact?.id}">
                                        <g:link controller="artifact" action="edit" id="${diagnosticInstance?.artifact?.id}">(Show Artifact)</g:link>
                                    </g:if>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">Year</td>
                                <td valign="top" class="value">${diagnosticInstance.artifact?.year}</td>
                                <g:hiddenField name="year" value="${diagnosticInstance.artifact?.year}" />
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Site</td>
                                <td valign="top" class="value">${diagnosticInstance.artifact?.site}</td>
                                <g:hiddenField name="site" value="${diagnosticInstance.artifact?.site}" />
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">EDM</td>
                                <td valign="top" class="value">${diagnosticInstance.artifact?.edm}</td>
                                <g:hiddenField name="edm" value="${diagnosticInstance.artifact?.edm}" />
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Basket</td>
                                <td valign="top" class="value">${diagnosticInstance.artifact?.basket}</td>
                                <g:hiddenField name="basket" value="${diagnosticInstance.artifact?.basket}" />
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Locus</td>
                                <td valign="top" class="value">${diagnosticInstance.artifact?.locus}</td>
                                <g:hiddenField name="locus" value="${diagnosticInstance.artifact?.locus}" />
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="xrfRaws"><g:message code="diagnostic.xrfRaws.label" default="XRF" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diagnosticInstance, field: 'xrfRaws', 'errors')}">
                                    
<ul>
<g:each in="${diagnosticInstance?.xrfRaws?}" var="x">
    <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="xrfRaw" action="create" params="['diagnostic.id': diagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'xrfRaw.label', default: 'XRF')])}</g:link>

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ftirRaws"><g:message code="diagnostic.ftirRaws.label" default="FTIR" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diagnosticInstance, field: 'ftirRaws', 'errors')}">

<ul>
<g:each in="${diagnosticInstance?.ftirRaws?}" var="x">
    <li><g:link controller="ftirRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="ftirRaw" action="create" params="['diagnostic.id': diagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ftirRaw.label', default: 'FTIR')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
