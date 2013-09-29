
<%@ page import="net.calit2.archaeology.database.PotteryBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryBulk.label', default: 'PotteryBulk')}" />
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
                            <td valign="top" class="name"><g:message code="potteryBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "id")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.year.label" default="Year" /></td>

                            <td valign="top" class="value">${potteryBulkInstance?.year}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.date.label" default="Date" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "date")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.site.label" default="Site" /></td>

                            <td valign="top" class="value"><g:link controller="site" action="show" id="${potteryBulkInstance?.site?.id}">${potteryBulkInstance?.site?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.type.label" default="Type" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "type")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.area.label" default="Area" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "area")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.edm.label" default="EDM" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "locus")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.surveyFeature.label" default="Survey Feature" /></td>

                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${potteryBulkInstance?.surveyFeature?.id}">${potteryBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.crate.label" default="Crate" /></td>

                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${potteryBulkInstance?.crate?.id}">${potteryBulkInstance?.crate?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.description.label" default="Description" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "description")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.period.label" default="Period" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "period")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.storageField.label" default="Storage Field" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "storageField")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.storageSanDiego.label" default="Storage San Diego" /></td>

                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "storageSanDiego")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.count.label" default="Total Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.weight.label" default="Total Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.handmadeCount.label" default="Handmade Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "handmadeCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.handmadeWeight.label" default="Handmade Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "handmadeWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.wheelmadeCount.label" default="Wheelmade Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "wheelmadeCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.wheelmadeWeight.label" default="Wheelmade Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "wheelmadeWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.cookingCount.label" default="Cooking Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "cookingCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.cookingWeight.label" default="Cooking Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "cookingWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.handlesCount.label" default="Handles Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "handlesCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.handlesWeight.label" default="Handles Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "handlesWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.basesCount.label" default="Bases Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "basesCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.basesWeight.label" default="Bases Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "basesWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.decorCount.label" default="Decor Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "decorCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.decorWeight.label" default="Decor Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "decorWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.diagnosticCount.label" default="Diagnostic Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "diagnosticCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.diagnosticWeight.label" default="Diagnostic Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "diagnosticWeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.otherSpecialCount.label" default="Other Special Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "otherSpecialCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.otherSpecialWeight.label" default="Other Special Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryBulkInstance, field: "otherSpecialWeight")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryBulk.diagnostics.label" default="Diagnostics" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${potteryBulkInstance.diagnostics}" var="a">
                                    <li><g:link controller="potteryDiagnostic" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${potteryBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
