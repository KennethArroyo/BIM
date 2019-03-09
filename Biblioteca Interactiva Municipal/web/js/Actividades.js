/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function getActividades(){  
            buscar();
            });


function buscar(){
    $.ajax({type: "GET", 
                  url:"BuscarActividad",
                  success: 
                    function(obj){
                      dibujarTabla(obj);
                    },
                  error: function(status){
                         window.alert("Es posible que no existan actividades");
                    }                    
                }); 
}

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaActividades").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead class='thead-dark'/>");
    var row = $("<tr />");
    head.append(row);
    $("#tablaActividades").append(head);
    row.append($("<th>NOMBRE<b></b></th>"));
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
    $("#tablaActividades").append(row);
    row.append($('<td>' + rowData.nombre + '</td>'));
    row.append($('<td><button type="button" class="btn btn-danger" onclick="eliminarAct(' + rowData.id + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>'));
    //row.append($('<td><button type="button" class="btn btn-danger" onclick="deshabilitarLibro('+rowData.id+');">'+'del'+'</button></td>'));          
}


function eliminarAct(id){
    if(confirm("¿Seguro que desea eliminar la Actividad?")){
    var datos = {id:id};
    $.ajax({type: "POST", 
            url:"EliminarAct",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                eliminarFila(datos);
              },
            error: function(status){
                   window.alert("Ocurrio un error al eliminar la actividad");
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
				'<td><button type="button" class="btn btn-danger" onclick="eliminarAct(' + datos.id + ',' + '\'' + datos.nombre + '\'' + ');">' + '<img src="imagenes/remove.png"/>' + '</button></td>');
	$("#tablaActividades").append(tr);    
}


