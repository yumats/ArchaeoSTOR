

<%@ page import="net.calit2.archaeology.database.GroundStoneGroove" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneGroove.label', default: 'GroundStoneGroove')}" />
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
            <g:hasErrors bean="${groundStoneGrooveInstance}">
            <div class="errors">
                <g:renderErrors bean="${groundStoneGrooveInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${groundStoneGrooveInstance?.id}" />
                <g:hiddenField name="version" value="${groundStoneGrooveInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="length"><g:message code="groundStoneGroove.length.label" default="Length" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneGrooveInstance, field: 'length', 'errors')}">
                                    <g:textField name="length" value="${fieldValue(bean: groundStoneGrooveInstance, field: 'length')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="width"><g:message code="groundStoneGroove.width.label" default="Width" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneGrooveInstance, field: 'width', 'errors')}">
                                    <g:textField name="width" value="${fieldValue(bean: groundStoneGrooveInstance, field: 'width')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="depth"><g:message code="groundStoneGroove.depth.label" default="Depth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneGrooveInstance, field: 'depth', 'errors')}">
                                    <g:textField name="depth" value="${fieldValue(bean: groundStoneGrooveInstance, field: 'depth')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="groundStoneDiagnostic"><g:message code="groundStoneGroove.groundStoneDiagnostic.label" default="Ground Stone Diagnostic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneGrooveInstance, field: 'groundStoneDiagnostic', 'errors')}">
                                    <g:select name="groundStoneDiagnostic.id" from="${net.calit2.archaeology.database.GroundStoneDiagnostic.list()}" optionKey="id" value="${groundStoneGrooveInstance?.groundStoneDiagnostic?.id}"  />
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
