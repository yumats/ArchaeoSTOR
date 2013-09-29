
<%@ page import="net.calit2.archaeology.database.Diagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'diagnostic.id.label', default: 'Id')}" />

                            <g:sortableColumn property="registration" title="${message(code: 'diagnostic.registration.label', default: 'Registration')}" />

                            <th>Artifact ID</th>
                            <th>Year</th>
                            <th>Site</th>
                            <th>Feature</th>
                            <th>EDM</th>
                            <th>Basket</th>
                            <th>Locus</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${diagnosticInstanceList}" status="i" var="diagnosticInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${diagnosticInstance.id}">${fieldValue(bean: diagnosticInstance, field: "id")}</g:link></td>

                            <td class="editable" data-id="${diagnosticInstance.id}" data-field="registration">${fieldValue(bean: diagnosticInstance, field: "registration")}</td>

                            <td><g:link controller="artifact" action="edit" id="${diagnosticInstance?.artifact?.id}">${diagnosticInstance?.artifact?.id}</g:link></td>
                            <td>${diagnosticInstance.artifact?.year}</td>
                            <td>${diagnosticInstance.artifact?.site}</td>
                            <td>${diagnosticInstance.artifact?.surveyFeature}</td>
                            <td>${diagnosticInstance.artifact?.edm}</td>
                            <td>${diagnosticInstance.artifact?.basket}</td>
                            <td>${diagnosticInstance.artifact?.locus}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${diagnosticInstanceTotal}" />
                </div>
            </g:if>
            <!--
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
            -->
        </div>
    </body>
</html>
