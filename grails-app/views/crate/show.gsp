
<%@ page import="net.calit2.archaeology.database.Crate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crate.label', default: 'Crate')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="crate.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: crateInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.number.label" default="Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: crateInstance, field: "number")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.site.label" default="Site" /></td>

                            <td valign="top" class="value"><g:link controller="site" action="show" id="${crateInstance?.site?.id}">${crateInstance?.site?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.year.label" default="Year" /></td>

                            <td valign="top" class="value">${crateInstance?.year}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.locationFiled.label" default="Location Field" /></td>

                            <td valign="top" class="value">${fieldValue(bean: crateInstance, field: "locationField")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.locationSanDiego.label" default="Location San Diego" /></td>

                            <td valign="top" class="value">${fieldValue(bean: crateInstance, field: "locationSanDiego")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.contents.label" default="Contents" /></td>

                            <td valign="top" class="value">${fieldValue(bean: crateInstance, field: "contents")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crate.artifacts.label" default="Artifacts" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${crateInstance.artifacts}" var="a">
                                    <li><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${crateInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
