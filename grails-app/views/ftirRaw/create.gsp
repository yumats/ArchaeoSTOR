

<%@ page import="net.calit2.archaeology.database.FtirRaw" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'ftirRaw.label', default: 'FtirRaw')}" />
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
    <g:hasErrors bean="${ftirRawInstance}">
        <div class="errors">
            <g:renderErrors bean="${ftirRawInstance}" as="list" />
        </div>
    </g:hasErrors>

    <g:render template="/findDiagnostic" />

    <g:uploadForm action="upload">
        <div class="dialog">
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="diagnostic"><g:message code="ftirRaw.diagnostic.label" default="Diagnostic ID" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: ftirRawInstance, field: 'diagnostic', 'errors')}">
                        <g:textField name="diagnostic.id" value="${ftirRawInstance?.diagnostic?.id}" />
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="content"><g:message code="ftirRaw.content.label" default="Content" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: ftirRawInstance, field: 'content', 'errors')}">
                        <input type="file" id="content" name="content" />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
        </div>
    </g:uploadForm>

</div>
</body>
</html>
