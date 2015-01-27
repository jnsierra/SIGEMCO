$(function() {
    $('.input-group.date').datepicker({
        format: 'mm/dd/yyyy'
    });
});

function buscaGeneral(){
    document.getElementById('inv_consRemPorFiltrosGen').submit();
}
