
<%@ page import="net.calit2.archaeology.database.GlassBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'glassBulk.label', default: 'GlassBulk')}" />
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
                            <td valign="top" class="name"><g:message code="glassBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${glassBulkInstance?.site?.id}">${glassBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${glassBulkInstance?.surveyFeature?.id}">${glassBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${glassBulkInstance?.crate?.id}">${glassBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.diagnostics.label" default="Diagnostics" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${glassBulkInstance.diagnostics}" var="d">
                                    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.bulkCount.label" default="Bulk Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "bulkCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.bulkWeight.label" default="Bulk Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "bulkWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.diagnosticCount.label" default="Diagnostic Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "diagnosticCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="glassBulk.diagnosticWeight.label" default="Diagnostic Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: glassBulkInstance, field: "diagnosticWeight")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${glassBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
