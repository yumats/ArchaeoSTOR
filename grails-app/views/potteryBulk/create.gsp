

<%@ page import="net.calit2.archaeology.database.PotteryBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'potteryBulk.label', default: 'PotteryBulk')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${potteryBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${potteryBulkInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:render template="/barcodeForm" />

            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="potteryBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${potteryBulkInstance?.year}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="potteryBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${potteryBulkInstance?.date}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="potteryBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${potteryBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="area"><g:message code="potteryBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${potteryBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edm"><g:message code="potteryBulk.edm.label" default="EDM" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${potteryBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basket"><g:message code="potteryBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${potteryBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locus"><g:message code="potteryBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${potteryBulkInstance?.locus}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyFeature"><g:message code="potteryBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="potteryBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list(sort: 'id', order: 'asc')}" optionKey="id" value="${potteryBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="potteryBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${potteryBulkInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="potteryBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${potteryBulkInstance.constraints.period.inList}" value="${potteryBulkInstance?.period}" valueMessagePrefix="potteryBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="handmadeCount"><g:message code="potteryBulk.handmadeCount.label" default="Handmade Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'handmadeCount', 'errors')}">
                                    <g:textField name="handmadeCount" value="${fieldValue(bean: potteryBulkInstance, field: 'handmadeCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="handmadeWeight"><g:message code="potteryBulk.handmadeWeight.label" default="Handmade Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'handmadeWeight', 'errors')}">
                                    <g:textField name="handmadeWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'handmadeWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="wheelmadeCount"><g:message code="potteryBulk.wheelmadeCount.label" default="Wheelmade Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'wheelmadeCount', 'errors')}">
                                    <g:textField name="wheelmadeCount" value="${fieldValue(bean: potteryBulkInstance, field: 'wheelmadeCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="wheelmadeWeight"><g:message code="potteryBulk.wheelmadeWeight.label" default="Wheelmade Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'wheelmadeWeight', 'errors')}">
                                    <g:textField name="wheelmadeWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'wheelmadeWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cookingCount"><g:message code="potteryBulk.cookingCount.label" default="Cooking Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'cookingCount', 'errors')}">
                                    <g:textField name="cookingCount" value="${fieldValue(bean: potteryBulkInstance, field: 'cookingCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cookingWeight"><g:message code="potteryBulk.cookingWeight.label" default="Cooking Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'cookingWeight', 'errors')}">
                                    <g:textField name="cookingWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'cookingWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="handlesCount"><g:message code="potteryBulk.handlesCount.label" default="Handles Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'handlesCount', 'errors')}">
                                    <g:textField name="handlesCount" value="${fieldValue(bean: potteryBulkInstance, field: 'handlesCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="handlesWeight"><g:message code="potteryBulk.handlesWeight.label" default="Handles Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'handlesWeight', 'errors')}">
                                    <g:textField name="handlesWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'handlesWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basesCount"><g:message code="potteryBulk.basesCount.label" default="Bases Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'basesCount', 'errors')}">
                                    <g:textField name="basesCount" value="${fieldValue(bean: potteryBulkInstance, field: 'basesCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="basesWeight"><g:message code="potteryBulk.basesWeight.label" default="Bases Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'basesWeight', 'errors')}">
                                    <g:textField name="basesWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'basesWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="decorCount"><g:message code="potteryBulk.decorCount.label" default="Decor Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'decorCount', 'errors')}">
                                    <g:textField name="decorCount" value="${fieldValue(bean: potteryBulkInstance, field: 'decorCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="decorWeight"><g:message code="potteryBulk.decorWeight.label" default="Decor Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'decorWeight', 'errors')}">
                                    <g:textField name="decorWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'decorWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosticCount"><g:message code="potteryBulk.diagnosticCount.label" default="Diagnostic Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'diagnosticCount', 'errors')}">
                                    <g:textField name="diagnosticCount" value="${fieldValue(bean: potteryBulkInstance, field: 'diagnosticCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosticWeight"><g:message code="potteryBulk.diagnosticWeight.label" default="Diagnostic Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'diagnosticWeight', 'errors')}">
                                    <g:textField name="diagnosticWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'diagnosticWeight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="otherSpecialCount"><g:message code="potteryBulk.otherSpecialCount.label" default="Other Special Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'otherSpecialCount', 'errors')}">
                                    <g:textField name="otherSpecialCount" value="${fieldValue(bean: potteryBulkInstance, field: 'otherSpecialCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="otherSpecialWeight"><g:message code="potteryBulk.otherSpecialWeight.label" default="Other Special Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: potteryBulkInstance, field: 'otherSpecialWeight', 'errors')}">
                                    <g:textField name="otherSpecialWeight" value="${fieldValue(bean: potteryBulkInstance, field: 'otherSpecialWeight')}" />
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
