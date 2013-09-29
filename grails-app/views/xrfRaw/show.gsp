
<%@ page import="net.calit2.archaeology.database.XrfRaw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'xrfRaw.label', default: 'XrfRaw')}" />
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
                            <td valign="top" class="name"><g:message code="xrfRaw.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "id")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.filename.label" default="Filename" /></td>

                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "filename")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.diagnostic.label" default="Diagnostic" /></td>

                            <td valign="top" class="value"><g:link controller="diagnostic" action="show" id="${xrfRaw?.diagnostic?.id}">${xrfRawInstance?.diagnostic?.encodeAsHTML()}</g:link></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.machineSerialNumber.label" default="Machine Serial Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "machineSerialNumber")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.isHeterogeneous.label" default="Is Heterogeneous" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${xrfRawInstance?.isHeterogeneous}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.isGround.label" default="Is Ground" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${xrfRawInstance?.isGround}" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.materialType.label" default="Material Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "materialType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.time.label" default="Time (sec)" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "time")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.filter.label" default="Filter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "filter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.isVacuumOn.label" default="Is Vacuum On" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${xrfRawInstance?.isVacuumOn}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.keyValue.label" default="Key Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "keyValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.microAmpsValue.label" default="Micro Amps Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "microAmpsValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="xrfRaw.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: xrfRawInstance, field: "notes")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${xrfRawInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="download" action="export" value="${message(code: 'default.button.export.label', default: 'Export')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
