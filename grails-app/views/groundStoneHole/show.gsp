
<%@ page import="net.calit2.archaeology.database.GroundStoneHole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneHole.label', default: 'GroundStoneHole')}" />
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
                            <td valign="top" class="name"><g:message code="groundStoneHole.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneHoleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneHole.diameter.label" default="Diameter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneHoleInstance, field: "diameter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneHole.depth.label" default="Depth" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneHoleInstance, field: "depth")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneHole.crossShape.label" default="Cross Shape" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneHoleInstance, field: "crossShape")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneHole.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneHoleInstance, field: "location")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneHole.groundStoneDiagnostic.label" default="Ground Stone Diagnostic" /></td>
                            
                            <td valign="top" class="value"><g:link controller="groundStoneDiagnostic" action="show" id="${groundStoneHoleInstance?.groundStoneDiagnostic?.id}">${groundStoneHoleInstance?.groundStoneDiagnostic?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${groundStoneHoleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
