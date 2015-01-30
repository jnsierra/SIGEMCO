$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})
function soloNumeros(e){
	var evt = (evt) ? evt : window.event
	var charCode = (evt.which) ? evt.which : evt.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 44) {
		 event.returnValue = false;
	}else{
		return true
	}                              
}
function ingresarParametros(){
    document.getElementById("adm_paramgenerales").submit();
}