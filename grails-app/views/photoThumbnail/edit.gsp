

<%@ page import="net.calit2.archaeology.database.PhotoThumbnail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'photoThumbnail.label', default: 'PhotoThumbnail')}" />
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
            <g:hasErrors bean="${photoThumbnailInstance}">
            <div class="errors">
                <g:renderErrors bean="${photoThumbnailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${photoThumbnailInstance?.id}" />
                <g:hiddenField name="version" value="${photoThumbnailInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="site"><g:message code="photoThumbnail.site.label" default="Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'site', 'errors')}">
                                    <g:textField name="site" value="${photoThumbnailInstance?.site}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locus"><g:message code="photoThumbnail.locus.label" default="Locus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'locus', 'errors')}">
                                    <g:textField name="locus" value="${photoThumbnailInstance?.locus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="basket"><g:message code="photoThumbnail.basket.label" default="Basket" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'basket', 'errors')}">
                                    <g:textField name="basket" value="${photoThumbnailInstance?.basket}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sequence"><g:message code="photoThumbnail.sequence.label" default="Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'sequence', 'errors')}">
                                    <g:textField name="sequence" value="${photoThumbnailInstance?.sequence}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="image"><g:message code="photoThumbnail.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: photoThumbnailInstance, field: 'image', 'errors')}">
                                    <img src="<g:createLink action='renderImage' id='${photoThumbnailInstance?.id}'/>" width="480" height="360">
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
