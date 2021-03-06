

<%@ page import="net.calit2.archaeology.database.Crate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crate.label', default: 'Crate')}" />
        <title><g:message code="default.move.label" args="[entityName]" /></title>
        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="barcode.js" />
        <script type="text/javascript">
            $(document).ready(function(){
                $('input#id').focus();
                $('input#id').keyup(function(){
                    if (event.which != 8 && $(this).val()) {
                        setTimeout("$('input#locationSanDiego').focus()", 750);
                    }
                });
                $('input#locationSanDiego').keyup(function(){
                    if (event.which != 8 && $('input#id').val()) {
                        setTimeout("doSubmit()", 750);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="print" controller="artifact" action="printStorageSD">Print Location SD Barcodes</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.move.label" args="[entityName]" /></h1>
            <g:form method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="id"><g:message code="crate.id.label" default="Crate ID" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="id" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locationSanDiego"><g:message code="crate.locationSanDiego.label" default="Location SD" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="locationSanDiego" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
