function buscaGeneral() {
    document.getElementById("inv_consProdPorFiltrosGen").submit();
}
function actulizarEspecifico(valor) {
    document.getElementsByClassName("idProductoUpdate")[0].value = valor;
    document.getElementById("inv_UpdProducto").submit();

}

function parametirzarPrecio(codigo){
    document.getElementById('inv_BuscaProducto_producto_codigo').value = codigo;
    document.getElementById('inv_BuscaProducto').submit();
}