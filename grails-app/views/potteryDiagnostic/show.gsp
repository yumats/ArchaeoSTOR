
<%@ page import="net.calit2.archaeology.database.PotteryDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic')}" />
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
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.registration.label" default="Registration" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "registration")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.artifact.label" default="Pottery Bulk" /></td>

                            <td valign="top" class="value"><g:link controller="artifact" action="show" id="${potteryDiagnosticInstance?.artifact?.id}">${potteryDiagnosticInstance?.artifact?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Year</td>
                            <td valign="top" class="value">${potteryDiagnosticInstance?.artifact?.year}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Site</td>
                            <td valign="top" class="value">${potteryDiagnosticInstance?.artifact?.site}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Survey Feature</td>
                            <td valign="top" class="value">${potteryDiagnosticInstance?.artifact?.surveyFeature}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.generalType.label" default="General Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "generalType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.period.label" default="Period" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "period")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.illustration.label" default="Illustration" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "illustration")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.fabric.label" default="Fabric" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "fabric")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.ware.label" default="Ware" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "ware")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.exterior.label" default="Exterior" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "exterior")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.interior.label" default="Interior" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "interior")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.core.label" default="Core" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "core")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rimDiameter.label" default="Rim Diameter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rimDiameter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rimThickness.label" default="Rim Thickness" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rimThickness")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rimComplete.label" default="Rim Complete" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rimComplete")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rimAngle.label" default="Rim Angle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rimAngle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rimTreatment.label" default="Rim Treatment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rimTreatment")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.attachmentPoint.label" default="Attachment Point" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "attachmentPoint")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.handleType.label" default="Handle Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "handleType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.handleThickness.label" default="Handle Thickness" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "handleThickness")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isLedgeCut.label" default="Is Ledge Cut" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isLedgeCut}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.rippleCount.label" default="Ripple Count" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "rippleCount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.basalDiameter.label" default="Basal Diameter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "basalDiameter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.baseComplete.label" default="Base Complete" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "baseComplete")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.angleOpening.label" default="Angle Opening" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "angleOpening")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.lidDiameter.label" default="Lid Diameter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "lidDiameter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.lidThickness.label" default="Lid Thickness" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "lidThickness")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isPainted.label" default="Is Painted" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isPainted}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isPaintedInside.label" default="Is Painted Inside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isPaintedInside}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isPaintedOutside.label" default="Is Painted Outside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isPaintedOutside}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isSlipped.label" default="Is Slipped" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isSlipped}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isSlippedInside.label" default="Is Slipped Inside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isSlippedInside}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isSlippedOutside.label" default="Is Slipped Outside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isSlippedOutside}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isBurnished.label" default="Is Burnished" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isBurnished}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isBurnishedInside.label" default="Is Burnished Inside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isBurnishedInside}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isBurnishedOutside.label" default="Is Burnished Outside" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isBurnishedOutside}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isGlazed.label" default="Is Glazed" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isGlazed}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isGlazedInside.label" default="Is Glazed Inside" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isGlazedInside}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isGlazedInside.label" default="Is Glazed Outside" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isGlazedOutside}" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.insideColor.label" default="Inside Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "insideColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.outsideColor.label" default="Outside Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "outsideColor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.designDescription.label" default="Design Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "designDescription")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isPlasticApplication.label" default="Is Plastic Application" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isPlasticApplication}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.plasticDescription.label" default="Plastic Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "plasticDescription")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.isIncised.label" default="Is Incised" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${potteryDiagnosticInstance?.isIncised}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.incisedDescription.label" default="Incised Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: potteryDiagnosticInstance, field: "incisedDescription")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.xrfRaws.label" default="XRF Raws" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                    <g:each in="${potteryDiagnosticInstance.xrfRaws}" var="x">
                                        <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                </ul>
                            </td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="potteryDiagnostic.ftirRaws.label" default="FTIR Raws" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${potteryDiagnosticInstance.ftirRaws}" var="f">
                                    <li><g:link controller="ftirRaw" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${potteryDiagnosticInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
