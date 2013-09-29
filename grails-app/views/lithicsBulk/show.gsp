
<%@ page import="net.calit2.archaeology.database.LithicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lithicsBulk.label', default: 'LithicsBulk')}" />
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
                            <td valign="top" class="name"><g:message code="lithicsBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${lithicsBulkInstance?.site?.id}">${lithicsBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${lithicsBulkInstance?.surveyFeature?.id}">${lithicsBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${lithicsBulkInstance?.crate?.id}">${lithicsBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.count.label" default="Count" /></td>

                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "count")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.weight.label" default="Weight" /></td>

                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "weight")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.countDebitage.label" default="Count Debitage" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "countDebitage")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.weightDebitage.label" default="Weight Debitage" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "weightDebitage")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.countCores.label" default="Count Cores" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "countCores")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.weightCores.label" default="Weight Cores" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "weightCores")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.countTools.label" default="Count Tools" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "countTools")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lithicsBulk.weightTools.label" default="Weight Tools" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lithicsBulkInstance, field: "weightTools")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${lithicsBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
