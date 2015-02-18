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
    document.getElementById("sbcu_nombre").value=nombre;
    document.getElementById("sbcu_descripcion").value=descripcion; 
    document.getElementById("insertSubCuenta").submit();
}


