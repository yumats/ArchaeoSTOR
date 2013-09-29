
<%@ page import="net.calit2.archaeology.database.GroundStoneBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk')}" />
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
                            <td valign="top" class="name"><g:message code="groundStoneBulk.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${groundStoneBulkInstance?.site?.id}">${groundStoneBulkInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${groundStoneBulkInstance?.surveyFeature?.id}">${groundStoneBulkInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${groundStoneBulkInstance?.crate?.id}">${groundStoneBulkInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "storageSanDiego")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.countVessels.label" default="Count Vessels" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "countVessels")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weightVessels.label" default="Weight Vessels" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weightVessels")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.countHammerStones.label" default="Count Hammer Stones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "countHammerStones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weightHammerStones.label" default="Weight Hammer Stones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weightHammerStones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.countGrindingTools.label" default="Count Grinding Tools" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "countGrindingTools")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weightGrindingTools.label" default="Weight Grinding Tools" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weightGrindingTools")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.countPerforated.label" default="Count Perforated" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "countPerforated")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weightPerforated.label" default="Weight Perforated" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weightPerforated")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.countOther.label" default="Count Other" /></td>

                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "countOther")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="groundStoneBulk.weightOther.label" default="Weight Other" /></td>

                            <td valign="top" class="value">${fieldValue(bean: groundStoneBulkInstance, field: "weightOther")}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${groundStoneBulkInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
