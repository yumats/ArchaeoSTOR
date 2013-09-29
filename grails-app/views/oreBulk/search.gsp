

<%@ page import="net.calit2.archaeology.database.OreBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oreBulk.label', default: 'OreBulk')}" />
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
                                  <label for="year"><g:message code="oreBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${oreBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="oreBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${oreBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="oreBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${oreBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="oreBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${oreBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="oreBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${oreBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="oreBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${oreBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="oreBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${oreBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="oreBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${oreBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="oreBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${oreBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="oreBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${oreBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="oreBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${oreBulkInstance.constraints.period.inList}" value="${oreBulkInstance?.period}" valueMessagePrefix="oreBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="oreBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${oreBulkInstance.constraints.storageField.inList}" value="${oreBulkInstance?.storageField}" valueMessagePrefix="oreBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="oreBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${oreBulkInstance.constraints.storageSanDiego.inList}" value="${oreBulkInstance?.storageSanDiego}" valueMessagePrefix="oreBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="oreBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: oreBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="oreBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: oreBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countSmall"><g:message code="oreBulk.countSmall.label" default="Count Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'countSmall', 'errors')}">
                                    <g:textField name="countSmall" value="${fieldValue(bean: oreBulkInstance, field: 'countSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightSmall"><g:message code="oreBulk.weightSmall.label" default="Weight Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'weightSmall', 'errors')}">
                                    <g:textField name="weightSmall" value="${fieldValue(bean: oreBulkInstance, field: 'weightSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countMedium"><g:message code="oreBulk.countMedium.label" default="Count Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'countMedium', 'errors')}">
                                    <g:textField name="countMedium" value="${fieldValue(bean: oreBulkInstance, field: 'countMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightMedium"><g:message code="oreBulk.weightMedium.label" default="Weight Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'weightMedium', 'errors')}">
                                    <g:textField name="weightMedium" value="${fieldValue(bean: oreBulkInstance, field: 'weightMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countLarge"><g:message code="oreBulk.countLarge.label" default="Count Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'countLarge', 'errors')}">
                                    <g:textField name="countLarge" value="${fieldValue(bean: oreBulkInstance, field: 'countLarge')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightLarge"><g:message code="oreBulk.weightLarge.label" default="Weight Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oreBulkInstance, field: 'weightLarge', 'errors')}">
                                    <g:textField name="weightLarge" value="${fieldValue(bean: oreBulkInstance, field: 'weightLarge')}" />
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
