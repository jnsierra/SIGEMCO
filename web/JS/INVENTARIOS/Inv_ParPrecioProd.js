function consultarProd(){
    document.getElementById('inv_BuscaProducto').submit();
}

function cleanForm(){
    document.getElementById("producto_codigo").value = '';
}

function insertarParametro(){
    document.getElementById('inv_ParamPrecioPr').submit();
}

function despuesEnter(){
    consultarProd();
}