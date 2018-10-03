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

function validarCuenta(correo, codigo) {
    $.ajax({
        url: "verificarCuenta",
        data:{
            correo: $("#correo").val(),
            cod_verificacion: codigo
        },
        error: function() {
            window.alert("Ha ocurrido un error");
        },
        success: function(data){
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                window.alert("Se modificó el libro correctamente");
                $("#myModalFormulario").modal("hide");
                buscar();
            } else {
                if (tipoRespuesta === "E~") { //error
                    window.alert("2-error");
                } else {
                    window.alert("3-error");
                }
            }
        },
        type: 'POST',
        dataType: "json";
        
    });
    
}


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

