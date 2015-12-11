$('#selectElementId').change(
    function(){
         $(this).closest('form').trigger('submit');
         /* or:
         $('#formElementId').trigger('submit');
            or:
         $('#formElementId').submit();
         */
});



$('#email').val('');
