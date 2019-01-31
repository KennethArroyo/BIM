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
            window.alert("error al buscar el usuario");
        },
        success: function (data) {
            $("#identificacion".atrr('readonly', 'readonly'));
            $("#correo".atrr('readonly', 'readonly'));

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
function consultarUsuarioById(idUsuario) {
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuarioById",
            idUsuario: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            ocultarModal("myModal");
            swal('Error', 'Se presento un error, contactar al administrador', 'error');
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administrador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se oculta el mensaje de espera
            ocultarModal("myModal");
            limpiarForm();
            //se muestra el formulario
            $("#myModalFormulario").modal();

            //************************************************************************
            //carga información del usuario en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#idUsuario").attr('readonly', 'readonly');

            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#usuarioAction").val("modificarUsuario");

            //se carga la información en el formulario
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);

            //carga de fecha
            var fechaNac = new Date(data.fechaNacimiento);
            var fechaTxtNac = fechaNac.getDate() + "/" + (fechaNac.getMonth() + 1) + "/" + fechaNac.getFullYear();
            $("#fechaNacimiento").data({date: fechaTxtNac});
            $("#fechaNacimientoTxt").val(fechaTxtNac);

            $("#direccion").val(data.direccion);
            $("#telefono").val(data.telefonoTrabajo);
            $("#correo").val(data.correoElectronico);
            $("#idUsuario").val(data.idUsuario);
            $("#contrasena").val(data.contrasena);
            $("#tipoUsuario").val(data.tipoUsuario);
            $("#idUltUsuario").val(data.ultimoUsuario);

            var fechaNac2 = new Date(data.ultimaFecha);
            var fechaTxtNac2 = fechaNac2.getDate() + "/" + (fechaNac2.getMonth() + 1) + "/" + fechaNac2.getFullYear();
            $("#ultFechModif").data({date: fechaTxtNac2});
            $("#ultFechModifTxt").val(fechaTxtNac2);
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

