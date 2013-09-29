

<%@ page import="net.calit2.archaeology.database.BoneBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'boneBulk.label', default: 'BoneBulk')}" />
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
                                  <label for="year"><g:message code="boneBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${boneBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="boneBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${boneBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="boneBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${boneBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="boneBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${boneBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="boneBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${boneBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="boneBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${boneBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="boneBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${boneBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="boneBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${boneBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="boneBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${boneBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="boneBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${boneBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="boneBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${boneBulkInstance.constraints.period.inList}" value="${boneBulkInstance?.period}" valueMessagePrefix="boneBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="boneBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${boneBulkInstance.constraints.storageField.inList}" value="${boneBulkInstance?.storageField}" valueMessagePrefix="boneBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="boneBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${boneBulkInstance.constraints.storageSanDiego.inList}" value="${boneBulkInstance?.storageSanDiego}" valueMessagePrefix="boneBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="boneBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: boneBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="boneBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: boneBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: boneBulkInstance, field: 'weight')}" />
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