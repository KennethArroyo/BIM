/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    swal("Info","Una vez registrado, se le enviará a su correo un código para verificar su cuenta","info");
});
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

var password = document.getElementById("contrasena")
  , confirm_password = document.getElementById("verificacontrasena"),
          correo = document.getElementById("correo"),
          identificacion = document.getElementById("identificacion");

function validarClave(){
  if(password.value !== confirm_password.value) {
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

function validarIdentificacionNac(identificacion) {
    var re = /[0-9]{9}/;
}

function validarIdentificacionExt(identificacion) {
    var re = /[0-9]{12}/;
}


function validarFormatoIdentificacion() {
    if(!validarIdentificacionNac(identificaion.value) || !validarIdentificacionExt(identificaion.value)){
        identificacion.setCustomValidity("El formato de la Identificación es invalida");
    }
}

function validarFormatoCorreo(){
    if(!validarCorreo(correo.value)) {
        correo.setCustomValidity("El formato del correo es invalido");
    }
    else 
        correo.setCustomValidity('');
}


$(function() {
    var createAllErrors = function() {
        var form = $(this);
        var errorList = $('ul.errorMessages', form);
        
        var showAllErrorMessages = function() {
            errorList.empty();
            
            //Find all invalid fields within the form.
            form.find(':invalid').each(function(index, node) {

                //Find the field's corresponding label
                var label = $('label[for=' + node.id + ']');

                //Opera incorrectly does not fill the validationMessage property.
                var message = node.validationMessage || 'Invalid value.';
                errorList
                    .show()
                    .append('<li><span>' + label.html() + '</span> ' + message + '</li>');
            });
        };
        
        $('input[type=submit], button', form).on('click', showAllErrorMessages);
        $('input[type=text]', form).on('keypress', function(event) {
            //keyCode 13 is Enter
            if (event.keyCode == 13) {
                showAllErrorMessages();
            }
        });
    };
    
    $('form').each(createAllErrors);
});


$(document).ready(function() {  
   $(".dropdown-menu a")[0].click();
});

    $(".dropdown-menu a ").click(function(){
                $(this).parents(".input-group").find('.btn').text($(this).text());
            });

correo.onkeyup = validarFormatoCorreo;
password.onchange = validarClave;
confirm_password.onkeyup = validarClave;

