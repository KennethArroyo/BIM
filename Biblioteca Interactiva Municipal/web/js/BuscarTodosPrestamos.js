/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var libro_ID_g;
var fechaActual_g;
var fechaEntrega_g;
var usuario_g;
var prestamo_id_g;
$(document).ready(function () {
    inicializar();
});

function inicializar() {
    var now = new Date();
    var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();

    var t = $('#mydataTodosPrestamo').DataTable({
        "lengthMenu": [[10, 25, 50, -1], ['Mostrar 10 datos', 'Mostrar 25 datos', 'Mostrar 50 datos', 'Todos los datos']],
        dom: 'Bfrtip',
        "buttons": [
            'pageLength',
            {extend: 'pdf',
                text: 'Exportar PDF',
                filename: 'ReporteTodosPrestamos-' + jsDate,
                pageSize: 'A4', //A3 , A5 , A6 , legal , letter
                exportOptions: {
                    columns: ':visible',
                    search: 'applied',
                    order: 'applied'
                },
                customize: function (doc) {
                    //Remove the title created by datatTables
                    doc.content.splice(0, 1);
                    // Logo converted to base64
                    var logo = 'data:image/jpeg;base64,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';
                    // Set page margins [left,top,right,bottom] or [horizontal,vertical]
                    doc.pageMargins = [20, 100, 20, 50];
                    // Set the font size fot the entire document
                    doc.defaultStyle.fontSize = 7;
                    // Set the fontsize for the table header
                    doc.styles.tableHeader.fontSize = 7;
                    // Create a header object with 3 columns
                    doc['header'] = (function () {
                        return {
                            columns: [
                                {
                                    image: logo,
                                    width: 60,
                                    height: 60
                                },
                                {
                                    alignment: 'left',
                                    italics: true,
                                    text: 'Reporte de Todos los Préstamos Realizados',
                                    fontSize: 18,
                                    margin: [10, 0]
                                },
                                {
                                    alignment: 'right',
                                    fontSize: 14,
                                    text: 'Biblioteca Isaac Felipe Azofeifa'
                                }
                            ],
                            margin: 20
                        }
                    });
                    // Create a footer object with 2 columns
                    // Left side: report creation date
                    //Right side: current page and total pages
                    doc['footer'] = (function (page, pages) {
                        return {
                            columns: [
                                {
                                    alignment: 'left',
                                    text: ['Creado el: ', {text: jsDate.toString()}],
                                    fontSize: 14

                                },
                                {
                                    alignment: 'right',
                                    text: ['Página ', {text: page.toString()}, ' de ', {text: pages.toString()}],
                                    fontSize: 14
                                }
                            ],
                            margin: 20
                        }
                    });
                    // Change dataTable layout (Table styling)
                    // To use predefined layouts uncomment the line below and comment the custom lines below
                    // doc.content[0].layout = 'lightHorizontalLines'; // noBorders , headerLineOnly
                    var objLayout = {};
                    objLayout['hLineWidth'] = function (i) {
                        return .5;
                    };
                    objLayout['vLineWidth'] = function (i) {
                        return .5;
                    };
                    objLayout['hLineColor'] = function (i) {
                        return '#aaa';
                    };
                    objLayout['vLineColor'] = function (i) {
                        return '#aaa';
                    };
                    objLayout['paddingLeft'] = function (i) {
                        return 4;
                    };
                    objLayout['paddingRight'] = function (i) {
                        return 4;
                    };
                    doc.content[0].layout = objLayout;
                }
            }
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

    function dibujarFila(rowData) {                                                                                                                                     //onclick="levantarModal('+ rowData.id + ',' + '\'' + rowData.nombre + '\'' + ');"
        t.row.add([rowData.usuario, rowData.fecha_inicio, rowData.fecha_final, rowData.titulo, rowData.estado, '<button type="button" class="btn btn-info" onclick="buscarPrestamoId(' + rowData.id + ',' + '\'' + rowData.titulo + '\'' + ',' + '\'' + rowData.estado + '\'' + ',' + '\'' + rowData.libro_ID + '\'' + ',' + '\'' + rowData.usuario_ID + '\'' + ',' + '\'' + rowData.fecha_final + '\'' + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();
    }
}

function buscarPrestamoId(id, titulo, estado, libro_ID, usuario_ID,fecha_final) {
    var now = new Date();
    var jsDate = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
    $("#myModalFormulario").modal();
    $("#Estadoaction").val("modificarEstadoPrestamo");
    
    //$("#id").val(id);
    
    $("#titulo").val(titulo);
    //$("#libro_ID").val(libro_ID);
    prestamo_id_g=id;
    libro_ID_g=libro_ID;
    fechaActual_g=jsDate;
    fechaEntrega_g=fecha_final;
    usuario_g=usuario_ID;
    
    
    if (estado === "solicitado") {
        $("#estado").val(1);
    } else if (estado === "prestado") {
        $("#estado").val(2);
    } else if (estado === "devuelto") {
        $("#estado").val(3);
    }
    //$("#fechaEntrega").val(fecha_final);

}

function modificarEstadoPrestamo() {
    //var fecha_entrega = $("#fechaEntrega").val();
    //var jsDate = $("#fechaActual").val();
    var fe = new Date(fechaEntrega_g);
    var fa = new Date(fechaActual_g);
    $.ajax({
        url: 'BuscarPrestamos',
        data: {
            accion: "ModificarEstadoPrestamo",
            estado: $("#estado").val(),
            id: prestamo_id_g,
            libro_ID: libro_ID_g
        },
        error: function () {
            swal('Error', 'Ha ocurrido un error al editar el estado del prestamo', 'error');
        },
        success: function (data) {
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                swal("Listo", "Se modificó el estado del prestamo correctamente", "success");
                $("#myModalFormulario").modal("hide");
               if (fe >= fa) {
                $("#mydataTodosPrestamo").DataTable().destroy();
                inicializar();
                } else {
                modalSancion();
                $("#mydataTodosPrestamo").DataTable().destroy();
                inicializar();
                }
                //prueba(fecha_entrega);

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

function crearSancion() {
    $.ajax({
        url: 'Sanciones',
        data: {
            accion: "CrearSancion",
            factual:fechaActual_g,
            usuario:usuario_g,
            cantDias:$("#diasSancion").val()
        },
        error: function () {
            swal('Error', 'Ha ocurrido un error al intentar crear la sanción', 'error');
        },
        success: function(data){
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                swal("Listo", "Se creó la sanción correctamente", "success");
                $("#myModalSancion").modal("hide");
                $("#mydataTodosPrestamo").DataTable().destroy();
                inicializar();
            } else {
                if (tipoRespuesta === "E~") { //error
                    swal('Error', 'No se pudo crear la sanción', 'error');
                } else {
                    swal('Error', 'No se pudo crear la sanción', 'error');

                }
            }
        },
        type: 'Post'
    });

}

$(function () {
    $("#cancelar").click(function () {
        $("#myModalFormulario").modal("hide");
    });

    $("#cancelar2").click(function () {
        $("#myModalSancion").modal("hide");
    });

});

function modalSancion() {
    $("#myModalSancion").modal();
    $("#fechaEntrega1").val(fechaEntrega_g);
    $("#fechaActual1").val(fechaActual_g);
    $("#usuario1").val(usuario_g);
    
}

