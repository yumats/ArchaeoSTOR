
<%@ page import="net.calit2.archaeology.database.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <!--
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            -->
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
                            <td valign="top" class="name"><g:message code="artifact.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "id")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.year.label" default="Year" /></td>

                            <td valign="top" class="value">${artifactInstance?.year}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.date.label" default="Date" /></td>

                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "date")}</td>

                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value"><g:link controller="site" action="show" id="${artifactInstance?.site?.id}">${artifactInstance?.site?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.edm.label" default="EDM" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "edm")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.surveyFeature.label" default="Survey Feature" /></td>
                            
                            <td valign="top" class="value"><g:link controller="surveyFeature" action="show" id="${artifactInstance?.surveyFeature?.id}">${artifactInstance?.surveyFeature?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.count.label" default="Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "count")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.storageField.label" default="Storage Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "storageField")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.storageSanDiego.label" default="Storage San Diego" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artifactInstance, field: "storageSanDiego")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.crate.label" default="Crate" /></td>

                            <td valign="top" class="value"><g:link controller="crate" action="show" id="${artifactInstance?.crate?.id}">${artifactInstance?.crate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${artifactInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
