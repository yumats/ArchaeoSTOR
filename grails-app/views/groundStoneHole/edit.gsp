

<%@ page import="net.calit2.archaeology.database.GroundStoneHole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneHole.label', default: 'GroundStoneHole')}" />
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
            <g:hasErrors bean="${groundStoneHoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${groundStoneHoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${groundStoneHoleInstance?.id}" />
                <g:hiddenField name="version" value="${groundStoneHoleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diameter"><g:message code="groundStoneHole.diameter.label" default="Diameter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneHoleInstance, field: 'diameter', 'errors')}">
                                    <g:textField name="diameter" value="${fieldValue(bean: groundStoneHoleInstance, field: 'diameter')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="depth"><g:message code="groundStoneHole.depth.label" default="Depth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneHoleInstance, field: 'depth', 'errors')}">
                                    <g:textField name="depth" value="${fieldValue(bean: groundStoneHoleInstance, field: 'depth')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crossShape"><g:message code="groundStoneHole.crossShape.label" default="Cross Shape" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneHoleInstance, field: 'crossShape', 'errors')}">
                                    <g:textField name="crossShape" value="${groundStoneHoleInstance?.crossShape}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="location"><g:message code="groundStoneHole.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneHoleInstance, field: 'location', 'errors')}">
                                    <g:textField name="location" value="${groundStoneHoleInstance?.location}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="groundStoneDiagnostic"><g:message code="groundStoneHole.groundStoneDiagnostic.label" default="Ground Stone Diagnostic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneHoleInstance, field: 'groundStoneDiagnostic', 'errors')}">
                                    <g:select name="groundStoneDiagnostic.id" from="${net.calit2.archaeology.database.GroundStoneDiagnostic.list()}" optionKey="id" value="${groundStoneHoleInstance?.groundStoneDiagnostic?.id}"  />
                                </td>
                            </tr>
                        
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
