/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
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


function  buscarLibroAutor() {
    var name = $("textobuscar").val();
    var n = name;
    $.ajax({type: "GET",
        url: "buscarLibroAutor",
        data:JSON.stringify(n),
        dataType: "json",
        
        error: function (status) { //si existe un error en la respuesta del ajax
            window.alert("Error");
        },
        success: function dibujarTabla(data) {
            
        }
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

function BuscarLibro(){
    var name = $("textobuscar").val();
    buscarLibroAutor(name);
}