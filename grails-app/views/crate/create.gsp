

<%@ page import="net.calit2.archaeology.database.Crate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crate.label', default: 'Crate')}" />
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
            <g:hasErrors bean="${crateInstance}">
            <div class="errors">
                <g:renderErrors bean="${crateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number"><g:message code="crate.number.label" default="Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'number', 'errors')}">
                                    <g:textField name="number" value="${crateInstance?.number}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site"><g:message code="crate.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'site', 'errors')}">
                                    <g:select name="site.id" from="${net.calit2.archaeology.database.Site.list()}" optionKey="id" value="${crateInstance?.site?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>

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

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contents"><g:message code="crate.contents.label" default="Contents" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: crateInstance, field: 'contents', 'errors')}">
                                    <g:textField name="contents" value="${crateInstance?.contents}" />
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
