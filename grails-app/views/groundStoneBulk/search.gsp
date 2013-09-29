

<%@ page import="net.calit2.archaeology.database.GroundStoneBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groundStoneBulk.label', default: 'GroundStoneBulk')}" />
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
                                  <label for="year"><g:message code="groundStoneBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${groundStoneBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="groundStoneBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${groundStoneBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="groundStoneBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${groundStoneBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="groundStoneBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${groundStoneBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="groundStoneBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${groundStoneBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="groundStoneBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${groundStoneBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="groundStoneBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${groundStoneBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="groundStoneBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${groundStoneBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="groundStoneBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${groundStoneBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="groundStoneBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${groundStoneBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="groundStoneBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${groundStoneBulkInstance.constraints.period.inList}" value="${groundStoneBulkInstance?.period}" valueMessagePrefix="groundStoneBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="groundStoneBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${groundStoneBulkInstance.constraints.storageField.inList}" value="${groundStoneBulkInstance?.storageField}" valueMessagePrefix="groundStoneBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="groundStoneBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${groundStoneBulkInstance.constraints.storageSanDiego.inList}" value="${groundStoneBulkInstance?.storageSanDiego}" valueMessagePrefix="groundStoneBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="groundStoneBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: groundStoneBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="groundStoneBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countVessels"><g:message code="groundStoneBulk.countVessels.label" default="Count Vessels" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'countVessels', 'errors')}">
                                    <g:textField name="countVessels" value="${fieldValue(bean: groundStoneBulkInstance, field: 'countVessels')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightVessels"><g:message code="groundStoneBulk.weightVessels.label" default="Weight Vessels" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weightVessels', 'errors')}">
                                    <g:textField name="weightVessels" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weightVessels')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countHammerStones"><g:message code="groundStoneBulk.countHammerStones.label" default="Count Hammer Stones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'countHammerStones', 'errors')}">
                                    <g:textField name="countHammerStones" value="${fieldValue(bean: groundStoneBulkInstance, field: 'countHammerStones')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightHammerStones"><g:message code="groundStoneBulk.weightHammerStones.label" default="Weight Hammer Stones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weightHammerStones', 'errors')}">
                                    <g:textField name="weightHammerStones" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weightHammerStones')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countGrindingTools"><g:message code="groundStoneBulk.countGrindingTools.label" default="Count Grinding Tools" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'countGrindingTools', 'errors')}">
                                    <g:textField name="countGrindingTools" value="${fieldValue(bean: groundStoneBulkInstance, field: 'countGrindingTools')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightGrindingTools"><g:message code="groundStoneBulk.weightGrindingTools.label" default="Weight Grinding Tools" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weightGrindingTools', 'errors')}">
                                    <g:textField name="weightGrindingTools" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weightGrindingTools')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countPerforated"><g:message code="groundStoneBulk.countPerforated.label" default="Count Perforated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'countPerforated', 'errors')}">
                                    <g:textField name="countPerforated" value="${fieldValue(bean: groundStoneBulkInstance, field: 'countPerforated')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightPerforated"><g:message code="groundStoneBulk.weightPerforated.label" default="Weight Perforated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weightPerforated', 'errors')}">
                                    <g:textField name="weightPerforated" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weightPerforated')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countOther"><g:message code="groundStoneBulk.countOther.label" default="Count Other" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'countOther', 'errors')}">
                                    <g:textField name="countOther" value="${fieldValue(bean: groundStoneBulkInstance, field: 'countOther')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightOther"><g:message code="groundStoneBulk.weightOther.label" default="Weight Other" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groundStoneBulkInstance, field: 'weightOther', 'errors')}">
                                    <g:textField name="weightOther" value="${fieldValue(bean: groundStoneBulkInstance, field: 'weightOther')}" />
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
