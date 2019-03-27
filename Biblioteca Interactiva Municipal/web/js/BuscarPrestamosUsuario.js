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
"lengthMenu": [[ 10, 25, 50, -1 ],[ 'Mostrar 10 datos', 'Mostrar 25 datos', 'Mostrar 50 datos', 'Todos los datos' ]],
        dom: 'Bfrtip',
        "buttons": [
            'pageLength',
            {extend:'excel', text:'Exportar Excel'},
            {extend:'pdf', text:'Exportar PDF'}
        ],
        "language": {
        "buttons": {
            pageLength: {
                _: "Mostrar %d datos",
                '-1': "Todos"
            }
        },
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ prestamos",
            "sZeroRecords": "No se encontraron prestamos",
            "sEmptyTable": "Ningún prestamo disponible en esta tabla",
            "sInfo": "Mostrando _END_ prestamo(s) de un total de _TOTAL_ prestamo(s)",
            "sInfoEmpty": "No hay prestamos disponibles",
            "sInfoFiltered": "",
            "sInfoPostFix": "",
            "sSearch": "Buscar Préstamo:",
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
    function tituloLibro(row){
        var titulo = row.libro.titulo;
        return titulo;
    }
    function dibujarFila(rowData) {
        var est;
        if (rowData.estado_ID === 1) {
            est = "Solicitado";
        } 
        else if (rowData.estado_ID === 2) {
            est = "Prestado";
        }
        else if (rowData.estado_ID === 3) {
            est = "Devuelto";
        }
        //var titulo = tituloLibro(rowData);
        t.row.add([rowData.fecha_inicio, rowData.fecha_final, rowData.libro_ID, est]).draw();
    }
}