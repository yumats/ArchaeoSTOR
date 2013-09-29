

<%@ page import="net.calit2.archaeology.database.PotteryDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.search.label" args="[entityName]" /></h1>
            <g:form method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="artifact"><g:message code="potteryDiagnostic.artifact.label" default="Artifact" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'artifact', 'errors')}">
                                    <g:select name="artifact.id" from="${net.calit2.archaeology.database.Artifact.list()}" optionKey="id" value="${potteryDiagnosticInstance?.artifact?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="xrfRaws"><g:message code="potteryDiagnostic.xrfRaws.label" default="Xrf Raws" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'xrfRaws', 'errors')}">
                                    
<ul>
<g:each in="${potteryDiagnosticInstance?.xrfRaws?}" var="x">
    <li><g:link controller="xrfRaw" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="xrfRaw" action="create" params="['potteryDiagnostic.id': potteryDiagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'xrfRaw.label', default: 'XrfRaw')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registration"><g:message code="potteryDiagnostic.registration.label" default="Registration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'registration', 'errors')}">
                                    <g:textField name="registration" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'registration')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="generalType"><g:message code="potteryDiagnostic.generalType.label" default="General Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'generalType', 'errors')}">
                                    <g:textField name="generalType" value="${potteryDiagnosticInstance?.generalType}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="potteryDiagnostic.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${potteryDiagnosticInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="potteryDiagnostic.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${potteryDiagnosticInstance.constraints.period.inList}" value="${potteryDiagnosticInstance?.period}" valueMessagePrefix="potteryDiagnostic.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="illustration"><g:message code="potteryDiagnostic.illustration.label" default="Illustration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'illustration', 'errors')}">
                                    <g:select name="illustration" from="${potteryDiagnosticInstance.constraints.illustration.inList}" value="${potteryDiagnosticInstance?.illustration}" valueMessagePrefix="potteryDiagnostic.illustration"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fabric"><g:message code="potteryDiagnostic.fabric.label" default="Fabric" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'fabric', 'errors')}">
                                    <g:textField name="fabric" value="${potteryDiagnosticInstance?.fabric}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ware"><g:message code="potteryDiagnostic.ware.label" default="Ware" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'ware', 'errors')}">
                                    <g:textField name="ware" value="${potteryDiagnosticInstance?.ware}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="exterior"><g:message code="potteryDiagnostic.exterior.label" default="Exterior" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'exterior', 'errors')}">
                                    <g:textField name="exterior" value="${potteryDiagnosticInstance?.exterior}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="interior"><g:message code="potteryDiagnostic.interior.label" default="Interior" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'interior', 'errors')}">
                                    <g:textField name="interior" value="${potteryDiagnosticInstance?.interior}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="core"><g:message code="potteryDiagnostic.core.label" default="Core" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'core', 'errors')}">
                                    <g:textField name="core" value="${potteryDiagnosticInstance?.core}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rimDiameter"><g:message code="potteryDiagnostic.rimDiameter.label" default="Rim Diameter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rimDiameter', 'errors')}">
                                    <g:textField name="rimDiameter" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'rimDiameter')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rimThickness"><g:message code="potteryDiagnostic.rimThickness.label" default="Rim Thickness" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rimThickness', 'errors')}">
                                    <g:textField name="rimThickness" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'rimThickness')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rimComplete"><g:message code="potteryDiagnostic.rimComplete.label" default="Rim Complete" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rimComplete', 'errors')}">
                                    <g:textField name="rimComplete" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'rimComplete')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rimAngle"><g:message code="potteryDiagnostic.rimAngle.label" default="Rim Angle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rimAngle', 'errors')}">
                                    <g:select name="rimAngle" from="${potteryDiagnosticInstance.constraints.rimAngle.inList}" value="${potteryDiagnosticInstance?.rimAngle}" valueMessagePrefix="potteryDiagnostic.rimAngle"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rimTreatment"><g:message code="potteryDiagnostic.rimTreatment.label" default="Rim Treatment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rimTreatment', 'errors')}">
                                    <g:select name="rimTreatment" from="${potteryDiagnosticInstance.constraints.rimTreatment.inList}" value="${potteryDiagnosticInstance?.rimTreatment}" valueMessagePrefix="potteryDiagnostic.rimTreatment"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="attachmentPoint"><g:message code="potteryDiagnostic.attachmentPoint.label" default="Attachment Point" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'attachmentPoint', 'errors')}">
                                    <g:textField name="attachmentPoint" value="${potteryDiagnosticInstance?.attachmentPoint}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="handleType"><g:message code="potteryDiagnostic.handleType.label" default="Handle Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'handleType', 'errors')}">
                                    <g:select name="handleType" from="${potteryDiagnosticInstance.constraints.handleType.inList}" value="${potteryDiagnosticInstance?.handleType}" valueMessagePrefix="potteryDiagnostic.handleType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="handleThickness"><g:message code="potteryDiagnostic.handleThickness.label" default="Handle Thickness" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'handleThickness', 'errors')}">
                                    <g:textField name="handleThickness" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'handleThickness')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isLedgeCut"><g:message code="potteryDiagnostic.isLedgeCut.label" default="Is Ledge Cut" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isLedgeCut', 'errors')}">
                                    <g:checkBox name="isLedgeCut" value="${potteryDiagnosticInstance?.isLedgeCut}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rippleCount"><g:message code="potteryDiagnostic.rippleCount.label" default="Ripple Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'rippleCount', 'errors')}">
                                    <g:textField name="rippleCount" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'rippleCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basalDiameter"><g:message code="potteryDiagnostic.basalDiameter.label" default="Basal Diameter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'basalDiameter', 'errors')}">
                                    <g:textField name="basalDiameter" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'basalDiameter')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="baseComplete"><g:message code="potteryDiagnostic.baseComplete.label" default="Base Complete" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'baseComplete', 'errors')}">
                                    <g:textField name="baseComplete" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'baseComplete')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="angleOpening"><g:message code="potteryDiagnostic.angleOpening.label" default="Angle Opening" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'angleOpening', 'errors')}">
                                    <g:textField name="angleOpening" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'angleOpening')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lidDiameter"><g:message code="potteryDiagnostic.lidDiameter.label" default="Lid Diameter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'lidDiameter', 'errors')}">
                                    <g:textField name="lidDiameter" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'lidDiameter')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lidThickness"><g:message code="potteryDiagnostic.lidThickness.label" default="Lid Thickness" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'lidThickness', 'errors')}">
                                    <g:textField name="lidThickness" value="${fieldValue(bean: potteryDiagnosticInstance, field: 'lidThickness')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPainted"><g:message code="potteryDiagnostic.isPainted.label" default="Is Painted" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isPainted', 'errors')}">
                                    <g:checkBox name="isPainted" value="${potteryDiagnosticInstance?.isPainted}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPaintedInside"><g:message code="potteryDiagnostic.isPaintedInside.label" default="Is Painted Inside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isPaintedInside', 'errors')}">
                                    <g:checkBox name="isPaintedInside" value="${potteryDiagnosticInstance?.isPaintedInside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPaintedOutside"><g:message code="potteryDiagnostic.isPaintedOutside.label" default="Is Painted Outside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isPaintedOutside', 'errors')}">
                                    <g:checkBox name="isPaintedOutside" value="${potteryDiagnosticInstance?.isPaintedOutside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isSlipped"><g:message code="potteryDiagnostic.isSlipped.label" default="Is Slipped" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isSlipped', 'errors')}">
                                    <g:checkBox name="isSlipped" value="${potteryDiagnosticInstance?.isSlipped}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isSlippedInside"><g:message code="potteryDiagnostic.isSlippedInside.label" default="Is Slipped Inside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isSlippedInside', 'errors')}">
                                    <g:checkBox name="isSlippedInside" value="${potteryDiagnosticInstance?.isSlippedInside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isSlippedOutside"><g:message code="potteryDiagnostic.isSlippedOutside.label" default="Is Slipped Outside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isSlippedOutside', 'errors')}">
                                    <g:checkBox name="isSlippedOutside" value="${potteryDiagnosticInstance?.isSlippedOutside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isBurnished"><g:message code="potteryDiagnostic.isBurnished.label" default="Is Burnished" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isBurnished', 'errors')}">
                                    <g:checkBox name="isBurnished" value="${potteryDiagnosticInstance?.isBurnished}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isBurnishedInside"><g:message code="potteryDiagnostic.isBurnishedInside.label" default="Is Burnished Inside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isBurnishedInside', 'errors')}">
                                    <g:checkBox name="isBurnishedInside" value="${potteryDiagnosticInstance?.isBurnishedInside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isBurnishedOutside"><g:message code="potteryDiagnostic.isBurnishedOutside.label" default="Is Burnished Outside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isBurnishedOutside', 'errors')}">
                                    <g:checkBox name="isBurnishedOutside" value="${potteryDiagnosticInstance?.isBurnishedOutside}" />
                                </td>
                            </tr>

                            <tr class="decor">
                                <td valign="top" class="name">
                                    <label for="isGlazed"><g:message code="potteryDiagnostic.isGlazed.label" default="Is Glazed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isGlazed', 'errors')}">
                                    <g:checkBox name="isGlazed" value="${potteryDiagnosticInstance?.isGlazed}" />
                                </td>
                            </tr>

                            <tr class="decor">
                                <td valign="top" class="name">
                                    <label for="isGlazedInside"><g:message code="potteryDiagnostic.isGlazedInside.label" default="Is Glazed Inside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isGlazedInside', 'errors')}">
                                    <g:checkBox name="isGlazedInside" value="${potteryDiagnosticInstance?.isGlazedInside}" />
                                </td>
                            </tr>

                            <tr class="decor">
                                <td valign="top" class="name">
                                    <label for="isGlazedOutside"><g:message code="potteryDiagnostic.isGlazedOutside.label" default="Is Glazed Outside" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isGlazedOutside', 'errors')}">
                                    <g:checkBox name="isGlazedOutside" value="${potteryDiagnosticInstance?.isGlazedOutside}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="insideColor"><g:message code="potteryDiagnostic.insideColor.label" default="Inside Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'insideColor', 'errors')}">
                                    <g:textField name="insideColor" value="${potteryDiagnosticInstance?.insideColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="outsideColor"><g:message code="potteryDiagnostic.outsideColor.label" default="Outside Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'outsideColor', 'errors')}">
                                    <g:textField name="outsideColor" value="${potteryDiagnosticInstance?.outsideColor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="designDescription"><g:message code="potteryDiagnostic.designDescription.label" default="Design Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'designDescription', 'errors')}">
                                    <g:textField name="designDescription" value="${potteryDiagnosticInstance?.designDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isPlasticApplication"><g:message code="potteryDiagnostic.isPlasticApplication.label" default="Is Plastic Application" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isPlasticApplication', 'errors')}">
                                    <g:checkBox name="isPlasticApplication" value="${potteryDiagnosticInstance?.isPlasticApplication}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plasticDescription"><g:message code="potteryDiagnostic.plasticDescription.label" default="Plastic Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'plasticDescription', 'errors')}">
                                    <g:textField name="plasticDescription" value="${potteryDiagnosticInstance?.plasticDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="isIncised"><g:message code="potteryDiagnostic.isIncised.label" default="Is Incised" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'isIncised', 'errors')}">
                                    <g:checkBox name="isIncised" value="${potteryDiagnosticInstance?.isIncised}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="incisedDescription"><g:message code="potteryDiagnostic.incisedDescription.label" default="Incised Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'incisedDescription', 'errors')}">
                                    <g:textField name="incisedDescription" value="${potteryDiagnosticInstance?.incisedDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ftirRaws"><g:message code="potteryDiagnostic.ftirRaws.label" default="Ftir Raws" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'ftirRaws', 'errors')}">
                                    
<ul>
<g:each in="${potteryDiagnosticInstance?.ftirRaws?}" var="f">
    <li><g:link controller="ftirRaw" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="ftirRaw" action="create" params="['potteryDiagnostic.id': potteryDiagnosticInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ftirRaw.label', default: 'FtirRaw')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="search" action="query" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
