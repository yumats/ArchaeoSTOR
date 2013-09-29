

<%@ page import="net.calit2.archaeology.database.LithicsBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lithicsBulk.label', default: 'LithicsBulk')}" />
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
                                  <label for="year"><g:message code="lithicsBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${lithicsBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="lithicsBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${lithicsBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="lithicsBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${lithicsBulkInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="lithicsBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${lithicsBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="lithicsBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${lithicsBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="lithicsBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${lithicsBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="lithicsBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${lithicsBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="lithicsBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${lithicsBulkInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="lithicsBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${lithicsBulkInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="lithicsBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${lithicsBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="lithicsBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${lithicsBulkInstance.constraints.period.inList}" value="${lithicsBulkInstance?.period}" valueMessagePrefix="lithicsBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="lithicsBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${lithicsBulkInstance.constraints.storageField.inList}" value="${lithicsBulkInstance?.storageField}" valueMessagePrefix="lithicsBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="lithicsBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${lithicsBulkInstance.constraints.storageSanDiego.inList}" value="${lithicsBulkInstance?.storageSanDiego}" valueMessagePrefix="lithicsBulk.storageSanDiego"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="lithicsBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: lithicsBulkInstance, field: 'count')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="lithicsBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: lithicsBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countDebitage"><g:message code="lithicsBulk.countDebitage.label" default="Count Debitage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'countDebitage', 'errors')}">
                                    <g:textField name="countDebitage" value="${fieldValue(bean: lithicsBulkInstance, field: 'countDebitage')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightDebitage"><g:message code="lithicsBulk.weightDebitage.label" default="Weight Debitage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'weightDebitage', 'errors')}">
                                    <g:textField name="weightDebitage" value="${fieldValue(bean: lithicsBulkInstance, field: 'weightDebitage')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countCores"><g:message code="lithicsBulk.countCores.label" default="Count Cores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'countCores', 'errors')}">
                                    <g:textField name="countCores" value="${fieldValue(bean: lithicsBulkInstance, field: 'countCores')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightCores"><g:message code="lithicsBulk.weightCores.label" default="Weight Cores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'weightCores', 'errors')}">
                                    <g:textField name="weightCores" value="${fieldValue(bean: lithicsBulkInstance, field: 'weightCores')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countTools"><g:message code="lithicsBulk.countTools.label" default="Count Tools" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'countTools', 'errors')}">
                                    <g:textField name="countTools" value="${fieldValue(bean: lithicsBulkInstance, field: 'countTools')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weightTools"><g:message code="lithicsBulk.weightTools.label" default="Weight Tools" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lithicsBulkInstance, field: 'weightTools', 'errors')}">
                                    <g:textField name="weightTools" value="${fieldValue(bean: lithicsBulkInstance, field: 'weightTools')}" />
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
