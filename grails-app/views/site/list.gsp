
<%@ page import="net.calit2.archaeology.database.Site" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'site.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="northing" title="${message(code: 'site.northing.label', default: 'Northing')}" />
                        
                            <g:sortableColumn property="easting" title="${message(code: 'site.easting.label', default: 'Easting')}" />
                        
                            <g:sortableColumn property="latitude" title="${message(code: 'site.latitude.label', default: 'Latitude')}" />
                        
                            <g:sortableColumn property="longitude" title="${message(code: 'site.longitude.label', default: 'Longitude')}" />
                        
                            <g:sortableColumn property="elevation" title="${message(code: 'site.elevation.label', default: 'Elevation')}" />
                        
                            <g:sortableColumn property="srid" title="${message(code: 'site.srid.label', default: 'SRID')}" />

                            <g:sortableColumn property="name" title="${message(code: 'site.name.label', default: 'Name')}" />

                            <g:sortableColumn property="linkName" title="${message(code: 'site.linkName.label', default: 'Link Name')}" />

                            <g:sortableColumn property="otherNames" title="${message(code: 'site.otherNames.label', default: 'Other Names')}" />

                            <g:sortableColumn property="number" title="${message(code: 'site.number.label', default: 'Number')}" />

                            <g:sortableColumn property="majorPeriods" title="${message(code: 'site.majorPeriods.label', default: 'Major Periods')}" />

                            <g:sortableColumn property="otherPeriods" title="${message(code: 'site.otherPeriods.label', default: 'Other Periods')}" />

                            <g:sortableColumn property="type" title="${message(code: 'site.type.label', default: 'Type')}" />

                            <g:sortableColumn property="type2" title="${message(code: 'site.type2.label', default: 'Type2')}" />

                            <g:sortableColumn property="type3" title="${message(code: 'site.type3.label', default: 'Type3')}" />

                            <g:sortableColumn property="description" title="${message(code: 'site.description.label', default: 'Description')}" />

                            <g:sortableColumn property="surveyors" title="${message(code: 'site.surveyors.label', default: 'Surveyors')}" />

                            <g:sortableColumn property="excavationInstitution" title="${message(code: 'site.excavationInstitution.label', default: 'Excavation Institution')}" />

                            <g:sortableColumn property="permitNumber" title="${message(code: 'site.permitNumber.label', default: 'Permit Number')}" />

                            <g:sortableColumn property="publicationBibliography" title="${message(code: 'site.publicationBibliography.label', default: 'Publication Bibliography')}" />

                            <g:sortableColumn property="collectionStrategy" title="${message(code: 'site.collectionStrategy.label', default: 'Collection Strategy')}" />

                            <g:sortableColumn property="paleolithic" title="${message(code: 'site.paleolithic.label', default: 'Paleolithic')}" />

                            <g:sortableColumn property="natufian" title="${message(code: 'site.natufian.label', default: 'Natufian')}" />

                            <g:sortableColumn property="neo" title="${message(code: 'site.neo.label', default: 'Neo')}" />

                            <g:sortableColumn property="ppn" title="${message(code: 'site.ppn.label', default: 'PPN')}" />

                            <g:sortableColumn property="ppna" title="${message(code: 'site.ppna.label', default: 'PPNa')}" />

                            <g:sortableColumn property="ppnbc" title="${message(code: 'site.ppnbc.label', default: 'PPNb_c')}" />

                            <g:sortableColumn property="pn" title="${message(code: 'site.pn.label', default: 'PN')}" />

                            <g:sortableColumn property="prehistoric" title="${message(code: 'site.prehistoric.label', default: 'Prehistoric')}" />

                            <g:sortableColumn property="chal" title="${message(code: 'site.chal.label', default: 'Chal')}" />

                            <g:sortableColumn property="eb" title="${message(code: 'site.eb.label', default: 'EB')}" />

                            <g:sortableColumn property="eb1" title="${message(code: 'site.eb1.label', default: 'EB1')}" />

                            <g:sortableColumn property="eb23" title="${message(code: 'site.eb23.label', default: 'EB2_3')}" />

                            <g:sortableColumn property="ib" title="${message(code: 'site.ib.label', default: 'IB')}" />

                            <g:sortableColumn property="mb" title="${message(code: 'site.mb.label', default: 'MB')}" />

                            <g:sortableColumn property="mb2a" title="${message(code: 'site.mb2a.label', default: 'MB2a')}" />

                            <g:sortableColumn property="mb2bc" title="${message(code: 'site.mb2bc.label', default: 'MB2b_c')}" />

                            <g:sortableColumn property="lb" title="${message(code: 'site.lb.label', default: 'LB')}" />

                            <g:sortableColumn property="ia" title="${message(code: 'site.ia.label', default: 'IA')}" />

                            <g:sortableColumn property="ia1" title="${message(code: 'site.ia1.label', default: 'IA1')}" />
                        
                            <g:sortableColumn property="ia2" title="${message(code: 'site.ia2.label', default: 'IA2')}" />
                        
                            <g:sortableColumn property="ia3" title="${message(code: 'site.ia3.label', default: 'IA3')}" />
                        
                            <g:sortableColumn property="classical" title="${message(code: 'site.classical.label', default: 'Classical')}" />
                        
                            <g:sortableColumn property="hel" title="${message(code: 'site.hel.label', default: 'Hel')}" />
                        
                            <g:sortableColumn property="rom" title="${message(code: 'site.rom.label', default: 'Rom')}" />
                        
                            <g:sortableColumn property="erom" title="${message(code: 'site.erom.label', default: 'ERom')}" />
                        
                            <g:sortableColumn property="lrom" title="${message(code: 'site.lrom.label', default: 'LRom')}" />
                        
                            <g:sortableColumn property="byz" title="${message(code: 'site.byz.label', default: 'Byz')}" />
                        
                            <g:sortableColumn property="ebyz" title="${message(code: 'site.ebyz.label', default: 'EByz')}" />
                        
                            <g:sortableColumn property="lbyz" title="${message(code: 'site.lbyz.label', default: 'LByz')}" />
                        
                            <g:sortableColumn property="islamic" title="${message(code: 'site.islamic.label', default: 'Islamic')}" />
                        
                            <g:sortableColumn property="ei" title="${message(code: 'site.ei.label', default: 'EI')}" />
                        
                            <g:sortableColumn property="mi1" title="${message(code: 'site.mi1.label', default: 'MI1')}" />
                        
                            <g:sortableColumn property="mi23" title="${message(code: 'site.mi23.label', default: 'MI2_3')}" />
                        
                            <g:sortableColumn property="li" title="${message(code: 'site.li.label', default: 'LI')}" />
                        
                            <g:sortableColumn property="mandateModern" title="${message(code: 'site.mandateModern.label', default: 'Mandate/Modern')}" />
                        
                            <g:sortableColumn property="comments" title="${message(code: 'site.comments.label', default: 'Comments')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${siteInstanceList}" status="i" var="siteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${siteInstance.id}">${fieldValue(bean: siteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "northing")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "easting")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "latitude")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "longitude")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "elevation")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "srid")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "name")}</td>

                            <td>${fieldValue(bean: siteInstance, field: "linkName")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "otherNames")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "number")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "majorPeriods")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "otherPeriods")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "type2")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "type3")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "surveyors")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "excavationInstitution")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "permitNumber")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "publicationBibliography")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "collectionStrategy")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "paleolithic")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "natufian")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "neo")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ppn")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ppna")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ppnbc")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "pn")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "prehistoric")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "chal")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "eb")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "eb1")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "eb23")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ib")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mb")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mb2a")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mb2bc")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "lb")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ia")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ia1")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ia2")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ia3")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "classical")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "hel")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "rom")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "erom")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "lrom")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "byz")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ebyz")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "lbyz")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "islamic")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "ei")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mi1")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mi23")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "li")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "mandateModern")}</td>
                        
                            <td>${fieldValue(bean: siteInstance, field: "comments")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${siteInstanceTotal}" />
                </div>
            </g:if>
        </div>
    </body>
</html>
