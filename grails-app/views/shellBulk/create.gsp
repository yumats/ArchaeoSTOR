

<%@ page import="net.calit2.archaeology.database.ShellBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shellBulk.label', default: 'ShellBulk')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shellBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${shellBulkInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:render template="/barcodeForm" />

            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="shellBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${shellBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="shellBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${shellBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="shellBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${shellBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="area"><g:message code="shellBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${shellBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edm"><g:message code="shellBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${shellBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basket"><g:message code="shellBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${shellBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locus"><g:message code="shellBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${shellBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyFeature"><g:message code="shellBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="shellBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${shellBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="shellBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${shellBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period"><g:message code="shellBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${shellBulkInstance.constraints.period.inList}" value="${shellBulkInstance?.period}" valueMessagePrefix="shellBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countSmall"><g:message code="shellBulk.countSmall.label" default="Count Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'countSmall', 'errors')}">
                                    <g:textField name="countSmall" value="${fieldValue(bean: shellBulkInstance, field: 'countSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weightSmall"><g:message code="shellBulk.weightSmall.label" default="Weight Small" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'weightSmall', 'errors')}">
                                    <g:textField name="weightSmall" value="${fieldValue(bean: shellBulkInstance, field: 'weightSmall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countMedium"><g:message code="shellBulk.countMedium.label" default="Count Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'countMedium', 'errors')}">
                                    <g:textField name="countMedium" value="${fieldValue(bean: shellBulkInstance, field: 'countMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weightMedium"><g:message code="shellBulk.weightMedium.label" default="Weight Medium" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'weightMedium', 'errors')}">
                                    <g:textField name="weightMedium" value="${fieldValue(bean: shellBulkInstance, field: 'weightMedium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countLarge"><g:message code="shellBulk.countLarge.label" default="Count Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'countLarge', 'errors')}">
                                    <g:textField name="countLarge" value="${fieldValue(bean: shellBulkInstance, field: 'countLarge')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weightLarge"><g:message code="shellBulk.weightLarge.label" default="Weight Large" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shellBulkInstance, field: 'weightLarge', 'errors')}">
                                    <g:textField name="weightLarge" value="${fieldValue(bean: shellBulkInstance, field: 'weightLarge')}" />
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
