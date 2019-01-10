/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function getAutores(){  
            buscar();
            });

//buscara los ultimos 5 autores agregados
function buscar(){
    $.ajax({type: "GET", 
                  url:"BuscarAutores",
                  success: 
                    function(obj){
                      dibujarTabla(obj);
                    },
                  error: function(status){
                         window.alert("Ha ocurrido un error con la lista de autores");
                    }                    
                }); 
}

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaAutores").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead class='thead-dark'/>");
    var row = $("<tr />");
    var row2 = $("<tr />");
    head.append(row2);
    head.append(row);
    $("#tablaAutores").append(head);
    row2.append($('<th colspan="3">Últimos 5 autores agregados<b></b></th>'));
    row.append($("<th>NOMBRE<b></b></th>"));
    row.append($("<th>EDITAR<b></b></th>"));
    row.append($("<th>ELIMINAR<b></b></th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de un libro

    var row = $('<tr id='+rowData.id+'/>');
    $("#tablaAutores").append(row);
    row.append($('<td>' + rowData.nombre + '</td>'));
    row.append($('<td><button type="button" class="btn btn-info" onclick="levantarModal(' + rowData.id + ',' + '\'' + rowData.nombre + '\'' + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button></td>'));
    row.append($('<td><button type="button" class="btn btn-danger" onclick="eliminarAutor(' + rowData.id + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>'));
    //row.append($('<td><button type="button" class="btn btn-danger" onclick="deshabilitarLibro('+rowData.id+');">'+'del'+'</button></td>'));          
}

function levantarModal(id, nombre){
    $("#myModalAutor").modal();
    $("#nombre").val(nombre);
    $("#AutorId").val(id);
}

function modificarAutor(){
    var asig_id = $("#AutorId").val();
    var asig_nom = $("#nombre").val();
    var datos = {id:asig_id,nombre:asig_nom};
    $.ajax({type: "POST", 
            url:"ModificarAutor",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                actualizarTabla(datos);
                $("#myModalAutor").modal("hide");
              },
            error: function(status){
                   window.alert("Ha ocurrido un error al modificar el autor");
                   $("#myModalAutor").modal("hide");
            }
    });
}

function eliminarAutor(id){
    if(confirm("¿Seguro que desea eliminar el Autor?")){
    var datos = {id:id};
    $.ajax({type: "POST", 
            url:"EliminarAutor",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                eliminarFila(datos);
              },
            error: function(status){
                   window.alert("Esta autor no se puede eliminar debido a que esta ligado a otros libros");
                   $("#myModalAutor").modal("hide");
            }
    });
    }
}

function eliminarFila(datos){
    var row = document.getElementById(datos.id);
    row.parentNode.removeChild(row);
}

function agregarFila(datos){
var tr =$('<tr id='+datos.id+'/>');
	tr.html("<td>"+datos.nombre+"</td>"+
				'<td><button type="button" class="btn btn-info" onclick="levantarModal(' + datos.id + ',' + '\'' + datos.nombre + '\'' + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button></td>'+
				'<td><button type="button" class="btn btn-danger" onclick="eliminarAutor(' + datos.id + ',' + '\'' + datos.nombre + '\'' + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>');
	$("#tablaAutores").append(tr);    
}

function actualizarTabla(datos){
    eliminarFila(datos);
    agregarFila(datos);
    $("#myModalAsignatura").modal("hide");
}