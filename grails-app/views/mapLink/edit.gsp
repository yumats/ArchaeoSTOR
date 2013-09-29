

<%@ page import="net.calit2.archaeology.util.MapLink" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mapLink.label', default: 'MapLink')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mapLinkInstance}">
            <div class="errors">
                <g:renderErrors bean="${mapLinkInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${mapLinkInstance?.id}" />
                <g:hiddenField name="version" value="${mapLinkInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="layer"><g:message code="mapLink.layer.label" default="Layer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapLinkInstance, field: 'layer', 'errors')}">
                                    <g:textField name="layer" value="${mapLinkInstance?.layer}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="minX"><g:message code="mapLink.minX.label" default="Min X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapLinkInstance, field: 'minX', 'errors')}">
                                    <g:textField name="minX" value="${fieldValue(bean: mapLinkInstance, field: 'minX')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="minY"><g:message code="mapLink.minY.label" default="Min Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapLinkInstance, field: 'minY', 'errors')}">
                                    <g:textField name="minY" value="${fieldValue(bean: mapLinkInstance, field: 'minY')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="maxX"><g:message code="mapLink.maxX.label" default="Max X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapLinkInstance, field: 'maxX', 'errors')}">
                                    <g:textField name="maxX" value="${fieldValue(bean: mapLinkInstance, field: 'maxX')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="maxY"><g:message code="mapLink.maxY.label" default="Max Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapLinkInstance, field: 'maxY', 'errors')}">
                                    <g:textField name="maxY" value="${fieldValue(bean: mapLinkInstance, field: 'maxY')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
