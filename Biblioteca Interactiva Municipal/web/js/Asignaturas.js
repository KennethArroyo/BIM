/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
   inicializar();
});


function inicializar(){
        var t = $('#mydata').DataTable({
//                dom: 'Bfrtip',
//        buttons: [
//            {
//                text: 'Agregar Asignatura',
//                action: function ( e, dt, node, config ) {
//                    $("#myModalAsignatura").modal();
//                }
//            }
//        ],  
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ asignaturas",
        "sZeroRecords":   "No se encontraron asignaturas",
        "sEmptyTable":    "Ninguna asignatura disponible en esta tabla",
        "sInfo":          "Mostrando _END_ asignatura(s) de un total de _TOTAL_ asignatura(s)",
        "sInfoEmpty":     "No hay asignaturas disponibles",
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
        url: "GetAsignaturas",
        success:
                function (obj) {
                    dibujarTabla(obj);
                },
        error: function (status) {
            //window.alert("Ha ocurrido un error con la lista de asignaturas");
            swal("Error", "Ha ocurrido un error con la lista de asignaturas", "error");
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
    t.row.add([rowData.nombre, '<button type="button" class="btn btn-danger" onclick="eliminarAsig('+rowData.id+');">'+ '<img src="imagenes/delete.png"/>' + '</button>']).draw();
}
}

function levantarModal(id, nombre) {
    $("#myModalAsignatura").modal();
    $("#nombre").val(nombre);
    $("#AsigId").val(id);
}

function modificarAsig() {
    var asig_id = $("#AsigId").val();
    var asig_nom = $("#nombre").val();
    var datos = {id: asig_id, nombre: asig_nom};
    $.ajax({type: "POST",
        url: "ModificarAsig",
        dataType: "json",
        data: datos,
        success:
                function (status) {

                    inicializar();
                },
        error: function (status) {
            swal("Error","Ha ocurrido un problema al modificar la asignatura","error");
            $("#myModalAsignatura").modal("hide");
        }
    });
}


function eliminarAsig(id) {
    swal({
        title: "Está seguro?",
        text: "Una vez eliminada no podrá volver a utilizarla",
        type: "warning",
        showConfirmButton: true,
        showCancelButton: true
    })
            .then((willDelete) => {

                if (willDelete) {
                    //if(confirm("¿Seguro que desea eliminar la Asignatura?")){    
                    var datos = {id: id};
                    $.ajax({type: "POST",
                        url: "EliminarAsig",
                        dataType: "json",
                        data: datos,
                        success:
                                function (status) {
                                    swal("Listo!", "La asignatura ha sido eliminada", "success");
                                    $("#mydata").DataTable().destroy();
                                    inicializar();
                                },
                        error: function (status) {
                            swal("Info","Esta asignatura no se puede eliminar debido a que esta ligada a otros libros","info");
                            //window.alert("Esta asignatura no se puede eliminar debido a que esta ligada a otros libros");
                            $("#myModalAsignatura").modal("hide");
                        }
                    });
                } else {
                    swal("Cancelado");
                }
            });
    //}
}


function eliminarFila(datos) {
    var row = document.getElementById(datos.id);
    row.parentNode.removeChild(row);
}

function cancelar() {
    $("#myModalAsignatura").modal("hide");
}