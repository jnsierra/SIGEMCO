$(function() {
    $('.input-group.date').datepicker({
        format: 'mm/dd/yyyy'
    });
    $('.muestraImei').hover(
            function() {
                $(this).next('span').show('slow');
            }
    );
    $('.muestraIccid').hover(
            function() {
                $(this).next('span').show('slow');
            }
    );
});

function buscaGeneral() {
    document.getElementById('inv_consRemPorFiltrosGen').submit();
}

function muestraIccid(){
    $('.iccid').show('slow');
}
function muestraImei(){
    $('.imei').show('slow');
}
