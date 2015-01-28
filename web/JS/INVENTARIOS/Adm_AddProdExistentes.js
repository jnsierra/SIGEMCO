$(function() {
    $(document).tooltip({
        hide: {
            effect: "explode",
            delay: 250
        },
        show:{
            effect: "slideDown",
            delay: 250
        },
    });
});

function buscarProductoIndividual() {
    document.getElementById("inv_consPrIndAddExistente").submit();
}

function cambioMovimento(valor){
    ajaxBuscaCodMovInventario(valor, '1');
}

function postAjax(valor, opcion){
    if(opcion == '1'){
        valor = eliminarEnter(valor);
        document.getElementById("natuMov").value = valor;
        evaluaValor(valor);
        
    }
}

function evaluaValor(valor){
    if(valor == 'Egreso'){
        abrirDialogoInfo('Este movimiento es un egreso por tanto el costo del movimiento sera calculado por el sistema automaticamente');
        document.getElementsByName("addicionProd.costo")[0].value = '0';        
    }else if(valor == 'Ingreso'){
    }
    
}

function ingresoProducto(){
    document.getElementById("inv_addProdExstInv").submit();
    
}

function postDialogAc(id, dialog) {
    cerrarDialog(dialog);
}