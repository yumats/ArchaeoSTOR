
<%@ page import="net.calit2.archaeology.database.FtirRaw" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ftirRaw.label', default: 'FtirRaw')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'ftirRaw';
        </script>

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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ftirRaw.id.label', default: 'Id')}" />
                        
                            <th>Diagnostic ID</th>
                        
                            <g:sortableColumn property="filename" title="${message(code: 'ftirRaw.filename.label', default: 'Filename')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ftirRawInstanceList}" status="i" var="ftirRawInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ftirRawInstance.id}">${fieldValue(bean: ftirRawInstance, field: "id")}</g:link></td>

                            <td><g:link controller="diagnostic" action="edit" id="${ftirRawInstance?.diagnostic?.id}">${ftirRawInstance?.diagnostic?.id}</g:link></td>
                        
                            <td class="uneditable" data-id="${ftirRawInstance.id}" data-field="filename">${fieldValue(bean: ftirRawInstance, field: "filename")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${ftirRawInstanceTotal}" />
                </div>
            </g:if>
            <!--
            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
            -->
        </div>
    </body>
</html>
