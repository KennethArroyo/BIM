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
            data:datos,
            success: 
              function(obj){
                usuarioFinal = obj;
                sessionStorage.setItem("usuario", JSON.stringify(usuarioFinal));
                window.location.assign("http://localhost:8080/Biblioteca_Interactiva_Municipal/principal.jsp");
              },
            error: function(status){
                    if(status.status===405){
                        window.alert("Este usuario debe ser verificado, favor revisar su correo");
                        window.location.assign("http://localhost:8080/Biblioteca_Interactiva_Municipal/verificarCuenta.jsp");
                    }
                    else
                        window.alert("El usuario o la contraseña son inválidos");
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
                if(user.tipo===0){
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
            }
    
}

function enviarCorreo(){
    var correoUs = $("#correo").val();
    if(correo.length !== 0){
    var datos = {correo:correoUs}; 
    $.ajax({type: "POST", 
            url:"SolicitudCambiar",
            data:datos,
            success: 
              function(obj){
                window.alert("Se ha enviado un código temporal a su correo electrónico \n\
                                necesario para cambiar su contraseña");
                window.location.assign("http://localhost:8080/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp");
              },
            error: function(status){
                        window.alert("Ha ocurrido un error al enviar el código temporal");
              }                    
          }); 
      }
}

function cambiarClave(){
    var temporal = $("#temporal").val();
    var contrasena = $("#contrasena").val();
    var datos = {temporal:temporal,contrasena:contrasena }; 
    $.ajax({type: "POST", 
            url:"Cambiar",
            data:datos,
            success: 
              function(obj){
                window.alert("Su contraseña ha sido modificada con éxito");
                window.location.assign("http://localhost:8080/Biblioteca_Interactiva_Municipal/inicioSesion.jsp");
              },
            error: function(status){
                        window.alert("Ha ocurrido un error al cambiar su contraseña");
              }                    
          }); 
    
}

function cancelar(){
    $("#myModalRecuperar").modal("hide");
}