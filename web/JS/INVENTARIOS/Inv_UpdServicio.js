$(function(){
});

function consultaServicio(){
    document.getElementById("subAccion").value = "consulta";
    document.getElementById("adm_updServicio").submit();
}

function manipulaBoton(valor){
    if(valor == 'Actualiza'){
        $('.spanConsulta').hide();
        $('.spanUpdate').show();
        document.getElementById("habitacion_numHabi").readOnly = "true";
    }else if(valor == 'Consulta'){
        $('.spanUpdate').hide();
        $('.spanConsulta').show();
        document.getElementById("habitacion_numHabi").readOnly = false;
    }
}

function actualizaServicio(){
    document.getElementById("subAccion").value = "actualizar";
    document.getElementById("adm_updServicio").submit();
}

function cleanForm(){
    document.getElementById("habitacion_numMaxPers").value = "";
    document.getElementById("habitacion_numMinPers").value = "";
    document.getElementById("habitacion_iva").value = "";
    document.getElementById("habitacion_bano").value = "-1";
    document.getElementById("habitacion_television").value = "-1";    
    document.getElementById("habitacion_cable").value = "-1";    
    document.getElementById("habitacion_numCamas").value = "";    
    document.getElementById("habitacion_camaAux").value = "-1";
}