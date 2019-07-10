/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function opcionDeshabilitarPerfil() {
    $.ajaxSetup({async: false});
    var user = JSON.parse(sessionStorage.getItem("usuario"));
    swal({
        title: "Está seguro?",
        text: "Una vez deshabilitado no podrá volver a acceder a su perfil",
        type: "warning",
        showConfirmButton: true,
        showCancelButton: true
    })
            .then((willDelete) => {

                if (willDelete) {
                    //if(confirm("¿Seguro que desea eliminar la Asignatura?")){    
                    $.ajax({
                        url: 'BuscarUsuarios',
                        data: {
                            accion: "modificarEstadoUsuario",
                            habilitado: 3,
                            identificacion: user.identificacion
                        },
                        error: function () {
                            swal('Error', 'Ha ocurrido un error al intentar deshabilitar su cuenta', 'error');
                        },
                        success: function (data) {
                            var tipoRespuesta = data.substring(0, 2);
                            if (tipoRespuesta === "C~") { //correcto
                                swal("Listo", "Su cuenta has sido deshabilitada", "success");
                                cerrar()
                            } else {
                                if (tipoRespuesta === "E~") { //error
                                    swal('Error', 'No se pudo deshabilitar su cuenta', 'error');
                                } else {
                                    swal('Error', 'No se pudo deshabilitar su cuenta', 'error');

                                }
                            }
                        },
                        type: 'POST'
                    });
                } else {
                    swal("Cancelado");
                }
            });
}

function cerrar(){
    var user = JSON.parse(sessionStorage.getItem("usuario"));
            if(user !== null){
                if(user.tipo===2){
                    $(".usuario").hide();
                    $(".usuarioR").hide();
                }
                if(user.tipo===1){
                    $(".administrador").hide();
                    $(".administradorR").hide();
                }
                $(".anonimo").show();
                $(".anonimoR").show();
                sessionStorage.removeItem("usuario");
                window.location.assign("http://localhost:15548/Biblioteca_Interactiva_Municipal/principal.jsp");
                //window.location.assign("http://192.170.10.176:8087/Biblioteca_Interactiva_Municipal/Principal");
            }
    
}