

<%@ page import="net.calit2.archaeology.database.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.identify.label" args="[entityName]" /></title>
        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="barcode.js" />
        <script type="text/javascript">
            $(document).ready(function(){
                $('input#id').focus();
                $('input#id').keyup(function(event){
                    if (event.which != 8 && $(this).val()) {
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
            <h1>Find Associated Diagnostic</h1>
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

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="search" action="showDiagnostic" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
