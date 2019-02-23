/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    inicializar();
});

function inicializar() {
    var t = $('#mydataPrestamo').DataTable({
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ prestamos",
            "sZeroRecords": "No se encontraron prestamos",
            "sEmptyTable": "Ningún prestamo disponible en esta tabla",
            "sInfo": "Mostrando _END_ prestamo(s) de un total de _TOTAL_ prestamo(s)",
            "sInfoEmpty": "No hay prestamos disponibles",
            "sInfoFiltered": "",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });

    buscarPrestamosUser();

    function buscarPrestamosUser() {
        var user = JSON.parse(sessionStorage.getItem("usuario"));
        $.ajax({
            url: 'BuscarPrestamos',
            data: {
                accion: "BuscarPrestamosUser",
                identificacion: user.identificacion
            },
            error: function () {
                swal("Error", "No se pudieron cargar los préstamos", "error");
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
        var est;
        if (rowData.estado_ID === 0) {
            est = "solicitado";
        } else
        if (rowData.estado_ID === 1) {
            est = "prestado";
        } else
        if (rowData.estado_ID === 2) {
            est = "devuelto";
        }
        t.row.add([rowData.fecha_inicio, rowData.fecha_final, rowData.usuario_ID, rowData.libro_ID, est]).draw();
    }
}