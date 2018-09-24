/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var info = [];
var max;
var min;
var inicio;

    
function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaLibros").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaLibros").append(head);
    //row.append($("<th>ID<b></b></th>"));
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
    row.append($("<th>EDITAR<b></b></th>"));
    row.append($("<th>HAB/DESHAB<b></b></th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona

    var row = $("<tr/>");
    $("#tablaLibros").append(row);
    //row.append($("<td>" + rowData.id + "</td>"));
    row.append($("<td>" + rowData.clasificacion + "</td>"));
    row.append($("<td>" + rowData.autor + "</td>"));
    row.append($("<td>" + rowData.titulo + "</td>"));
    row.append($("<td>" + rowData.estado + "</td>"));
    row.append($("<td>" + rowData.comentario + "</td>"));
    row.append($("<td>" + rowData.cantidad_copias + "</td>"));
    row.append($("<td>" + rowData.fisico + "</td>"));
    row.append($("<td>" + rowData.digital + "</td>"));
    row.append($("<td>" + rowData.dir_portada + "</td>"));
    row.append($("<td>" + rowData.dir_PDF + "</td>"));
    row.append($("<td>" + rowData.habilitado + "</td>"));
    row.append($("<td>" + rowData.asignatura.id + "</td>"));
    row.append($('<td><button type="button" class="btn btn-info" onclick="consultarLibroId('+rowData.id+');">'+'<img src="imagenes/lead_pencil.png"/>'+'</button></td>'));
    row.append($('<td><button type="button" class="btn btn-danger" onclick="deshabilitarLibro('+rowData.id+');">'+'del'+'</button></td>'));          

}

function buscar(){
   var tipo = $("#selectBuscar").val();
   var name = $("#textobuscar").val();
   // buscarLibroAutor(name);
    if(tipo === "autor"){
    buscarLibroAutor(name);
    }
    else
       if(tipo === "titulo"){
           buscarLibroTitulo(name);
       }
   else
       if(tipo === "clasificacion"){
           buscarLibroClasificacion(name);
       }
   else
     if(tipo === "asignatura"){
           buscarLibroAsignatura(name);
       }
   else{
       window.alert("1-error");
   }
}
function consultarLibroId(idLibro){
    
}

function deshabilitarLibro(idLibro){
    
}

function  buscarLibroAutor(nombre) {
    //var name = document.getElementById("textoBuscar").value;
    //var name = $("#textobuscar").value;
    $.ajax({
        url: "BuscarLibro",        
        data:{
            accion:"buscarLibroAutor",
            nombre:nombre
        },
        
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function(data){
               dibujarTabla(data);
            
        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroClasificacion(name) {
    //var name = $("textobuscar").value;
    $.ajax({
        url: "BuscarLibro",        
        data:{
            accion:"buscarLibroClasificacion",
            nombre:name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function(data){
               dibujarTabla(data);
            
        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroTitulo(name) {
    //var name = $("textobuscar").value;
    $.ajax({
        url: "BuscarLibro",        
        data:{
            accion:"buscarLibroTitulo",
            nombre:name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function(data){
               dibujarTabla(data);
            
        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroAsignatura(name) {
    //var name = $("textobuscar").value;
    $.ajax({
        url: "BuscarLibro",        
        data:{
            accion:"buscarLibroAsignatura",
            nombre:name
        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
        },
        success: function(data){
               dibujarTabla(data);
            
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

function BuscarLibro(){
    var name = $("textobuscar").val();
    var a="autor";
    var t="titulo";
    var c="clasificacion";
    var as="asignatura";
    if(name===a){
        
    }
    buscarLibroAutor(name);
}