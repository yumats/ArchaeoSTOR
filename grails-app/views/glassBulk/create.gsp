

<%@ page import="net.calit2.archaeology.database.GlassBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'glassBulk.label', default: 'GlassBulk')}" />
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
            <g:hasErrors bean="${glassBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${glassBulkInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:render template="/barcodeForm" />

            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="glassBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${glassBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="glassBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${glassBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="glassBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${glassBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="area"><g:message code="glassBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${glassBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edm"><g:message code="glassBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${glassBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basket"><g:message code="glassBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${glassBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locus"><g:message code="glassBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${glassBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyFeature"><g:message code="glassBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="glassBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${glassBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="glassBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${glassBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period"><g:message code="glassBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${glassBulkInstance.constraints.period.inList}" value="${glassBulkInstance?.period}" valueMessagePrefix="glassBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bulkCount"><g:message code="glassBulk.bulkCount.label" default="Bulk Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'bulkCount', 'errors')}">
                                    <g:textField name="bulkCount" value="${fieldValue(bean: glassBulkInstance, field: 'bulkCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bulkWeight"><g:message code="glassBulk.bulkWeight.label" default="Bulk Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'bulkWeight', 'errors')}">
                                    <g:textField name="bulkWeight" value="${fieldValue(bean: glassBulkInstance, field: 'bulkWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosticCount"><g:message code="glassBulk.diagnosticCount.label" default="Diagnostic Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'diagnosticCount', 'errors')}">
                                    <g:textField name="diagnosticCount" value="${fieldValue(bean: glassBulkInstance, field: 'diagnosticCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosticWeight"><g:message code="glassBulk.diagnosticWeight.label" default="Diagnostic Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: glassBulkInstance, field: 'diagnosticWeight', 'errors')}">
                                    <g:textField name="diagnosticWeight" value="${fieldValue(bean: glassBulkInstance, field: 'diagnosticWeight')}" />
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
