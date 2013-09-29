f
<%@ page import="net.calit2.archaeology.database.OtherBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherBulk.label', default: 'OtherBulk')}" />
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
                            <td valign="top" class="name"><g:message code="otherBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${otherBulkInstance?.site?.id}">${otherBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${otherBulkInstance?.surveyFeature?.id}">${otherBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${otherBulkInstance?.crate?.id}">${otherBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.diagnostics.label" default="Diagnostics" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${otherBulkInstance.diagnostics}" var="d">
                                    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherBulk.dCode.label" default="ArchField Dcode" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherBulkInstance, field: "dCode")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${otherBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
