$(function() {
    $("#cliente_fechaNac").datepicker({
        changeMonth: true,
        changeYear: true,
        showWeek: true,
        yearRange: "1940:2000" 
        });
});

function postDialogAc(id, dialog) {
    cerrarDialog(dialog);
}

function inicio() {
    var cedula = document.getElementById('cliente_cedula').value;
    if (cedula == '') {
        abrirDialogoInfo('El campo cedula no puede ser nulo');
    } else {
        document.getElementById("Fac_consCliente").submit();
    }
}

function insertar() {
    document.getElementById("Fac_nuevoCliente").submit();
}


