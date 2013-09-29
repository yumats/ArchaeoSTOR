

<%@ page import="net.calit2.archaeology.database.ChemistrySample" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'chemistrySample.label', default: 'ChemistrySample')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${chemistrySampleInstance}">
            <div class="errors">
                <g:renderErrors bean="${chemistrySampleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${chemistrySampleInstance?.id}" />
                <g:hiddenField name="version" value="${chemistrySampleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="chemistrySample.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${chemistrySampleInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="chemistrySample.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${chemistrySampleInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="chemistrySample.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${chemistrySampleInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="chemistrySample.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${chemistrySampleInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="chemistrySample.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${chemistrySampleInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="chemistrySample.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${chemistrySampleInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="chemistrySample.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${chemistrySampleInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="chemistrySample.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'surveyFeature', 'errors')}">
                                    <g:set var="surveyFeatureId" value="${chemistrySampleInstance?.surveyFeature?.id}" scope="request" />
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="chemistrySample.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${chemistrySampleInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diagnostics"><g:message code="chemistrySample.diagnostics.label" default="Diagnostics" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'diagnostics', 'errors')}">
                                    
<ul>
<g:each in="${chemistrySampleInstance?.diagnostics?}" var="d">
    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="diagnostic" action="create" params="['chemistrySample.id': artifact?.id]">${message(code: 'default.add.label', args: [message(code: 'diagnostic.label', default: 'Diagnostic')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="chemistrySample.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${chemistrySampleInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="chemistrySample.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${chemistrySampleInstance.constraints.period.inList}" value="${chemistrySampleInstance?.period}" valueMessagePrefix="chemistrySample.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="chemistrySample.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${chemistrySampleInstance.constraints.storageField.inList}" value="${chemistrySampleInstance?.storageField}" valueMessagePrefix="chemistrySample.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="chemistrySample.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${chemistrySampleInstance.constraints.storageSanDiego.inList}" value="${chemistrySampleInstance?.storageSanDiego}" valueMessagePrefix="chemistrySample.storageSanDiego"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="chemistrySample.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: chemistrySampleInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="chemistrySample.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: chemistrySampleInstance, field: 'weight')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sampleNumber"><g:message code="chemistrySample.sampleNumber.label" default="Sample Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chemistrySampleInstance, field: 'sampleNumber', 'errors')}">
                                    <g:textField name="sampleNumber" value="${fieldValue(bean: chemistrySampleInstance, field: 'sampleNumber')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="print" value="${message(code: 'default.button.print.label', default: 'Print')}"  onclick="alert('${message(code: 'default.button.print.alert.message')}');" /></span>
                    <span class="button"><g:actionSubmit class="print" action="printAllDiagnostics" value="Print All Diagnostics"  onclick="alert('${message(code: 'default.button.print.alert.message', default: 'Paper Size: Address (1.12 by 3.5)')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
