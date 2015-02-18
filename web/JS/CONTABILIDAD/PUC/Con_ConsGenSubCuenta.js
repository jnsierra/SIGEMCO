function busGrupo(clas_clas){
    document.getElementById('claseBusca').value = clas_clas;
    document.getElementById('buscaCuentasXGrup').submit();
}
function guardarScuenta(calse,grupo,cuenta){
    document.getElementById("clase").value=calse;
    document.getElementById("grupo").value=grupo;
    document.getElementById("cuenta").value=cuenta;
    var nombre = document.getElementById("nombre").value;
    var descripcion = document.getElementById("descripcion").value;
    //$('#sbcu_nombreEnvio').val(nombre);
    //$('#sbcu_descripcionEnvio').val(descripcion);
    document.getElementById("sbcu_nombreEnvio").value=nombre;
    document.getElementById("sbcu_descripcionEnvio").value=descripcion; 
    //document.getElementById("insertSubCuenta").submit();
}


