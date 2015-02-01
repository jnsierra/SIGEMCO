var codigoProd;
var idProd;
$(function() {
    $('#parametrizar').on('click', function() {
        parametirzarPrecio(codigoProd,idProd);        
    });
    $('#actualizar').on('click', function() {
        actulizarEspecifico(idProd);
    });
});

function buscaGeneral() {
    document.getElementById("inv_consProdPorFiltrosGen").submit();
}
function actulizarEspecifico(valor) {
    document.getElementById('idProductoUpdate').value = valor;
    document.getElementById("inv_UpdProducto").submit();
}

function parametirzarPrecio(codigo,id) {
    document.getElementById('codigoParametriza').value = codigo;
    document.getElementById('idParametriza').value = id;
    document.getElementById('inv_BuscaProducto').submit();
}

function ejecutaAcciones(actualiza, parametriza, cod,id) {
    if (actualiza == 'N') {
        $('#actualizar').hide('fast');
    }
    if (parametriza == 'N') {        
        $('#parametrizar').hide('fast');
    }
    if(actualiza == 'S' || parametriza == 'S'){
        $('#dialogoAcciones').modal('show');
    } 
    codigoProd = cod;
    idProd = id;
}