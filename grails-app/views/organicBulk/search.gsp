

<%@ page import="net.calit2.archaeology.database.OrganicBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'organicBulk.label', default: 'OrganicBulk')}" />
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
                                  <label for="year"><g:message code="organicBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${organicBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="organicBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${organicBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="organicBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${organicBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="organicBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${organicBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="organicBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${organicBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="organicBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${organicBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="organicBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${organicBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="organicBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${organicBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="organicBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${organicBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="organicBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${organicBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="organicBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${organicBulkInstance.constraints.period.inList}" value="${organicBulkInstance?.period}" valueMessagePrefix="organicBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="organicBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${organicBulkInstance.constraints.storageField.inList}" value="${organicBulkInstance?.storageField}" valueMessagePrefix="organicBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="organicBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${organicBulkInstance.constraints.storageSanDiego.inList}" value="${organicBulkInstance?.storageSanDiego}" valueMessagePrefix="organicBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="organicBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: organicBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="organicBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: organicBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countSmall"><g:message code="organicBulk.countSmall.label" default="Count Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'countSmall', 'errors')}">
                                    <g:textField name="countSmall" value="${fieldValue(bean: organicBulkInstance, field: 'countSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightSmall"><g:message code="organicBulk.weightSmall.label" default="Weight Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'weightSmall', 'errors')}">
                                    <g:textField name="weightSmall" value="${fieldValue(bean: organicBulkInstance, field: 'weightSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countMedium"><g:message code="organicBulk.countMedium.label" default="Count Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'countMedium', 'errors')}">
                                    <g:textField name="countMedium" value="${fieldValue(bean: organicBulkInstance, field: 'countMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightMedium"><g:message code="organicBulk.weightMedium.label" default="Weight Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'weightMedium', 'errors')}">
                                    <g:textField name="weightMedium" value="${fieldValue(bean: organicBulkInstance, field: 'weightMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countLarge"><g:message code="organicBulk.countLarge.label" default="Count Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'countLarge', 'errors')}">
                                    <g:textField name="countLarge" value="${fieldValue(bean: organicBulkInstance, field: 'countLarge')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightLarge"><g:message code="organicBulk.weightLarge.label" default="Weight Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: organicBulkInstance, field: 'weightLarge', 'errors')}">
                                    <g:textField name="weightLarge" value="${fieldValue(bean: organicBulkInstance, field: 'weightLarge')}" />
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
