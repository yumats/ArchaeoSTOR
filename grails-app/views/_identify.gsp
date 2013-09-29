<g:javascript library="jquery" plugin="jquery" />
<g:javascript src="barcode.js" />
<script type="text/javascript">
    $(document).ready(function() {
        $('input#id').focus();
        $('input#id').keyup(function(event) {
            if (event.which != 8 && $(this).val()) {
                setTimeout("doSubmit()", 750);
            }
        });
    });
</script>