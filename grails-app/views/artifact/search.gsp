

<%@ page import="net.calit2.archaeology.database.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <!--
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            -->
        </div>
        <div class="body">
            <h1><g:message code="default.search.label" args="[entityName]" /></h1>
            <!--
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${artifactInstance}">
            <div class="errors">
                <g:renderErrors bean="${artifactInstance}" as="list" />
            </div>
            </g:hasErrors>
            -->
            <g:form method="post" >
                <!--
                <g:hiddenField name="id" value="${artifactInstance?.id}" />
                <g:hiddenField name="version" value="${artifactInstance?.version}" />
                -->
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="artifact.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${artifactInstance?.year}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="artifact.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${artifactInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="artifact.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${artifactInstance?.site?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="artifact.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${artifactInstance.constraints.type.inList}" value="${artifactInstance?.type}" valueMessagePrefix="artifact.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="area"><g:message code="artifact.area.label" default="Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'area', 'errors')}">
                                    <g:textField name="area" value="${artifactInstance?.area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edm"><g:message code="artifact.edm.label" default="EDM" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'edm', 'errors')}">
                                    <g:textField name="edm" value="${artifactInstance?.edm}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="artifact.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${artifactInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="artifact.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${artifactInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveyFeature"><g:message code="artifact.surveyFeature.label" default="Survey Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'surveyFeature', 'errors')}">
                                    <g:select name="surveyFeature.id" from="${net.calit2.archaeology.database.SurveyFeature.list()}" optionKey="id" value="${artifactInstance?.surveyFeature?.id}" noSelection="['': '']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="count"><g:message code="artifact.count.label" default="Total Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'count', 'errors')}">
                                    <g:textField name="count" value="${fieldValue(bean: artifactInstance, field: 'count')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="artifact.weight.label" default="Total Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: artifactInstance, field: 'weight')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="artifact.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${artifactInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="period"><g:message code="artifact.period.label" default="Period" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'period', 'errors')}">
                                    <g:select name="period" from="${artifactInstance.constraints.period.inList}" value="${artifactInstance?.period}" valueMessagePrefix="artifact.period"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageField"><g:message code="artifact.storageField.label" default="Storage Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'storageField', 'errors')}">
                                    <g:select name="storageField" from="${artifactInstance.constraints.storageField.inList}" value="${artifactInstance?.storageField}" valueMessagePrefix="artifact.storageField"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="storageSanDiego"><g:message code="artifact.storageSanDiego.label" default="Storage San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'storageSanDiego', 'errors')}">
                                    <g:select name="storageSanDiego" from="${artifactInstance.constraints.storageSanDiego.inList}" value="${artifactInstance?.storageSanDiego}" valueMessagePrefix="artifact.storageSanDiego"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crate"><g:message code="artifact.crate.label" default="Crate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'crate', 'errors')}">
                                    <g:select name="crate.id" from="${net.calit2.archaeology.database.Crate.list(sort: 'id', order: 'asc')}" optionKey="id" value="${artifactInstance?.crate?.id}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <!--
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    -->
                    <span class="button"><g:actionSubmit class="search" action="query" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
