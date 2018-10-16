/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$(function () {
//    //Genera el datepicker
//    $('#fechaInicio').datetimepicker({
//        weekStart: 1,
//        todayBtn: 1,
//        autoclose: 1,
//        todayHighlight: 1,
//        startView: 2,
//        minView: 2,
//        forceParse: 0
//    });
//        
//});

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaLibros").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead class='thead-dark'/>");
    var row = $("<tr />");
    head.append(row);
    $("#tablaLibros").append(head);
    row.append($("<th>CLASIFICACION<b></b></th>"));
    row.append($("<th><b>AUTOR</b></th>"));
    row.append($("<th><b>TITULO</b></th>"));
    row.append($("<th><b>ESTADO</b></th>"));
    row.append($("<th><b>COMENTARIO</b></th>"));
    row.append($("<th>CANTIDAD COPIAS<b></b></th>"));
    row.append($("<th>ASIGNATURA<b></b></th>"));
    row.append($("<th>PRÉSTAMO<b></b></th>"));
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    var row = $("<tr/>");
    $("#tablaLibros").append(row);
    row.append($("<td>" + rowData.clasificacion + "</td>"));
    row.append($("<td>" + rowData.autor + "</td>"));
    row.append($("<td>" + rowData.titulo + "</td>"));
    if (rowData.estado === 1) {
        row.append($("<td>" + "bueno" + "</td>"));
    } else
    if (rowData.estado === 2) {
        row.append($("<td>" + "regular" + "</td>"));
    } else

    if (rowData.estado === 3) {
        row.append($("<td>" + "malo" + "</td>"));
    }
    row.append($("<td>" + rowData.comentario + "</td>"));
    row.append($("<td>" + rowData.cantidad_copias + "</td>"));
    row.append($("<td>" + rowData.asignatura.nombre + "</td>"));
    row.append($('<td><button type="button" class="btn btn-info" onclick="buscarLibroId(' + rowData.id + ');">' + 'Solicitar Préstamo' + '</button></td>'));

}
function buscar() {
    var tipo = $("#selectBuscar").val();
    var name = $("#textobuscar").val();
    if (tipo === "autor") {
        buscarLibroAutor(name);
    } else
    if (tipo === "titulo") {
        buscarLibroTitulo(name);
    } else
    if (tipo === "clasificacion") {
        buscarLibroClasificacion(name);
    } else
    if (tipo === "asignatura") {
        buscarLibroAsignatura(name);
    } else
    if (tipo === "ident") {
        buscarLibroId(name);
    } else {
        window.alert("2-error");
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
            if(data.cantidad_copias>1){
            $("#myModalFormulario").modal();
            $("#prestamoAction").val("solicitarPrestamo");
            $("#idLibro").val(data.id);
            $("#cantidad").val(data.cantidad_copias);
        }
        else window.alert("El libro posee solo una copia, solo puede ser utilizado dentro de la biblioteca.");
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
            idLibro:$("#idLibro").val()
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

function validar(){
    if($("#cedUsuario").val()!==""){
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
                    window.alert("la cedula ingresada no existe");
                    $("#myModalFormulario").modal();
                },
                success: function (data) {
                    window.alert("Prestamo solicitado satisfactoriamente");
                },
                type: 'POST',
                dataType: "json"
            });
    
        
    }
    else{window.alert("Por favor ingresar una cedula");}
}


function cancelar() {
    limpiarForm();
    $("#myModalFormulario").modal("hide");
    //$("#tablaLibros").html("");
}

function limpiarForm() {
    //Resetear el formulario
    $('#forModal').trigger("reset");
}

