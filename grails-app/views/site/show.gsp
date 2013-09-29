
<%@ page import="net.calit2.archaeology.database.Site" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="site.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.northing.label" default="Northing" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "northing")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.easting.label" default="Easting" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "easting")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.latitude.label" default="Latitude" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "latitude")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.longitude.label" default="Longitude" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "longitude")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.elevation.label" default="Elevation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "elevation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.srid.label" default="SRID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "srid")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "name")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.linkName.label" default="Link Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "linkName")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.otherNames.label" default="Other Names" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "otherNames")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.number.label" default="Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "number")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.majorPeriods.label" default="Major Periods" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "majorPeriods")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.otherPeriods.label" default="Other Periods" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "otherPeriods")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.type2.label" default="Type2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "type2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.type3.label" default="Type3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "type3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.surveyors.label" default="Surveyors" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "surveyors")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.excavationInstitution.label" default="Excavation Institution" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "excavationInstitution")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.permitNumber.label" default="Permit Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "permitNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.publicationBibliography.label" default="Publication Bibliography" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "publicationBibliography")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.collectionStrategy.label" default="Collection Strategy" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "collectionStrategy")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.paleolithic.label" default="Paleolithic" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "paleolithic")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.natufian.label" default="Natufian" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "natufian")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.neo.label" default="Neo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "neo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ppn.label" default="PPN" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ppn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ppna.label" default="PPNa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ppna")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ppnbc.label" default="PPNb_c" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ppnbc")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.pn.label" default="PN" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "pn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.prehistoric.label" default="Prehistoric" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "prehistoric")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.chal.label" default="Chal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "chal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.eb.label" default="EB" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "eb")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.eb1.label" default="EB1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "eb1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.eb23.label" default="EB2_3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "eb23")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ib.label" default="IB" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ib")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mb.label" default="MB" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mb")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mb2a.label" default="MB2a" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mb2a")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mb2bc.label" default="MB2b_c" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mb2bc")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.lb.label" default="LB" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "lb")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ia.label" default="IA" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ia1.label" default="IA1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ia1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ia2.label" default="IA2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ia2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ia3.label" default="IA3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ia3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.classical.label" default="Classical" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "classical")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.hel.label" default="Hel" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "hel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.rom.label" default="Rom" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "rom")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.erom.label" default="ERom" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "erom")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.lrom.label" default="LRom" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "lrom")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.byz.label" default="Byz" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "byz")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ebyz.label" default="EByz" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ebyz")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.lbyz.label" default="LByz" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "lbyz")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.islamic.label" default="Islamic" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "islamic")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.ei.label" default="EI" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "ei")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mi1.label" default="MI1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mi1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mi23.label" default="MI2_3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mi23")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.li.label" default="LI" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "li")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.mandateModern.label" default="Mandate/Modern" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "mandateModern")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: siteInstance, field: "comments")}</td>
                            
                        </tr>

                    <!--
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.artifacts.label" default="Artifacts" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${siteInstance.artifacts}" var="a">
                                    <li><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="site.surveyFeatures.label" default="Survey Features" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${siteInstance.surveyFeatures}" var="s">
                                    <li><g:link controller="surveyFeature" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${siteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
