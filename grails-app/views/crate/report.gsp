

<%@ page import="net.calit2.archaeology.database.Crate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crate.label', default: 'Crate')}" />
        <title>Report Crate</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Report Crate</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${crateInstance}">
            <div class="errors">
                <g:renderErrors bean="${crateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="export" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="crate.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'site', 'errors')}">
                                    <g:if test="${session.institution}">
                                        <g:select name="site.id" from="${net.calit2.archaeology.database.Site.findAllByExcavationInstitution(session.institution, [sort:'name', order:'asc'])}" value="${session.site}" optionKey="id" noSelection="['null':'']" />
                                    </g:if>
                                    <g:else>
                                        <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list(sort:'name', order:'asc')}" optionKey="id" value="${crateInstance?.site?.id}" noSelection="['null': '']" />
                                    </g:else>
                                </td>
                            </tr>

                            <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="crate.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${crateInstance?.year}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationField"><g:message code="crate.locationField.label" default="Location Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'locationField', 'errors')}">
                                    <g:select name="locationField" from="${crateInstance.constraints.locationField.inList}" value="${crateInstance?.locationField}" valueMessagePrefix="crate.locationField"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationSanDiego"><g:message code="crate.locationSanDiego.label" default="Location San Diego" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'locationSanDiego', 'errors')}">
                                    <g:select name="locationSanDiego" from="${crateInstance.constraints.locationSanDiego.inList}" value="${crateInstance?.locationSanDiego}" valueMessagePrefix="crate.locationSanDiego"  />
                                </td>
                            </tr>
                            -->

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="download" action="export" value="${message(code: 'default.button.export.label', default: 'Export')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
