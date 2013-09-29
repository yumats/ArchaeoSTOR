

<%@ page import="net.calit2.archaeology.database.FtirRaw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ftirRaw.label', default: 'FtirRaw')}" />
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
            <g:hasErrors bean="${ftirRawInstance}">
            <div class="errors">
                <g:renderErrors bean="${ftirRawInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${ftirRawInstance?.id}" />
                <g:hiddenField name="version" value="${ftirRawInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diagnostic"><g:message code="ftirRaw.diagnostic.label" default="Diagnostic ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ftirRawInstance, field: 'diagnostic', 'errors')}">
                                    <g:textField name="diagnostic.id" value="${ftirRawInstance?.diagnostic?.id}" />
                                    <g:if test="${ftirRawInstance?.diagnostic?.id}">
                                        <g:link controller="diagnostic" action="edit" id="${ftirRawInstance?.diagnostic?.id}">(Show Diagnostic)</g:link>
                                    </g:if>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filename"><g:message code="ftirRaw.filename.label" default="Filename" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ftirRawInstance, field: 'filename', 'errors')}">
                                    ${ftirRawInstance?.filename}
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="download" action="export" value="${message(code: 'default.button.export.label', default: 'Export')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
