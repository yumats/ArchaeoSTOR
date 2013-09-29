function doSubmit() {
    var num = parseInt($('input#id').val());
    if (isNaN(num)) {
        $('.errors').remove();
        $('h1:first').after('<div class="errors"><ul><li>ID must be a number.</li></ul></div>');
    }
    else {
        $('input[type="submit"]').click();
    }
}
