/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var info = [];
var max;
var min;
var inicio;
$(function(){
    $("#buscar").click(function () {
        buscar();
    });
});
$(document).ready(function(){
});
function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaLibros").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaLibros").append(head);
    row.append($("<th>ID<b></b></th>"));
    row.append($("<th>CLASIFICACION<b></b></th>"));
    row.append($("<th><b>AUTOR</b></th>"));
    row.append($("<th><b>TITULO</b></th>"));
    row.append($("<th><b>ESTADO</b></th>"));
    row.append($("<th><b>COMENTARIO</b></th>"));
    row.append($("<th>CANTIDAD COPIAS<b></b></th>"));
    row.append($("<th>FISICO<b></b></th>"));
    row.append($("<th>DIGITAL<b></b></th>"));
    row.append($("<th>DIR PORTADA<b></b></th>"));
    row.append($("<th><b>DIR PDF</th>"));
    row.append($("<th>HABILITADO<b></b></th>"));
    row.append($("<th>ASIGNATURA ID<b></b></th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(page,rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona

    var row = $(page);
    $("#tablaLibros").append(row);
    row.append($("<td>" + rowData.id + "</td>"));
    row.append($("<td>" + rowData.clasificacion + "</td>"));
    row.append($("<td>" + rowData.autor + "</td>"));
    row.append($("<td>" + rowData.titulo + "</td>"));
    row.append($("<td>" + rowData.estado + "</td>"));
    row.append($("<td>" + rowData.comentario + "</td>"));
    row.append($("<td>" + rowData.cantidad_copias + "</td>"));
    row.append($("<td>" + rowData.fisico + "</td>"));
    row.append($("<td>" + rowData.digital + "</td>"));
    row.append($("<td>" + rowData.dir_Portada + "</td>"));
    row.append($("<td>" + rowData.dir_PDF + "</td>"));
    row.append($("<td>" + rowData.habilitado + "</td>"));
    row.append($("<td>" + rowData.asignatura_ID + "</td>"));

}


function  buscarLibroAutor(autor) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "buscarLibroAutor",
            autor:autor
        },
        error: function () { //si existe un error en la respuesta del ajax
            ocultarModal("myModal");
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) {
            ocultarModal("myModal");
            $('#id').val(data.id);
            $('#clasificacion').val(data.clasificacion);
            $('#autor').val(data.autor);
            $('#titulo').val(data.titulo);
            $('#estado').val(data.estado);
            $('#comentario').val(data.comentario);
            $('#cantidad_copias').val(data.cantidad_copias);
            $('#fisico').val(data.fisico);
            $('#digital').val(data.digital);
            $('#dir_Portada').val(data.dir_Portada);
            $('#dir_PDF').val(data.dir_PDF);
            $('#habilitado').val(data.habilitado);
            $('#asignatura_ID').val(data.asignatura_ID);


        },
        type: 'POST',
        dataType: "json"
    });
}

function mostrarMensaje(classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#mesajeResult").removeClass();

    //se setean los estilos
    $("#mesajeResult").addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#mesajeResult").fadeIn("slow");
    $("#mesajeResultNeg").html(neg);
    $("#mesajeResultText").html(msg);
    $("#mesajeResultText").html(msg);
}

function buscar(){
    var name = document.buscarLibroAutor("textoBuscar").value;
    buscarLibroAutor(name);
}