
<%@ page import="net.calit2.archaeology.database.SlagBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'slagBulk.label', default: 'SlagBulk')}" />
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
                            <td valign="top" class="name"><g:message code="slagBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${slagBulkInstance?.site?.id}">${slagBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${slagBulkInstance?.surveyFeature?.id}">${slagBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${slagBulkInstance?.crate?.id}">${slagBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.count.label" default="Count" /></td>

                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "count")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.weight.label" default="Weight" /></td>

                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "weight")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.countSmall.label" default="Count Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "countSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.weightSmall.label" default="Weight Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "weightSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.countMedium.label" default="Count Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "countMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.weightMedium.label" default="Weight Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "weightMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.countLarge.label" default="Count Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "countLarge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="slagBulk.weightLarge.label" default="Weight Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: slagBulkInstance, field: "weightLarge")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${slagBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
