

<%@ page import="net.calit2.archaeology.database.Site" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${siteInstance}">
            <div class="errors">
                <g:renderErrors bean="${siteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="northing"><g:message code="site.northing.label" default="Northing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'northing', 'errors')}">
                                    <g:textField name="northing" value="${fieldValue(bean: siteInstance, field: 'northing')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="easting"><g:message code="site.easting.label" default="Easting" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'easting', 'errors')}">
                                    <g:textField name="easting" value="${fieldValue(bean: siteInstance, field: 'easting')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="site.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${fieldValue(bean: siteInstance, field: 'latitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="site.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: siteInstance, field: 'longitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="elevation"><g:message code="site.elevation.label" default="Elevation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'elevation', 'errors')}">
                                    <g:textField name="elevation" value="${fieldValue(bean: siteInstance, field: 'elevation')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="srid"><g:message code="site.srid.label" default="SRID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'srid', 'errors')}">
                                    <g:select name="srid" from="${Site.SRIDS.values()}" keys="${Site.SRIDS.keySet() as List}" value="${siteInstance?.srid}" valueMessagePrefix="site.srid"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="site.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${siteInstance?.name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="linkName"><g:message code="site.linkName.label" default="Link Name (abbrev.)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'linkName', 'errors')}">
                                    <g:textField name="linkName" value="${siteInstance?.linkName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="otherNames"><g:message code="site.otherNames.label" default="Other Names" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'otherNames', 'errors')}">
                                    <g:textField name="otherNames" value="${siteInstance?.otherNames}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number"><g:message code="site.number.label" default="Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'number', 'errors')}">
                                    <g:textField name="number" value="${siteInstance?.number}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="majorPeriods"><g:message code="site.majorPeriods.label" default="Major Periods" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'majorPeriods', 'errors')}">
                                    <g:select name="majorPeriods" from="${net.calit2.archaeology.database.Constants.PERIODS}" value="${siteInstance?.majorPeriods?.tokenize(',')}" valueMessagePrefix="site.majorPeriods" multiple="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="otherPeriods"><g:message code="site.otherPeriods.label" default="Other Periods" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'otherPeriods', 'errors')}">
                                    <g:select name="otherPeriods" from="${net.calit2.archaeology.database.Constants.PERIODS}" value="${siteInstance?.otherPeriods?.tokenize(',')}" valueMessagePrefix="site.otherPeriods" multiple="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="site.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${fieldValue(bean: siteInstance, field: 'type')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type2"><g:message code="site.type2.label" default="Type2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'type2', 'errors')}">
                                    <g:textField name="type2" value="${fieldValue(bean: siteInstance, field: 'type2')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type3"><g:message code="site.type3.label" default="Type3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'type3', 'errors')}">
                                    <g:textField name="type3" value="${fieldValue(bean: siteInstance, field: 'type3')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="site.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${siteInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyors"><g:message code="site.surveyors.label" default="Surveyors" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'surveyors', 'errors')}">
                                    <g:textField name="surveyors" value="${siteInstance?.surveyors}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="excavationInstitution"><g:message code="site.excavationInstitution.label" default="Excavation Institution" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'excavationInstitution', 'errors')}">
                                    <g:textField name="excavationInstitution" value="${siteInstance?.excavationInstitution}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permitNumber"><g:message code="site.permitNumber.label" default="Permit Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'permitNumber', 'errors')}">
                                    <g:textField name="permitNumber" value="${siteInstance?.permitNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="publicationBibliography"><g:message code="site.publicationBibliography.label" default="Publication Bibliography" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'publicationBibliography', 'errors')}">
                                    <g:textField name="publicationBibliography" value="${siteInstance?.publicationBibliography}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="collectionStrategy"><g:message code="site.collectionStrategy.label" default="Collection Strategy" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'collectionStrategy', 'errors')}">
                                    <g:textField name="collectionStrategy" value="${siteInstance?.collectionStrategy}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paleolithic"><g:message code="site.paleolithic.label" default="Paleolithic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'paleolithic', 'errors')}">
                                    <g:select name="paleolithic" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'paleolithic')}" valueMessagePrefix="site.paleolithic"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="natufian"><g:message code="site.natufian.label" default="Natufian" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'natufian', 'errors')}">
                                    <g:select name="natufian" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'natufian')}" valueMessagePrefix="site.natufian"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="neo"><g:message code="site.neo.label" default="Neo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'neo', 'errors')}">
                                    <g:select name="neo" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'neo')}" valueMessagePrefix="site.neo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ppn"><g:message code="site.ppn.label" default="PPN" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ppn', 'errors')}">
                                    <g:select name="ppn" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ppn')}" valueMessagePrefix="site.ppn"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ppna"><g:message code="site.ppna.label" default="PPNa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ppna', 'errors')}">
                                    <g:select name="ppna" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ppna')}" valueMessagePrefix="site.ppna"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ppnbc"><g:message code="site.ppnbc.label" default="PPNb_c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ppnbc', 'errors')}">
                                    <g:select name="ppnbc" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ppnbc')}" valueMessagePrefix="site.ppnbc"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pn"><g:message code="site.pn.label" default="PN" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'pn', 'errors')}">
                                    <g:select name="pn" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'pn')}" valueMessagePrefix="site.pn"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prehistoric"><g:message code="site.prehistoric.label" default="Prehistoric" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'prehistoric', 'errors')}">
                                    <g:select name="prehistoric" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'prehistoric')}" valueMessagePrefix="site.prehistoric"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="chal"><g:message code="site.chal.label" default="Chal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'chal', 'errors')}">
                                    <g:select name="chal" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'chal')}" valueMessagePrefix="site.chal"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eb"><g:message code="site.eb.label" default="EB" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'eb', 'errors')}">
                                    <g:select name="eb" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'eb')}" valueMessagePrefix="site.eb"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eb1"><g:message code="site.eb1.label" default="EB1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'eb1', 'errors')}">
                                    <g:select name="eb1" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'eb1')}" valueMessagePrefix="site.eb1"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eb23"><g:message code="site.eb23.label" default="EB2_3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'eb23', 'errors')}">
                                    <g:select name="eb23" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'eb23')}" valueMessagePrefix="site.eb23"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ib"><g:message code="site.ib.label" default="IB" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ib', 'errors')}">
                                    <g:select name="ib" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ib')}" valueMessagePrefix="site.ib"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mb"><g:message code="site.mb.label" default="MB" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mb', 'errors')}">
                                    <g:select name="mb" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mb')}" valueMessagePrefix="site.mb"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mb2a"><g:message code="site.mb2a.label" default="MB2a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mb2a', 'errors')}">
                                    <g:select name="mb2a" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mb2a')}" valueMessagePrefix="site.mb2a"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mb2bc"><g:message code="site.mb2bc.label" default="MB2b_c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mb2bc', 'errors')}">
                                    <g:select name="mb2bc" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mb2bc')}" valueMessagePrefix="site.mb2bc"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lb"><g:message code="site.lb.label" default="LB" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'lb', 'errors')}">
                                    <g:select name="lb" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'lb')}" valueMessagePrefix="site.lb"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ia"><g:message code="site.ia.label" default="IA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ia', 'errors')}">
                                    <g:select name="ia" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ia')}" valueMessagePrefix="site.ia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ia1"><g:message code="site.ia1.label" default="IA1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ia1', 'errors')}">
                                    <g:select name="ia1" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ia1')}" valueMessagePrefix="site.ia1"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ia2"><g:message code="site.ia2.label" default="IA2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ia2', 'errors')}">
                                    <g:select name="ia2" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ia2')}" valueMessagePrefix="site.ia2"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ia3"><g:message code="site.ia3.label" default="IA3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ia3', 'errors')}">
                                    <g:select name="ia3" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ia3')}" valueMessagePrefix="site.ia3"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classical"><g:message code="site.classical.label" default="Classical" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'classical', 'errors')}">
                                    <g:select name="classical" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'classical')}" valueMessagePrefix="site.classical"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hel"><g:message code="site.hel.label" default="Hel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'hel', 'errors')}">
                                    <g:select name="hel" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'hel')}" valueMessagePrefix="site.hel"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rom"><g:message code="site.rom.label" default="Rom" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'rom', 'errors')}">
                                    <g:select name="rom" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'rom')}" valueMessagePrefix="site.rom"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="erom"><g:message code="site.erom.label" default="ERom" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'erom', 'errors')}">
                                    <g:select name="erom" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'erom')}" valueMessagePrefix="site.erom"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lrom"><g:message code="site.lrom.label" default="LRom" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'lrom', 'errors')}">
                                    <g:select name="lrom" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'lrom')}" valueMessagePrefix="site.lrom"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="byz"><g:message code="site.byz.label" default="Byz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'byz', 'errors')}">
                                    <g:select name="byz" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'byz')}" valueMessagePrefix="site.byz"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ebyz"><g:message code="site.ebyz.label" default="EByz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ebyz', 'errors')}">
                                    <g:select name="ebyz" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ebyz')}" valueMessagePrefix="site.ebyz"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lbyz"><g:message code="site.lbyz.label" default="LByz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'lbyz', 'errors')}">
                                    <g:select name="lbyz" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'lbyz')}" valueMessagePrefix="site.lbyz"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="islamic"><g:message code="site.islamic.label" default="Islamic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'islamic', 'errors')}">
                                    <g:select name="islamic" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'islamic')}" valueMessagePrefix="site.islamic"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ei"><g:message code="site.ei.label" default="EI" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'ei', 'errors')}">
                                    <g:select name="ei" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'ei')}" valueMessagePrefix="site.ei"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mi1"><g:message code="site.mi1.label" default="MI1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mi1', 'errors')}">
                                    <g:select name="mi1" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mi1')}" valueMessagePrefix="site.mi1"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mi23"><g:message code="site.mi23.label" default="MI2_3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mi23', 'errors')}">
                                    <g:select name="mi23" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mi23')}" valueMessagePrefix="site.mi23"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="li"><g:message code="site.li.label" default="LI" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'li', 'errors')}">
                                    <g:select name="li" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'li')}" valueMessagePrefix="site.li"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mandateModern"><g:message code="site.mandateModern.label" default="Mandate/Modern" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'mandateModern', 'errors')}">
                                    <g:select name="mandateModern" from="${Site.VERIFICATION_KNOWLEDGE}" keys="${Site.VERIFICATION_NUMBERS}" value="${fieldValue(bean: siteInstance, field: 'mandateModern')}" valueMessagePrefix="site.mandateModern"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="site.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'comments', 'errors')}">
                                    <g:textField name="comments" value="${siteInstance?.comments}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
