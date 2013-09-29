$(document).ready(function(){
    $('table').delegate('td.editable', 'dblclick', function(event){
        var id = $(this).attr('data-id');
        var field = $(this).attr('data-field');
        var value = $(this).text();
        var keyupFunc = "handleEnter(event, '" + id + "', '" + field + "', this.value)";
        $(this).text('');
        $(this).removeClass('editable').addClass('editing');
        $(this).append('<input type="text" name="value" value="' + value + '" size="5" onkeyup="' + keyupFunc + '" />');
    });
    $('td.uneditable').dblclick(function(event){
        alert('Cannot edit this field.');
    });
});

function handleEnter(e, id, field, value) {
    if (e.which == 13) {
        var data = {id:id};
        data[field] = value;
        jQuery.ajax({
            type:'POST',
            data:data,
            url:'/archaeology/' + artifactType + '/update', // Should be changed according to artifact types
            success:function(data,textStatus){
                var selector = 'td.editing[data-id="' + id + '"][data-field="' + field + '"]';
                $(selector).empty();
                $(selector).text(value);
                $(selector).removeClass('editing').addClass('editable');
                $('.message').remove();
                $('h1:first').after('<div class="message">Updated ' + field + ' (ID:' + id + ')</div>');
            },
            error:function(XMLHttpRequest,textStatus,errorThrown){
                alert("Error: " + errorThrown);
            }
        });
    }
}
