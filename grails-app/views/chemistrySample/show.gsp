
<%@ page import="net.calit2.archaeology.database.ChemistrySample" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'chemistrySample.label', default: 'ChemistrySample')}" />
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
                            <td valign="top" class="name"><g:message code="chemistrySample.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${chemistrySampleInstance?.year}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "date")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${chemistrySampleInstance?.site?.id}">${chemistrySampleInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.edm.label" default="Edm" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${chemistrySampleInstance?.surveyFeature?.id}">${chemistrySampleInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.crate.label" default="Crate" /></td>
                            
                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${chemistrySampleInstance?.crate?.id}">${chemistrySampleInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.diagnostics.label" default="Diagnostics" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${chemistrySampleInstance.diagnostics}" var="d">
                                    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "storageSanDiego")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "weight")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="chemistrySample.sampleNumber.label" default="Sample Number" /></td>

                            <td valign="top" class="value">${fieldValue(bean: chemistrySampleInstance, field: "sampleNumber")}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${chemistrySampleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
