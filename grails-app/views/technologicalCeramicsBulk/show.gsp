
<%@ page import="net.calit2.archaeology.database.TechnologicalCeramicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk')}" />
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
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${technologicalCeramicsBulkInstance?.site?.id}">${technologicalCeramicsBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${technologicalCeramicsBulkInstance?.surveyFeature?.id}">${technologicalCeramicsBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${technologicalCeramicsBulkInstance?.crate?.id}">${technologicalCeramicsBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.count.label" default="Count" /></td>

                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "count")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.weight.label" default="Weight" /></td>

                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weight")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.countSmall.label" default="Count Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.weightSmall.label" default="Weight Small" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightSmall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.countMedium.label" default="Count Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.weightMedium.label" default="Weight Medium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightMedium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.countLarge.label" default="Count Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "countLarge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="technologicalCeramicsBulk.weightLarge.label" default="Weight Large" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: technologicalCeramicsBulkInstance, field: "weightLarge")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${technologicalCeramicsBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
