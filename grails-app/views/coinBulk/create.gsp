

<%@ page import="net.calit2.archaeology.database.CoinBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'coinBulk.label', default: 'CoinBulk')}" />
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
            <g:hasErrors bean="${coinBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${coinBulkInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:render template="/barcodeForm" />

            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="coinBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${coinBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="coinBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${coinBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="coinBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${coinBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="area"><g:message code="coinBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${coinBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edm"><g:message code="coinBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${coinBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basket"><g:message code="coinBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${coinBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locus"><g:message code="coinBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${coinBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyFeature"><g:message code="coinBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="coinBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${coinBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="coinBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${coinBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period"><g:message code="coinBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${coinBulkInstance.constraints.period.inList}" value="${coinBulkInstance?.period}" valueMessagePrefix="coinBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="count"><g:message code="coinBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: coinBulkInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weight"><g:message code="coinBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coinBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: coinBulkInstance, field: 'weight')}" />
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
