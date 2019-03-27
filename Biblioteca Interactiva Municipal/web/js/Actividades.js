/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    inicializar();
});

function inicializar(){
        var t = $('#mydata').DataTable({
        "lengthMenu": [[ 10, 25, 50, -1 ],[ 'Mostrar 10 datos', 'Mostrar 25 datos', 'Mostrar 50 datos', 'Todos los datos' ]],
        dom: 'Bfrtip',
        "buttons": [
            'pageLength'
        ],
        "language": {
        "buttons": {
            pageLength: {
                _: "Mostrar %d datos",
                '-1': "Todos"
            }
        },
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ actividades",
        "sZeroRecords":   "No se encontraron actividades",
        "sEmptyTable":    "Ninguna actividad disponible en esta tabla",
        "sInfo":          "Mostrando _END_ actividad(es) de un total de _TOTAL_ actividad(es)",
        "sInfoEmpty":     "No hay actividades disponibles",
        "sInfoFiltered":  "",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar Actividad:",
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
    
function buscar(){
    $.ajax({type: "GET", 
                  url:"BuscarAct",
                  success: 
                    function(obj){
                      dibujarTabla(obj);
                    },
                  error: function(status){
                         swal("Error", "Es posible que no hayan actividades registradas", "error");
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
    t.row.add([rowData.nombre, '<button type="button" class="btn btn-danger" onclick="eliminarAct(' + rowData.id + ');">' + '<img src="imagenes/remove.png"/>' + '</button>']).draw();
}
}


function eliminarAct(id){
    swal({
        title: "Está seguro?",
        text: "Una vez eliminada no podrá volver a utilizarla",
        type: "warning",
        showConfirmButton: true,
        showCancelButton: true
    })
    .then((willDelete) => {

                if (willDelete) {
    var datos = {id:id};
    $.ajax({type: "POST", 
            url:"EliminarAct",
            dataType: "json",
            data: datos,
            success: 
              function(status){ 
                  swal("Listo!", "La actividad ha sido eliminada", "success");
                  $("#mydata").DataTable().destroy();
                  inicializar();
              
              },
            error: function(status){
                   swal("Error", "Hubo un problema al eliminar la actividad", "error");
            }
    });
    } else {
                    swal("Cancelado");
                }
            });
}






