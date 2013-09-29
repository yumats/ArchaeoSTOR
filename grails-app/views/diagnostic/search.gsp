

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
        </div>
        <div class="body">
            <h1><g:message code="default.search.label" args="[entityName]" /></h1>
            <g:form method="post" >
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