

<%@ page import="net.calit2.archaeology.database.RadioCarbonBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonBulk.label', default: 'RadioCarbonBulk')}" />
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
            <g:hasErrors bean="${radioCarbonBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${radioCarbonBulkInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${radioCarbonBulkInstance?.id}" />
                <g:hiddenField name="version" value="${radioCarbonBulkInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="radioCarbonBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${radioCarbonBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="radioCarbonBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${radioCarbonBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="radioCarbonBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${radioCarbonBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="radioCarbonBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${radioCarbonBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="radioCarbonBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${radioCarbonBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="radioCarbonBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${radioCarbonBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="radioCarbonBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${radioCarbonBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="radioCarbonBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:set var="surveyFeatureId" value="${radioCarbonBulkInstance?.surveyFeature?.id}" scope="request" />
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="radioCarbonBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${radioCarbonBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="radioCarbonBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${radioCarbonBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="radioCarbonBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${radioCarbonBulkInstance.constraints.period.inList}" value="${radioCarbonBulkInstance?.period}" valueMessagePrefix="radioCarbonBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="radioCarbonBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${radioCarbonBulkInstance.constraints.storageField.inList}" value="${radioCarbonBulkInstance?.storageField}" valueMessagePrefix="radioCarbonBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="radioCarbonBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${radioCarbonBulkInstance.constraints.storageSanDiego.inList}" value="${radioCarbonBulkInstance?.storageSanDiego}" valueMessagePrefix="radioCarbonBulk.storageSanDiego"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="radioCarbonBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: radioCarbonBulkInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="radioCarbonBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: radioCarbonBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnostics"><g:message code="radioCarbonBulk.diagnostics.label" default="Diagnostics" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: radioCarbonBulkInstance, field: 'diagnostics', 'errors')}">

                                    <ul>
                                        <g:each in="${radioCarbonBulkInstance?.diagnostics?}" var="d">
                                            <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                        </g:each>
                                    </ul>
                                    <g:link controller="diagnostic" action="create" params="['artifact.id': radioCarbonBulkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'diagnostic.label', default: 'Diagnostic')])}</g:link>

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
