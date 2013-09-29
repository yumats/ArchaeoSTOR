<g:javascript library="jquery" plugin="jquery" />
<script type="text/javascript">
$(document).ready(function(){
    $('input#id').focus();
    $('input#id').keyup(function(event){
        if (event.which != 8 && $(this).val()) {
            setTimeout('doSubmit()', 1000);
        }
    });
});
function doSubmit() {
    $('form#getDiagnostic').submit();
}
</script>

<g:form name="getDiagnostic" action="getDiagnostic">
    <div class="dialog" style="margin-bottom: -1px">
        <table>
            <tbody>
            <tr class="prop">
                <td valign="top" class="name">
                    Artifact ID
                </td>
                <td valign="top">
                    <g:textField name="id" />
                    <g:submitButton name="create" class="save" value="Find Diagnostic" />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</g:form>