
<%@ page import="net.calit2.archaeology.database.ShellBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shellBulk.label', default: 'ShellBulk')}" />
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
                            <td valign="top" class="name"><g:message code="shellBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${shellBulkInstance?.site?.id}">${shellBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${shellBulkInstance?.surveyFeature?.id}">${shellBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${shellBulkInstance?.crate?.id}">${shellBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.count.label" default="Count" /></td>

                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "count")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.weight.label" default="Weight" /></td>

                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "weight")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.countSmall.label" default="Count Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "countSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.weightSmall.label" default="Weight Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "weightSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.countMedium.label" default="Count Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "countMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.weightMedium.label" default="Weight Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "weightMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.countLarge.label" default="Count Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "countLarge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shellBulk.weightLarge.label" default="Weight Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shellBulkInstance, field: "weightLarge")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${shellBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
