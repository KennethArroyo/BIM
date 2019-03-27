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
            "sLengthMenu": "Mostrar _MENU_ préstamos",
            "sZeroRecords": "No se encontraron préstamos",
            "sEmptyTable": "Ningún préstamo disponible en esta tabla",
            "sInfo": "Mostrando _END_ préstamo(s) de un total de _TOTAL_ préstamo(s)",
            "sInfoEmpty": "No hay préstamos disponibles",
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
    
    function dibujarFila(rowData) {
        t.row.add([rowData.usuario, rowData.fecha_inicio, rowData.fecha_final, rowData.titulo, rowData.estado, '<button type="button" class="btn btn-info" onclick="buscarPrestamoId(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();
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
            $("#libro_ID").val(data.libro_ID);
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
            id: $("#id").val(),
            libro_ID:$("#libro_ID").val()
        },
        error: function () {
            swal('Error', 'Ha ocurrido un error al editar el estado del prestamo', 'error');
        },
        success: function (data) {
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                swal("Listo", "Se modificó el estado del prestamo correctamente", "success");
                $("#myModalFormulario").modal("hide");
                $("#mydataTodosPrestamo").DataTable().destroy();
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
