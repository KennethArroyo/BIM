$(document).ready(function () {
   buscarUsuarioEnSesion();
});


function buscarUsuarioEnSesion() {
    $.ajax({
        url: 'UsuarioEnSesion',
        data: {
            accion: "EditarUsuario"
        },
        error: function () {
            window.alert("error al obtener los datos del usuario");
        },
        success: function (data) {
            $("#identificacion").val(data.identificacion);
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
            $("#lugar_residencia").val(data.lugar_residencia);
            $("#telefono").val(data.telefono);
            $("#correo").val(data.correo);
            $("#ref_trab_est").val(data.ref_trab_est);
        },
        type: 'POST',
        dataType: "json"
    });
}


$(document).ready(function () {
    $("#show_hide_password a").on('click', function (event) {
        event.preventDefault();
        if ($('#show_hide_password input').attr("type") == "text") {
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass("fa-eye-slash");
            $('#show_hide_password i').removeClass("fa-eye");
        } else if ($('#show_hide_password input').attr("type") == "password") {
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass("fa-eye-slash");
            $('#show_hide_password i').addClass("fa-eye");
        }
    });
});

$(document).ready(function () {
    $("#show_hide_password-verify a").on('click', function (event) {
        event.preventDefault();
        if ($('#show_hide_password-verify input').attr("type") == "text") {
            $('#show_hide_password-verify input').attr('type', 'password');
            $('#show_hide_password-verify i').addClass("fa-eye-slash");
            $('#show_hide_password-verify i').removeClass("fa-eye");
        } else if ($('#show_hide_password-verify input').attr("type") == "password") {
            $('#show_hide_password-verify input').attr('type', 'text');
            $('#show_hide_password-verify i').removeClass("fa-eye-slash");
            $('#show_hide_password-verify i').addClass("fa-eye");
        }
    });
});

var password = document.getElementById("contrasena")
        , confirm_password = document.getElementById("verificacontrasena"),
        correo = document.getElementById("correo"),
        identificacion = document.getElementById("identificacion");

function validarClave() {
    if (password.value != confirm_password.value) {
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
    if (!validarIdentificacionNac(identificaion.value) || !validarIdentificacionExt(identificaion.value)) {
        identificacion.setCustomValidity("El formato de la Identificación es invalida")
    }
}

function validarFormatoCorreo() {
    if (!validarCorreo(correo.value)) {
        correo.setCustomValidity("El formato del correo es invalido");
    } else
        correo.setCustomValidity('');
}

$(document).ready(function () {
    $(".dropdown-menu a")[0].click();
});

$(".dropdown-menu a ").click(function () {
    $(this).parents(".input-group").find('.btn').text($(this).text());
});

correo.onkeyup = validarFormatoCorreo;
password.onchange = validarClave;
confirm_password.onkeyup = validarClave;
