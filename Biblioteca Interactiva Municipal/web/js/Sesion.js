/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global usuarioFina*/
var usuarioFinal = null;

function iniciar(){
    var usuario = $("#usuario").val();
    var contrasena = $("#contrasena").val();
    var datos = {usuario:usuario,contrasena:contrasena};
    if(usuario.length !== 0 && contrasena.length !==0 ){
    $.ajax({type: "POST", 
            url:"Iniciar",
            dataType: "json",
            data:datos,
            success: 
              function(obj){
                usuarioFinal = obj;
                sessionStorage.setItem("usuario", JSON.stringify(usuarioFinal));
                window.location.assign("Principal");
              },
            error: function(status){
                    if(status.status===405){
                        
                        swal("Info", "Este usuario debe ser verificado, favor revisar su correo", "info");
                        //window.location.assign("http://192.170.10.176:8087/Biblioteca_Interactiva_Municipal/verificarCuenta.jsp");
                        window.location.assign("localhost:80083/Biblioteca_Interactiva_Municipal/verificarCuenta.jsp");

                }else
                        if(status.status===406){
                            swal("Error", "Su usuario fue deshabilitado, contacte con el administrador", "error");
                        }
                    else
                        swal("Error", "El usuario o la contaseña son incorrectos", "error");
              }                    
          }); 
      }
      else{
          return false;
      }
}

function levantarModal(id, nombre){
    $("#myModalRecuperar").modal();
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
                window.location.assign("http://localhost:8080/Biblioteca_Interactiva_Municipal/principal.jsp");
                //window.location.assign("http://192.170.10.176:8087/Biblioteca_Interactiva_Municipal/Principal");
            }
    
}

function enviarCorreo(){
    var correoUs = $("#correo").val();
    if(correoUs.length !== 0){
    var datos = {correo:correoUs}; 
    $.ajax({type: 'POST',
            url:"SolicitudCambiar",
            datatype: 'json',
            data:datos,
            success: 
              function(status){
                  swal('Info', 'Se ha enviado un codigo temporal a su correo electrónico necesario para cambiar su contraseña', 'info');
                  //window.location.assign("localhost:8080/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp");
                  //window.location.assign("http://192.170.10.176:8087/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp");
                  //window.alert("Correo enviado");
              },
              error:
                function(status){
                    if(status.status === 200){
                        swal('Info', 'Se ha enviado un codigo temporal a su correo electrónico necesario para cambiar su contraseña', 'info');
                        window.location.assign("http://192.170.10.176:8087/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp");
                    }
                    else    
                        swal('Error', 'Se ha producido un error al enviar el correo', 'error');
                }
          }); 
      }
}

$(function () {
    $("#cancelar2").click(function () {
        $("#myModalRecuperar").modal("hide");
    });
    });