

<%@ page import="net.calit2.archaeology.database.MetalBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'metalBulk.label', default: 'MetalBulk')}" />
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
            <g:hasErrors bean="${metalBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${metalBulkInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:render template="/barcodeForm" />

            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="metalBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${metalBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="metalBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${metalBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="metalBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${metalBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="area"><g:message code="metalBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${metalBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edm"><g:message code="metalBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${metalBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basket"><g:message code="metalBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${metalBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locus"><g:message code="metalBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${metalBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyFeature"><g:message code="metalBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="metalBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${metalBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="metalBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${metalBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period"><g:message code="metalBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${metalBulkInstance.constraints.period.inList}" value="${metalBulkInstance?.period}" valueMessagePrefix="metalBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countLumps"><g:message code="metalBulk.countLumps.label" default="Count Lumps" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'countLumps', 'errors')}">
                                    <g:textField name="countLumps" value="${fieldValue(bean: metalBulkInstance, field: 'countLumps')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weightLumps"><g:message code="metalBulk.weightLumps.label" default="Weight Lumps" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'weightLumps', 'errors')}">
                                    <g:textField name="weightLumps" value="${fieldValue(bean: metalBulkInstance, field: 'weightLumps')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countObject"><g:message code="metalBulk.countObject.label" default="Count Object" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'countObject', 'errors')}">
                                    <g:textField name="countObject" value="${fieldValue(bean: metalBulkInstance, field: 'countObject')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weightObject"><g:message code="metalBulk.weightObject.label" default="Weight Object" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'weightObject', 'errors')}">
                                    <g:textField name="weightObject" value="${fieldValue(bean: metalBulkInstance, field: 'weightObject')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="metalType"><g:message code="metalBulk.metalType.label" default="Metal Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: metalBulkInstance, field: 'metalType', 'errors')}">
                                    <g:select name="metalType" from="${metalBulkInstance.constraints.metalType.inList}" value="${metalBulkInstance?.metalType}" valueMessagePrefix="metalBulk.metalType"  />
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
