

<%@ page import="net.calit2.archaeology.database.OtherBulk" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherBulk.label', default: 'OtherBulk')}" />
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
            <g:hasErrors bean="${otherBulkInstance}">
            <div class="errors">
                <g:renderErrors bean="${otherBulkInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${otherBulkInstance?.id}" />
                <g:hiddenField name="version" value="${otherBulkInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="otherBulk.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${otherBulkInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="otherBulk.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${otherBulkInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="otherBulk.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${otherBulkInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="otherBulk.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${otherBulkInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="otherBulk.edm.label" default="Edm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${otherBulkInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="otherBulk.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${otherBulkInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="otherBulk.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${otherBulkInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="otherBulk.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'surveyFeature', 'errors')}">
                                    <g:set var="surveyFeatureId" value="${otherBulkInstance?.surveyFeature?.id}" scope="request" />
                                    <g:render template="/surveyFeature" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="otherBulk.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list()}" optionKey="id" value="${otherBulkInstance?.crate?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diagnostics"><g:message code="otherBulk.diagnostics.label" default="Diagnostics" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'diagnostics', 'errors')}">
                                    
<ul>
<g:each in="${otherBulkInstance?.diagnostics?}" var="d">
    <li><g:link controller="diagnostic" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="diagnostic" action="create" params="['artifact.id': otherBulkInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'diagnostic.label', default: 'Diagnostic')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="otherBulk.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${otherBulkInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="otherBulk.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${otherBulkInstance.constraints.period.inList}" value="${otherBulkInstance?.period}" valueMessagePrefix="otherBulk.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="otherBulk.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${otherBulkInstance.constraints.storageField.inList}" value="${otherBulkInstance?.storageField}" valueMessagePrefix="otherBulk.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="otherBulk.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${otherBulkInstance.constraints.storageSanDiego.inList}" value="${otherBulkInstance?.storageSanDiego}" valueMessagePrefix="otherBulk.storageSanDiego"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="otherBulk.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: otherBulkInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="otherBulk.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: otherBulkInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dCode"><g:message code="otherBulk.dCode.label" default="ArchField Dcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherBulkInstance, field: 'dCode', 'errors')}">
                                    <g:select name="dCode" from="${otherBulkInstance.constraints.dCode.inList}" value="${otherBulkInstance?.dCode}" valueMessagePrefix="otherBulk.dCode" noSelection="['': '']" />
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
