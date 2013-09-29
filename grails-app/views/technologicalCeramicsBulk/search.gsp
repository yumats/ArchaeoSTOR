

<%@ page import="net.calit2.archaeology.database.TechnologicalCeramicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'technologicalCeramicsBulk.label', default: 'TechnologicalCeramicsBulk')}" />
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
                                  <label for="year"><g:message code="technologicalCeramicsBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${technologicalCeramicsBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="technologicalCeramicsBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${technologicalCeramicsBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="technologicalCeramicsBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${technologicalCeramicsBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="technologicalCeramicsBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${technologicalCeramicsBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="technologicalCeramicsBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${technologicalCeramicsBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="technologicalCeramicsBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${technologicalCeramicsBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="technologicalCeramicsBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${technologicalCeramicsBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="technologicalCeramicsBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${technologicalCeramicsBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="technologicalCeramicsBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${technologicalCeramicsBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="technologicalCeramicsBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${technologicalCeramicsBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="technologicalCeramicsBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${technologicalCeramicsBulkInstance.constraints.period.inList}" value="${technologicalCeramicsBulkInstance?.period}" valueMessagePrefix="technologicalCeramicsBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="technologicalCeramicsBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${technologicalCeramicsBulkInstance.constraints.storageField.inList}" value="${technologicalCeramicsBulkInstance?.storageField}" valueMessagePrefix="technologicalCeramicsBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="technologicalCeramicsBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${technologicalCeramicsBulkInstance.constraints.storageSanDiego.inList}" value="${technologicalCeramicsBulkInstance?.storageSanDiego}" valueMessagePrefix="technologicalCeramicsBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="technologicalCeramicsBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="technologicalCeramicsBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countSmall"><g:message code="technologicalCeramicsBulk.countSmall.label" default="Count Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'countSmall', 'errors')}">
                                    <g:textField name="countSmall" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'countSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightSmall"><g:message code="technologicalCeramicsBulk.weightSmall.label" default="Weight Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'weightSmall', 'errors')}">
                                    <g:textField name="weightSmall" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'weightSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countMedium"><g:message code="technologicalCeramicsBulk.countMedium.label" default="Count Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'countMedium', 'errors')}">
                                    <g:textField name="countMedium" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'countMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightMedium"><g:message code="technologicalCeramicsBulk.weightMedium.label" default="Weight Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'weightMedium', 'errors')}">
                                    <g:textField name="weightMedium" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'weightMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countLarge"><g:message code="technologicalCeramicsBulk.countLarge.label" default="Count Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'countLarge', 'errors')}">
                                    <g:textField name="countLarge" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'countLarge')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightLarge"><g:message code="technologicalCeramicsBulk.weightLarge.label" default="Weight Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: technologicalCeramicsBulkInstance, field: 'weightLarge', 'errors')}">
                                    <g:textField name="weightLarge" value="${fieldValue(bean: technologicalCeramicsBulkInstance, field: 'weightLarge')}" />
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
