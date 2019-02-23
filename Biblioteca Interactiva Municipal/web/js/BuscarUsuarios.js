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
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ usuarios",
        "sZeroRecords":   "No se encontraron usuarios",
        "sEmptyTable":    "Ningún usuario disponible en esta tabla",
        "sInfo":          "Mostrando _END_ usuario(s) de un total de _TOTAL_ usuario(s)",
        "sInfoEmpty":     "No hay libros disponibles",
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
    buscarTodosUsuarios();
    
    function buscarTodosUsuarios() {
    $.ajax({
        url: 'BuscarUsuarios',
        data: {
            accion: "buscarTodosUsu"
        },
        error: function () {
           swal("Error", "No se pudieron cargar los Usuarios", "error");
        },
        success: function (data) {
            dibujarTabla(data);
        },
        type: 'POST',
        dataType: "json"

    });
}  
    
function dibujarTabla(dataJson) {
    t.clear().draw();
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    var hab;
    if(rowData.habilitado===1){hab="Sí";}
    else if(rowData.habilitado===0){hab="No";}
    t.row.add([rowData.identificacion, rowData.nombre, rowData.apellidos, rowData.lugar_residencia, rowData.telefono, rowData.correo, rowData.ref_trab_est, hab]).draw();

}
}



