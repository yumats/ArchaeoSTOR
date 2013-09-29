

<%@ page import="net.calit2.archaeology.database.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.move.label" args="[entityName]" /></title>
        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="barcode.js" />
        <script type="text/javascript">
            $(document).ready(function(){
                $('input#id').focus();
                $('input#id').keyup(function(){
                    if (event.which != 8 && $(this).val()) {
                        setTimeout("$('input#crate').focus()", 750);
                    }
                });
                $('input#crate').keyup(function(){
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
        </div>
        <div class="body">
            <h1><g:message code="default.crate.label" args="[entityName]" /></h1>
            <g:form method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="id"><g:message code="artifact.id.label" default="Artifact ID" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="id" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crate"><g:message code="artifact.crate.label" default="Crate ID" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="crate.id" id="crate"/>
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
