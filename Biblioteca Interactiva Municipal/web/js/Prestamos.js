/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
            $("#myModalFormulario").modal();
            //dibujarTabla(data);
            //buscarAsignaturaId(data.asignatura.id);
            $("#clasificacion").attr('readonly', 'readonly');
            $("#libroAction").val("modificarLibro");

            //$("#id").val(data.idLibro);
            $("#clasificacion").val(data.clasificacion);
            $("#titulo").val(data.titulo);
            $("#autor").val(data.autor);
            $("#comentario").val(data.comentario);
            $("#estado").val(data.estado);
            $("#copias").val(data.cantidad_copias);
            if (data.fisico === 1) {
                $("#fisico").prop('checked', true);
            } else {
                $("#fisico").prop('checked', false);
            }
            if (data.digital === 1) {
                $("#digital").prop('checked', true);
            } else {
                $("#digital").prop('checked', false);
            }
            //$("#asignatura").val(data.asignatura.nombre);
            buscarLibroAsignatura(data.asignatura);
            //buscar();
        },
        type: 'POST',
        dataType: "json"
    });
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