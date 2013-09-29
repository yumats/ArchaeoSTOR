<g:javascript library="jquery" plugin="jquery" />
<script type="text/javascript">
    $(document).ready(function(){
        hideAllItems();
    });
    function hideAllItems() {
        $('tr.rim').hide();
        $('tr.base').hide();
        $('tr.handle').hide();
        $('tr.lid').hide();
        $('tr.decor').hide();
        $('tr.other').hide();
    }
    function showItems(category, toShow) {
        if (toShow) {
            $('tr.' + category).show();
        } else {
            $('tr.' + category).hide();
        }
    }
</script>

<tr class="prop">
    <td valign="top" class="name">
        <label for="category">Category</label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: potteryDiagnosticInstance, field: 'generalType', 'errors')}">
        <g:checkBox name="rim" onClick="showItems(this.name, this.checked)" /> Rim
        <g:checkBox name="handle" onClick="showItems(this.name, this.checked)" style="margin-left: 15px" /> Handle
        <g:checkBox name="base" onClick="showItems(this.name, this.checked)" style="margin-left: 15px" /> Base
        <g:checkBox name="lid" onClick="showItems(this.name, this.checked)" style="margin-left: 15px" /> Lid
        <g:checkBox name="decor" onClick="showItems(this.name, this.checked)" style="margin-left: 15px" /> Decor
        <g:checkBox name="other" onClick="showItems(this.name, this.checked)" style="margin-left: 15px" /> Other
    </td>
</tr>