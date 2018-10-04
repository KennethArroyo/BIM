/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
});

$(document).ready(function() {
    $("#show_hide_password-verify a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password-verify input').attr("type") == "text"){
            $('#show_hide_password-verify input').attr('type', 'password');
            $('#show_hide_password-verify i').addClass( "fa-eye-slash" );
            $('#show_hide_password-verify i').removeClass( "fa-eye" );
        }else if($('#show_hide_password-verify input').attr("type") == "password"){
            $('#show_hide_password-verify input').attr('type', 'text');
            $('#show_hide_password-verify i').removeClass( "fa-eye-slash" );
            $('#show_hide_password-verify i').addClass( "fa-eye" );
        }
    });
});

var password = document.getElementById("contrasena")
  , confirm_password = document.getElementById("verificacontrasena"),
          correo = document.getElementById("correo");

function validarClave(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Las contraseñas no coinciden");
  } else {
    confirm_password.setCustomValidity('');
  }
}

function validarCorreo(email) 
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function validarFormatoCorreo(){
    if(!validarCorreo(correo.value)) {
        correo.setCustomValidity("El formato del correo es invalido");
    }
    else 
        correo.setCustomValidity('');
}

correo.onkeyup = validarFormatoCorreo;
password.onchange = validarClave;
confirm_password.onkeyup = validarClave;

