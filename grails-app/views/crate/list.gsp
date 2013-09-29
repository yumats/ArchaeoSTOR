
<%@ page import="net.calit2.archaeology.database.Crate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crate.label', default: 'Crate')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'crate.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="number" title="${message(code: 'crate.number.label', default: 'Number')}" />
                        
                            <th><g:message code="crate.site.label" default="Site" /></th>

                            <g:sortableColumn property="year" title="${message(code: 'crate.year.label', default: 'Year')}" />

                            <g:sortableColumn property="locationField" title="${message(code: 'crate.locationField.label', default: 'Location Field')}" />

                            <g:sortableColumn property="locationSanDiego" title="${message(code: 'crate.locationSanDiego.label', default: 'Location San Diego')}" />

                            <g:sortableColumn property="contents" title="${message(code: 'crate.contents.label', default: 'Contents')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${crateInstanceList}" status="i" var="crateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${crateInstance.id}">${fieldValue(bean: crateInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: crateInstance, field: "number")}</td>
                        
                            <td>${fieldValue(bean: crateInstance, field: "site")}</td>

                            <td>${crateInstance?.year}</td>

                            <td>${fieldValue(bean: crateInstance, field: "locationField")}</td>

                            <td>${fieldValue(bean: crateInstance, field: "locationSanDiego")}</td>

                            <td>${fieldValue(bean: crateInstance, field: "contents")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${crateInstanceTotal}" />
                </div>
            </g:if>
            <!--
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
            -->
        </div>
    </body>
</html>
