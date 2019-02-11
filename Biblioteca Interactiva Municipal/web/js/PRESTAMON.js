/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
var t = $('#mydata').DataTable({
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ libros",
        "sZeroRecords":   "No se encontraron libros",
        "sEmptyTable":    "Ningún libro disponible en esta tabla",
        "sInfo":          "Mostrando _END_ libro(s) de un total de _TOTAL_ libro(s)",
        "sInfoEmpty":     "No hay libros disponibles",
        "sInfoFiltered":  "",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
});
    buscarTodosLibros();
    
    function buscarTodosLibros() {
    $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "buscarTodos"
        },
        error: function () {
           swal("Error", "No se pudieron cargar los libros", "error");
        },
        success: function (data) {
            dibujarTabla(data);
        },
        type: 'POST',
        dataType: "json"

    });
}    
    
function dibujarTabla(dataJson) {
    t.clear().draw();
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    var est;
    if(rowData.estado===1){est="Bueno";}
    else if(rowData.estado===2){est="Regular";}
    else if(rowData.estado===3){est="Malo";}
    t.row.add([rowData.clasificacion, 'ARREGLAR AUTORES', rowData.titulo, est, rowData.comentario, rowData.cantidad_copias, rowData.asignatura.nombre, '<button type="button" class="btn btn-info" onclick="buscarLibroId(' + rowData.id + ');">' + 'Solicitar Préstamo' + '</button>']).draw();

}
});

$(document).ready(function inicializar() {
    var today = new Date().toISOString().split('T')[0];
    document.getElementsByName("fechaInicio")[0].setAttribute('min', today);
    //$("#myModalFormulario").modal({"backdrop": "static"});
});

function validarCed() {
    var us_id = $("#cedUsuario").val();
    $.ajax({
        url: "BuscarUsuario",
        data: {
            id: us_id
        },

        error: function () { //si existe un error en la respuesta del ajax
            $("#userLabel").remove();
            $("#user").remove();
            $("#VerUsuario").append('<label for="' + "user" + '" id="userLabel">Usuario:</label>' +
                    '<input class="form-control" disabled="disabled" id="user" name="user">');
            $("#user").val("El usuario no existe");
            return false;
        },
        success: function (data) {
            $("#userLabel").remove();
            $("#user").remove();
            $("#VerUsuario").append('<label for="' + "user" + '" id="userLabel" >Usuario:</label>' +
                    '<input class="form-control" disabled="disabled" id="user" name="user">');
            $("#user").val(data.nombre + " " + data.apellidos);
            return false;
        },
        type: 'POST',
        dataType: "json"
    });
}


function onClickDigital() {
    if ($("#digital").is(':checked')) {
        $("#libForm").append('<input type="file" name="file" class="file" id="file" required>');
    } else {
        $("#file").remove();
    }
}

function  buscarLibroAutor(nombre) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroAutor",
            nombre: nombre
        },

        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroClasificacion(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroClasificacion",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroTitulo(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroTitulo",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroAsignatura(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroAsignatura",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) {

            dibujarTabla(data);
        },
        type: 'POST',
        dataType: "json"
    });
}

function buscarLibroId(idLibro) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroId",
            idLibro: idLibro
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) {
            if (data.cantidad_copias > 1) {
                $("#myModalFormulario").modal();
                $("#prestamoAction").val("solicitarPrestamo");
                $("#idLibro").val(data.id);
                $("#cantidad").val(data.cantidad_copias);
                $("#libro").val(data.titulo);
                $("#libro").prop('disabled', true);
            } else
                window.alert("El libro posee solo una copia, solo puede ser utilizado dentro de la biblioteca.");
        },
        type: 'POST',
        dataType: "json"
    });
}

function solicitarPrestamo() {
    var num;
    $.ajax({
        url: 'CrearPrestamo',
        data: {
            accion: "solicitarPrestamo",
            fechaInicio: $("#fechaInicio").val(),
            idLibro: $("#idLibro").val()
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                window.alert("se realizo el prestamo correcatamente");
                $("#myModalFormulario").modal("hide");
            } else {
                if (tipoRespuesta === "E~") { //error
                    window.alert("2-error");
                } else {
                    window.alert("3-error");
                }
            }
        },
        type: 'POST'
    });
}

function validar() {
    if ($("#cedUsuario").val() !== "") {
        var id = $("#cedUsuario").val();
        var libro = $("#idLibro").val();
        var fecha = $("#fechaInicio").val();
        prestamo = {
            usuario_ID: id,
            libro_ID: libro,
            fecha_inicio: fecha
        };
        $.ajax({
            url: "CrearPrestamoUs",
            data: JSON.stringify(prestamo),
            error: function () { //si existe un error en la respuesta del ajax
                $("#myModalFormulario").modal("show");
                window.alert("*Prestamo solicitado satisfactoriamente*");
            },
            success: function (data) {
                window.alert("Prestamo solicitado satisfactoriamente");
            },
            type: 'POST',
            dataType: "json"
        });


    } else {
        window.alert("Por favor ingresar una cedula");
    }
}


function cancelar() {
    limpiarForm();
    $("#userLabel").remove();
    $("#user").remove();
    $("#myModalFormulario").modal("hide");
    //$("#tablaLibros").html("");
}

function limpiarForm() {
    //Resetear el formulario
    $('#forModal').trigger("reset");
}
