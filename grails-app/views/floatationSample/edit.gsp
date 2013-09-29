

<%@ page import="net.calit2.archaeology.database.FloatationSample" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'floatationSample.label', default: 'FloatationSample')}" />
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
            <g:hasErrors bean="${floatationSampleInstance}">
            <div class="errors">
                <g:renderErrors bean="${floatationSampleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${floatationSampleInstance?.id}" />
                <g:hiddenField name="version" value="${floatationSampleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="floatationSample.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${floatationSampleInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="floatationSample.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${floatationSampleInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="floatationSample.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${floatationSampleInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="floatationSample.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${floatationSampleInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="floatationSample.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${floatationSampleInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="floatationSample.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${floatationSampleInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="floatationSample.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${floatationSampleInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="floatationSample.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'surveyFeature', 'errors')}">
                                    <g:set var="surveyFeatureId" value="${floatationSampleInstance?.surveyFeature?.id}" scope="request" />
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="floatationSample.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${floatationSampleInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diagnostics"><g:message code="floatationSample.diagnostics.label" default="Diagnostics" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'diagnostics', 'errors')}">
                                    
<ul>
<g:each in="${floatationSampleInstance?.diagnostics?}" var="d">
    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="diagnostic" action="create" params="['artifact.id': floatationSampleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'diagnostic.label', default: 'Diagnostic')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="floatationSample.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${floatationSampleInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="floatationSample.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${floatationSampleInstance.constraints.period.inList}" value="${floatationSampleInstance?.period}" valueMessagePrefix="floatationSample.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="floatationSample.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${floatationSampleInstance.constraints.storageField.inList}" value="${floatationSampleInstance?.storageField}" valueMessagePrefix="floatationSample.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="floatationSample.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${floatationSampleInstance.constraints.storageSanDiego.inList}" value="${floatationSampleInstance?.storageSanDiego}" valueMessagePrefix="floatationSample.storageSanDiego"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="floatationSample.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: floatationSampleInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="floatationSample.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floatationSampleInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: floatationSampleInstance, field: 'weight')}" />
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
