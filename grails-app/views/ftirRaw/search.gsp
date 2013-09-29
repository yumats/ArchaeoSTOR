

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
        </div>
        <div class="body">
            <h1><g:message code="default.search.label" args="[entityName]" /></h1>
            <g:form method="post"  enctype="multipart/form-data">
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
                                  <label for="filename"><g:message code="ftirRaw.filename.label" default="Filename" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ftirRawInstance, field: 'filename', 'errors')}">
                                    <g:textField name="filename" value="${ftirRawInstance?.filename}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="search" action="query" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
