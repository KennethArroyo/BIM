/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    inicializar();
});

function inicializar() {
    var t = $('#mydataTodosPrestamo').DataTable({
        dom: 'Bfrtip',
        "buttons": [
            'excel', 'pdf'
        ],
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

    buscarTodosPrestamos();

    function buscarTodosPrestamos() {
        $.ajax({
            url: 'BuscarPrestamos',
            data: {
                accion: "BuscarTodosPrestamos"
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
    function tituloLibro(row) {
        var titulo = row.libro.titulo;
        return titulo;
    }
    function dibujarFila(rowData) {
        var est;
        if (rowData.estado_ID === 1) {
            est = "solicitado";
        } else if (rowData.estado_ID === 2) {
            est = "prestado";
        }else if (rowData.estado_ID === 3) {
            est = "devuelto";
        }
        t.row.add([rowData.usuario_ID, rowData.fecha_inicio, rowData.fecha_final, rowData.libro_ID, est, '<button type="button" class="btn btn-info" onclick="buscarPrestamoId(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();
    }
}

function buscarPrestamoId(id) {
    $.ajax({
        url: "BuscarPrestamos",
        data: {
            accion: "BuscarPrestamoId",
            id: id
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Ha ocurrido un error al cargar el prestamo', 'error');
        },
        success: function (data) {
            $("#myModalFormulario").modal();
            $("#Estadoaction").val("modificarEstadoPrestamo");
            $("#id").val(data.id);
            if (data.estado_ID === 1) {
                $("#estado").val(1);
            } else if (data.estado_ID === 2) {
                $("#estado").val(2);
            } else if (data.estado_ID === 3) {
                $("#estado").val(3);
            }

        },
        type: 'POST',
        dataType: "json"
    });
}

function modificarEstadoPrestamo() {
    $.ajax({
        url: 'BuscarPrestamos',
        data: {
            accion: "ModificarEstadoPrestamo",
            estado: $("#estado").val(),
            id: $("#id").val()
        },
        error: function () {
            swal('Error', 'Ha ocurrido un error al editar el estado del prestamo', 'error');
        },
        success: function (data) {
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                swal("Listo", "Se modificó el estado del prestamo correctamente", "success");
                $("#myModalFormulario").modal("hide");
                inicializar();
            } else {
                if (tipoRespuesta === "E~") { //error
                    swal('Error', 'No se pudo modificar el estado', 'error');
                } else {
                    swal('Error', 'No se pudo modificar el estado', 'error');

                }
            }
        },
        type: 'POST'
    });

}
