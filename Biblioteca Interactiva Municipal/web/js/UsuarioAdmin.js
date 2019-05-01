$(document).ready(function () {
    buscarUsuarioEnSesion();
});


function buscarUsuarioEnSesion() {
    var user = JSON.parse(sessionStorage.getItem("usuario"));
    $.ajax({
        url: 'ModificarUsuario',
        data: {
            accion: "BuscarUsuario",
            id: user.identificacion
        },
        error: function () {
            window.alert("error al obtener los datos del usuario");
        },
        success: function (data) {
            $("#correo").attr('readonly', 'readonly');
            $("#identificacion").val(data.identificacion);
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
            $("#lugar_residencia").val(data.lugar_residencia);
            $("#telefono").val(data.telefono);
            //$("#correo").val(data.correo);
//            $("#contrasena").val(data.contrasena);
            //$("#verificacontrasena").val(data.contrasena);
            $("#ref_trab_est").val(data.ref_trab_est);
        },
        type: 'POST',
        dataType: "json"
    });
}

function modificarUsuario(){
    $.ajax({
       url:'ModificarUsuario',
       data:{
           accion: "EditarUsuario",
           identificacion: $("#identificacion").val(),
           nombre: $("#nombre").val(),
           apellidos:$("#apellidos").val(),
           lugar_residencia:$("#lugar_residencia").val(),
           telefono:$("#telefono").val(),
           ref_trab_est:$("#ref_trab_est").val()           
       },
       error:function(){
           window.alert("error al modificar el usuario");
       },
       success: function(data){
           var tipoRespuesta = data.substring(0,2);
           if (tipoRespuesta === "C~") { //correcto
                        swal("Listo", "Se modificó el usuario correctamente", "success");
                        //window.alert("Se modificó el usuario correctamente");
                        window.location.assign("http://192.170.10.103/Biblioteca_Interactiva_Municipal/Principal");
                    } else {
                        if (tipoRespuesta === "E~") { //error
                            window.alert("No se pudo modificar el usuario");
                        }
                    }
       },
       type: 'POST'
    });
    
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


$(document).ready(function () {
    $(".dropdown-menu a")[0].click();
});

$(".dropdown-menu a ").click(function () {
    $(this).parents(".input-group").find('.btn').text($(this).text());
});


