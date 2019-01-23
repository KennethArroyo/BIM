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
    $.ajax({type: "GET", 
            url:"Iniciar",
            data:datos,
            success: 
              function(obj){
                usuarioFinal = obj;
                sessionStorage.setItem("usuario", JSON.stringify(usuarioFinal));
                window.location="http://localhost:8080/Biblioteca_Interactiva_Municipal/principal.jsp";
              },
            error: function(status){
                   window.alert("El usuario o la contraseña son inválidos");
              }                    
          }); 
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
                sessionStorage.clear();
                window.location="http://localhost:8080/Biblioteca_Interactiva_Municipal/principal.jsp";
            }
    
}