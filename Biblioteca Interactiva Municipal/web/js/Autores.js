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
                  url:"GetAutores",
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
    row2.append($('<th colspan="3">Asignaturas existentes en el sistema<b></b></th>'));
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
    row.append($('<td><button type="button" class="btn btn-danger" onclick="eliminarAsig(' + rowData.id + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>'));
    //row.append($('<td><button type="button" class="btn btn-danger" onclick="deshabilitarLibro('+rowData.id+');">'+'del'+'</button></td>'));          
}

function levantarModal(id, nombre){
    $("#myModalAutor").modal();
    $("#nombre").val(nombre);
    $("#AsigId").val(id);
}

function modificarAsig(){
    var asig_id = $("#AsigId").val();
    var asig_nom = $("#nombre").val();
    var datos = {id:asig_id,nombre:asig_nom};
    $.ajax({type: "POST", 
            url:"ModificarAsig",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                actualizarTabla(datos);
              },
            error: function(status){
                   window.alert("Ha ocurrido un error al modificar asignatura");
                   $("#myModalAsignatura").modal("hide");
            }
    });
}

function eliminarAsig(id){
    if(confirm("¿Seguro que desea eliminar la Asignatura?")){
    var datos = {id:id};
    $.ajax({type: "POST", 
            url:"EliminarAsig",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                eliminarFila(datos);
              },
            error: function(status){
                   window.alert("Esta asignatura no se puede eliminar debido a que esta ligada a otros libros");
                   $("#myModalAsignatura").modal("hide");
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
				'<td><button type="button" class="btn btn-danger" onclick="eliminarAsig(' + datos.id + ',' + '\'' + datos.nombre + '\'' + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>');
	$("#tablaAsignaturas").append(tr);    
}

function actualizarTabla(datos){
    eliminarFila(datos);
    agregarFila(datos);
    $("#myModalAsignatura").modal("hide");
}