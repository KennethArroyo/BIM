/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function getAutores() {
    inicializar();
});


function inicializar(){
        var t = $('#mydata').DataTable({
//                dom: 'Bfrtip',
//        "buttons": [
//            {
//                text: 'Agregar Asignatura',
//                action: function ( e, dt, node, config ) {
//                    $("#myModalAsignatura").modal();
//                }
//            }
//        ],  
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ autores",
        "sZeroRecords":   "No se encontraron autores",
        "sEmptyTable":    "Ninguna autor disponible en esta tabla",
        "sInfo":          "Mostrando _END_ autor(s) de un total de _TOTAL_ autor(s)",
        "sInfoEmpty":     "No hay autores disponibles",
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
    buscar();
    
    function buscar() {
    $.ajax({type: "GET",
        url: "BuscarAutores",
        success:
                function (obj) {
                    dibujarTabla(obj);
                },
        error: function (status) {
            swal('Error', 'Ha ocurrido un error con la lista de autores', 'error');
        }
    });
}
      
function dibujarTabla(dataJson) {
    t.clear().draw();
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    t.row.add([rowData.nombre,'<button type="button" class="btn btn-success" onclick="levantarModal('+ rowData.id + ',' + '\'' + rowData.nombre + '\'' + ');">'+ '<img src="imagenes/lead_pencil.png"/>' + '</button>' ,'<button type="button" class="btn btn-danger" onclick="eliminarAutor('+rowData.id+');">'+ '<img src="imagenes/delete.png"/>' + '</button>']).draw();
}
}

//buscara los ultimos 5 autores agregados

function agreAutor() {
    var aut_nom = $("#autor").val();
    var datos = {nombre: aut_nom};
    $.ajax({type: "POST",
        url: "AgregarAutor",
        dataType: "json",
        data: datos,
        success:
                function (status) {
                    swal("Listo!", "El autor ha sido agregado", "success");
                    $("#mydata").DataTable().destroy();
                    inicializar();
                },
        error: function (status) {
            //swal("Error!", "Es posible que el autor ya este agregado", "error");
            window.location.href = "http://localhost:8083/Biblioteca_Interactiva_Municipal/autores.jsp";
        }
    });
}


function levantarModal(id, nombre) {
    $("#myModalAutor").modal();
    $("#nombre").val(nombre);
    $("#AutorId").val(id);
}



function modificarAutor() {
    var asig_id = $("#AutorId").val();
    var asig_nom = $("#nombre").val();
    var datos = {id: asig_id, nombre: asig_nom};
    $.ajax({type: "POST",
        url: "ModificarAutor",
        dataType: "json",
        data: datos,
        success:
                function (status) {
                    actualizarTabla(datos);
                    $("#myModalAutor").modal("hide");
                },
        error: function (status) {
            swal("Error","Ha ocurrido un error al modificar el autor","error");
            $("#myModalAutor").modal("hide");
        }
    });
}


function eliminarAutor(id) {
    swal({
        title: "Está seguro?",
        text: "Una vez eliminado no podrá volver a utilizarla",
        type: "warning",
        showConfirmButton: true,
        showCancelButton: true
    })
            .then((willDelete) => {

                if (willDelete) {
                    var datos = {id: id};
                    $.ajax({type: "POST",
                        url: "EliminarAutor",
                        dataType: "json",
                        data: datos,
                        success:
                                function (status) {
                                    swal("Listo!", "El autor ha sido eliminado", "success");
                                    $("#mydata").DataTable().destroy();
                                    inicializar();
                                },
                        error: function (status) {
                            swal("Info", "Esta autor no se puede eliminar debido a que esta ligado a algunos libros", "info");
                            $("#myModalAutor").modal("hide");
                        }
                    });
                } else {
                    swal("Cancelado");
                }
            });
}

function cancelar() {
    $("#myModalAutor").modal("hide");
}