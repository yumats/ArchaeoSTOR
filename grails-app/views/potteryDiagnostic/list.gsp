
<%@ page import="net.calit2.archaeology.database.PotteryDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryDiagnostic.label', default: 'PotteryDiagnostic')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'potteryDiagnostic.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="registration" title="${message(code: 'potteryDiagnostic.registration.label', default: 'Registration')}" />

                            <th>Year</th>
                            <th>Site</th>
                            <th>Feature</th>
                            <th>EDM</th>
                            <th>Basket</th>
                            <th>Locus</th>
                        
                            <g:sortableColumn property="generalType" title="${message(code: 'potteryDiagnostic.generalType.label', default: 'General Type')}" />

                            <g:sortableColumn property="type" title="${message(code: 'potteryDiagnostic.type.label', default: 'Type')}" />

                            <g:sortableColumn property="period" title="${message(code: 'potteryDiagnostic.period.label', default: 'Period')}" />
                        
                            <g:sortableColumn property="illustration" title="${message(code: 'potteryDiagnostic.illustration.label', default: 'Illustration')}" />
                        
                            <g:sortableColumn property="fabric" title="${message(code: 'potteryDiagnostic.fabric.label', default: 'Fabric')}" />
                        
                            <g:sortableColumn property="ware" title="${message(code: 'potteryDiagnostic.ware.label', default: 'Ware')}" />
                        
                            <g:sortableColumn property="exterior" title="${message(code: 'potteryDiagnostic.exterior.label', default: 'Exterior')}" />
                        
                            <g:sortableColumn property="interior" title="${message(code: 'potteryDiagnostic.interior.label', default: 'Interior')}" />
                        
                            <g:sortableColumn property="core" title="${message(code: 'potteryDiagnostic.core.label', default: 'Core')}" />
                        
                            <g:sortableColumn property="rimDiameter" title="${message(code: 'potteryDiagnostic.rimDiameter.label', default: 'Rim Diameter')}" />
                        
                            <g:sortableColumn property="rimThickness" title="${message(code: 'potteryDiagnostic.rimThickness.label', default: 'Rim Thickness')}" />
                        
                            <g:sortableColumn property="rimComplete" title="${message(code: 'potteryDiagnostic.rimComplete.label', default: 'Rim Complete')}" />
                        
                            <g:sortableColumn property="rimAngle" title="${message(code: 'potteryDiagnostic.rimAngle.label', default: 'Rim Angle')}" />
                        
                            <g:sortableColumn property="rimTreatment" title="${message(code: 'potteryDiagnostic.rimTreatment.label', default: 'Rim Treatment')}" />
                        
                            <g:sortableColumn property="attachmentPoint" title="${message(code: 'potteryDiagnostic.attachmentPoint.label', default: 'Attachment Point')}" />
                        
                            <g:sortableColumn property="handleType" title="${message(code: 'potteryDiagnostic.handleType.label', default: 'Handle Type')}" />
                        
                            <g:sortableColumn property="handleThickness" title="${message(code: 'potteryDiagnostic.handleThickness.label', default: 'Handle Thickness')}" />
                        
                            <g:sortableColumn property="isLedgeCut" title="${message(code: 'potteryDiagnostic.isLedgeCut.label', default: 'Ledge Cut')}" />
                        
                            <g:sortableColumn property="rippleCount" title="${message(code: 'potteryDiagnostic.rippleCount.label', default: 'Ripple Count')}" />
                        
                            <g:sortableColumn property="basalDiameter" title="${message(code: 'potteryDiagnostic.basalDiameter.label', default: 'Basal Diameter')}" />
                        
                            <g:sortableColumn property="baseComplete" title="${message(code: 'potteryDiagnostic.baseComplete.label', default: 'Base Complete')}" />
                        
                            <g:sortableColumn property="angleOpening" title="${message(code: 'potteryDiagnostic.angleOpening.label', default: 'Angle Opening')}" />
                        
                            <g:sortableColumn property="lidDiameter" title="${message(code: 'potteryDiagnostic.lidDiameter.label', default: 'Lid Diameter')}" />
                        
                            <g:sortableColumn property="lidThickness" title="${message(code: 'potteryDiagnostic.lidThickness.label', default: 'Lid Thickness')}" />
                        
                            <g:sortableColumn property="isPainted" title="${message(code: 'potteryDiagnostic.isPainted.label', default: 'Painted')}" />
                        
                            <g:sortableColumn property="isPaintedInside" title="${message(code: 'potteryDiagnostic.isPaintedInside.label', default: 'Painted Inside')}" />
                        
                            <g:sortableColumn property="isPaintedOutside" title="${message(code: 'potteryDiagnostic.isPaintedOutside.label', default: 'Painted Outside')}" />
                        
                            <g:sortableColumn property="isSlipped" title="${message(code: 'potteryDiagnostic.isSlipped.label', default: 'Slipped')}" />
                        
                            <g:sortableColumn property="isSlippedInside" title="${message(code: 'potteryDiagnostic.isSlippedInside.label', default: 'Slipped Inside')}" />
                        
                            <g:sortableColumn property="isSlippedOutside" title="${message(code: 'potteryDiagnostic.isSlippedOutside.label', default: 'Slipped Outside')}" />
                        
                            <g:sortableColumn property="isBurnished" title="${message(code: 'potteryDiagnostic.isBurnished.label', default: 'Burnished')}" />
                        
                            <g:sortableColumn property="isBurnishedInside" title="${message(code: 'potteryDiagnostic.isBurnishedInside.label', default: 'Burnished Inside')}" />
                        
                            <g:sortableColumn property="isBurnishedOutside" title="${message(code: 'potteryDiagnostic.isBurnishedOutside.label', default: 'Burnished Outside')}" />

                            <g:sortableColumn property="isGlazed" title="${message(code: 'potteryDiagnostic.isGlazed.label', default: 'Glazed')}" />

                            <g:sortableColumn property="isGlazedInside" title="${message(code: 'potteryDiagnostic.isGlazedInside.label', default: 'Glazed Inside')}" />

                            <g:sortableColumn property="isGlazedOutside" title="${message(code: 'potteryDiagnostic.isGlazedOutside.label', default: 'Glazed Outside')}" />
                        
                            <g:sortableColumn property="insideColor" title="${message(code: 'potteryDiagnostic.insideColor.label', default: 'Inside Color')}" />
                        
                            <g:sortableColumn property="outsideColor" title="${message(code: 'potteryDiagnostic.outsideColor.label', default: 'Outside Color')}" />
                        
                            <g:sortableColumn property="designDescription" title="${message(code: 'potteryDiagnostic.designDescription.label', default: 'Design Description')}" />
                        
                            <g:sortableColumn property="isPlasticApplication" title="${message(code: 'potteryDiagnostic.isPlasticApplication.label', default: 'Plastic Application')}" />
                        
                            <g:sortableColumn property="plasticDescription" title="${message(code: 'potteryDiagnostic.plasticDescription.label', default: 'Plastic Description')}" />
                        
                            <g:sortableColumn property="isIncised" title="${message(code: 'potteryDiagnostic.isIncised.label', default: 'Incised')}" />
                        
                            <g:sortableColumn property="incisedDescription" title="${message(code: 'potteryDiagnostic.incisedDescription.label', default: 'Incised Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${potteryDiagnosticInstanceList}" status="i" var="potteryDiagnosticInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${potteryDiagnosticInstance.id}">${fieldValue(bean: potteryDiagnosticInstance, field: "id")}</g:link></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="registration">${fieldValue(bean: potteryDiagnosticInstance, field: "registration")}</td>

                            <td>${potteryDiagnosticInstance.artifact?.year}</td>
                            <td>${potteryDiagnosticInstance.artifact?.site}</td>
                            <td>${potteryDiagnosticInstance.artifact?.surveyFeature}</td>
                            <td>${potteryDiagnosticInstance.artifact?.edm}</td>
                            <td>${potteryDiagnosticInstance.artifact?.basket}</td>
                            <td>${potteryDiagnosticInstance.artifact?.locus}</td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="generalType">${fieldValue(bean: potteryDiagnosticInstance, field: "generalType")}</td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="type">${fieldValue(bean: potteryDiagnosticInstance, field: "type")}</td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="period">${fieldValue(bean: potteryDiagnosticInstance, field: "period")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="illustration">${fieldValue(bean: potteryDiagnosticInstance, field: "illustration")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="fabric">${fieldValue(bean: potteryDiagnosticInstance, field: "fabric")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="ware">${fieldValue(bean: potteryDiagnosticInstance, field: "ware")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="exterior">${fieldValue(bean: potteryDiagnosticInstance, field: "exterior")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="interior">${fieldValue(bean: potteryDiagnosticInstance, field: "interior")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="core">${fieldValue(bean: potteryDiagnosticInstance, field: "core")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rimDiameter">${fieldValue(bean: potteryDiagnosticInstance, field: "rimDiameter")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rimThickness">${fieldValue(bean: potteryDiagnosticInstance, field: "rimThickness")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rimComplete">${fieldValue(bean: potteryDiagnosticInstance, field: "rimComplete")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rimAngle">${fieldValue(bean: potteryDiagnosticInstance, field: "rimAngle")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rimTreatment">${fieldValue(bean: potteryDiagnosticInstance, field: "rimTreatment")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="attachmentPoint">${fieldValue(bean: potteryDiagnosticInstance, field: "attachmentPoint")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="handleType">${fieldValue(bean: potteryDiagnosticInstance, field: "handleType")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="handleThickness">${fieldValue(bean: potteryDiagnosticInstance, field: "handleThickness")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isLedgeCut"><g:formatBoolean boolean="${potteryDiagnosticInstance.isLedgeCut}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="rippleCount">${fieldValue(bean: potteryDiagnosticInstance, field: "rippleCount")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="basalDiameter">${fieldValue(bean: potteryDiagnosticInstance, field: "basalDiameter")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="baseComplete">${fieldValue(bean: potteryDiagnosticInstance, field: "baseComplete")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="angleOpening">${fieldValue(bean: potteryDiagnosticInstance, field: "angleOpening")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="lidDiameter">${fieldValue(bean: potteryDiagnosticInstance, field: "lidDiameter")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="lidThickness">${fieldValue(bean: potteryDiagnosticInstance, field: "lidThickness")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isPainted"><g:formatBoolean boolean="${potteryDiagnosticInstance.isPainted}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isPaintedInside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isPaintedInside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isPaintedOutside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isPaintedOutside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isSlipped"><g:formatBoolean boolean="${potteryDiagnosticInstance.isSlipped}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isSlippedInside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isSlippedInside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isSlippedOutside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isSlippedOutside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isBurnished"><g:formatBoolean boolean="${potteryDiagnosticInstance.isBurnished}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isBurnishedInside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isBurnishedInside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isBurnishedOutside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isBurnishedOutside}" /></td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isGlazed"><g:formatBoolean boolean="${potteryDiagnosticInstance.isGlazed}" /></td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isGlazedInside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isGlazedInside}" /></td>

                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isGlazedOutside"><g:formatBoolean boolean="${potteryDiagnosticInstance.isGlazedOutside}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="insideColor">${fieldValue(bean: potteryDiagnosticInstance, field: "insideColor")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="outsideColor">${fieldValue(bean: potteryDiagnosticInstance, field: "outsideColor")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="designDescription">${fieldValue(bean: potteryDiagnosticInstance, field: "designDescription")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isPlasticApplication"><g:formatBoolean boolean="${potteryDiagnosticInstance.isPlasticApplication}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="plasticDescription">${fieldValue(bean: potteryDiagnosticInstance, field: "plasticDescription")}</td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="isIncised"><g:formatBoolean boolean="${potteryDiagnosticInstance.isIncised}" /></td>
                        
                            <td class="editable" data-id="${potteryDiagnosticInstance.id}" data-field="incisedDescription">${fieldValue(bean: potteryDiagnosticInstance, field: "incisedDescription")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${potteryDiagnosticInstanceTotal}" />
                </div>
            </g:if>
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
