/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") === "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") === "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
     $("#contrasena, #verificacontrasena").keyup(validarClave);
});

$(document).ready(function() {
    $("#show_hide_password-verify a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password-verify input').attr("type") === "text"){
            $('#show_hide_password-verify input').attr('type', 'password');
            $('#show_hide_password-verify i').addClass( "fa-eye-slash" );
            $('#show_hide_password-verify i').removeClass( "fa-eye" );
        }else if($('#show_hide_password-verify input').attr("type") === "password"){
            $('#show_hide_password-verify input').attr('type', 'text');
            $('#show_hide_password-verify i').removeClass( "fa-eye-slash" );
            $('#show_hide_password-verify i').addClass( "fa-eye" );
        }
    });
});
  
  function validarClave(){
    var password = document.getElementById("contrasena");
    var confirm_password = document.getElementById("verificacontrasena");
    if(password.value !== confirm_password.value) {
      confirm_password.setCustomValidity("Las contraseñas no coinciden");
    } else {
      confirm_password.setCustomValidity('');
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