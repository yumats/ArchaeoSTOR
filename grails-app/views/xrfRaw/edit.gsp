

<%@ page import="net.calit2.archaeology.database.XrfRaw" %>
<%@ page import="net.calit2.archaeology.database.Constants" %>
<html>
    <head>
        <flot:resources />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'xrfRaw.label', default: 'XrfRaw')}" />
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
            <g:hasErrors bean="${xrfRawInstance}">
            <div class="errors">
                <g:renderErrors bean="${xrfRawInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${xrfRawInstance?.id}" />
                <g:hiddenField name="version" value="${xrfRawInstance?.version}" />

                <g:javascript>
                    var data = [${data}];
                    var options = {
                        series: {
                            color: 1, /* rgb(0,0,0) */
                            lines: { show: true },
                            points: { show: false }
                        }
                    };
                </g:javascript>

                <div style="float:right">
                    <flot:plot id="placeholder" style="width: 400px; height: 200px;" data="data" options="options" />
                </div>

                <div class="dialog">
                    <table style="width:50%">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filename"><g:message code="xrfRaw.filename.label" default="Filename" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'filename', 'errors')}">
                                    ${fieldValue(bean: xrfRawInstance, field: "filename")}
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnostic"><g:message code="xrfRaw.diagnostic.label" default="Diagnostic ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'diagnostic', 'errors')}">
                                    <g:textField name="diagnostic.id" value="${xrfRawInstance?.diagnostic?.id}" />
                                    <g:if test="${xrfRawInstance?.diagnostic?.id}">
                                        <g:link controller="diagnostic" action="edit" id="${xrfRawInstance?.diagnostic?.id}">(Show Diagnostic)</g:link>
                                    </g:if>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="machineSerialNumber"><g:message code="xrfRaw.machineSerialNumber.label" default="Machine Serial Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'machineSerialNumber', 'errors')}">
                                    <g:textField name="machineSerialNumber" value="${xrfRawInstance?.machineSerialNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="materialType"><g:message code="xrfRaw.materialType.label" default="Material Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'materialType', 'errors')}">
                                    <g:select name="materialType" from="${Constants.D_CODE.entrySet()}" optionKey="value" optionValue="key" value="${xrfRawInstance?.materialType}" valueMessagePrefix="xrfRaw.materialType"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isHeterogeneous"><g:message code="xrfRaw.isHeterogeneous.label" default="Is Heterogeneous" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'isHeterogeneous', 'errors')}">
                                    <g:checkBox name="isHeterogeneous" value="${xrfRawInstance?.isHeterogeneous}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isGround"><g:message code="xrfRaw.isGround.label" default="Is Ground" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'isGround', 'errors')}">
                                    <g:checkBox name="isGround" value="${xrfRawInstance?.isGround}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="time"><g:message code="xrfRaw.time.label" default="Time (sec)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'time', 'errors')}">
                                    <g:textField name="time" value="${fieldValue(bean: xrfRawInstance, field: 'time')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filter"><g:message code="xrfRaw.filter.label" default="Filter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'filter', 'errors')}">
                                    <g:select name="filter" from="${xrfRawInstance.constraints.filter.inList}" value="${xrfRawInstance?.filter}" valueMessagePrefix="xrfRaw.filter"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isVacuumOn"><g:message code="xrfRaw.isVacuumOn.label" default="Is Vacuum On" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'isVacuumOn', 'errors')}">
                                    <g:checkBox name="isVacuumOn" value="${xrfRawInstance?.isVacuumOn}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="keyValue"><g:message code="xrfRaw.keyValue.label" default="Key Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'keyValue', 'errors')}">
                                    <g:textField name="keyValue" value="${fieldValue(bean: xrfRawInstance, field: 'keyValue')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="microAmpsValue"><g:message code="xrfRaw.microAmpsValue.label" default="Micro Amps Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'microAmpsValue', 'errors')}">
                                    <g:textField name="microAmpsValue" value="${fieldValue(bean: xrfRawInstance, field: 'microAmpsValue')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="xrfRaw.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'count', 'errors')}">
                                    <g:select name="count" from="${xrfRawInstance.constraints.count.inList}" value="${xrfRawInstance?.count}" valueMessagePrefix="xrfRaw.count"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="notes"><g:message code="xrfRaw.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: xrfRawInstance, field: 'notes', 'errors')}">
                                    <g:textArea name="notes" cols="40" rows="5" value="${xrfRawInstance?.notes}" />
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
