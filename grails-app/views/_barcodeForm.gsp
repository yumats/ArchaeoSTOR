<g:javascript library="jquery" plugin="jquery" />
<script type="text/javascript">
$(document).ready(function(){
    $('input#barcode').focus();
    $('input#barcode').keyup(function(event){
        if (event.which != 8 && $(this).val()) {
            setTimeout('doSubmit()', 750);
        }
    });
});
function doSubmit() {
    $('form#barcodeForm').submit();
}
</script>

<g:form name="barcodeForm" action="getArchData">
    <div class="dialog" style="margin-bottom: -1px">
        <table>
            <tbody>
            <tr class="prop">
                <td valign="top" class="name">
                    ArchField Barcode
                </td>
                <td valign="top">
                    <g:textField name="barcode" />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</g:form>