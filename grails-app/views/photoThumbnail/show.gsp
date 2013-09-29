
<%@ page import="net.calit2.archaeology.database.PhotoThumbnail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'photoThumbnail.label', default: 'PhotoThumbnail')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: photoThumbnailInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.site.label" default="Site" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: photoThumbnailInstance, field: "site")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.locus.label" default="Locus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: photoThumbnailInstance, field: "locus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.basket.label" default="Basket" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: photoThumbnailInstance, field: "basket")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.sequence.label" default="Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: photoThumbnailInstance, field: "sequence")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="photoThumbnail.image.label" default="Image" /></td>

                            <td valigh="top"><img src="<g:createLink action='renderImage' id='${photoThumbnailInstance?.id}'/>" width="480" height="360"></td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${photoThumbnailInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
