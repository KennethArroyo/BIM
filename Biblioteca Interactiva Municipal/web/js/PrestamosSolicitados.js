/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    inicializarTabla();
});

function inicializarTabla(){
        var t = $('#mydata').DataTable({
            
        dom: 'Bfrtip',
        "buttons": [
            'excel', 'pdf'
        ],
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ libros prestados",
        "sZeroRecords":   "No se encontraron libros prestados",
        "sEmptyTable":    "Ningún libro prestado disponible en esta tabla",
        "sInfo":          "Mostrando _END_ libro(s) de un total de _TOTAL_ libro(s)",
        "sInfoEmpty":     "No hay libros prestados disponibles",
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
    buscarTodosLibros();
    
    function buscarTodosLibros() {
    $.ajax({
        url: 'BuscarPrestamos',
        data: {
            accion: "BuscarPrestamosSolicitados"
        },
        error: function () {
           swal("Error", "No se pudieron cargar los prestamos solicitados", "error");
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
        t.row.add([rowData.usuario, rowData.fecha_inicio, rowData.fecha_final, rowData.titulo, rowData.estado]).draw();
    }
}

$(document).ready(function inicializar() {
    var today = new Date().toISOString().split('T')[0];
    document.getElementsByName("fechaInicio")[0].setAttribute('min', today);
    //$("#myModalFormulario").modal({"backdrop": "static"});
});


function buscarLibroId(idLibro) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroId",
            idLibro: idLibro
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Ha ocurrido un error al cargar el libro', 'error');
        },
        success: function (data) {
            if (data.cantidad_copias > 1) {
                $("#myModalFormulario").modal();
                $("#prestamoAction").val("solicitarPrestamo");
                $("#idLibro").val(data.id);
                $("#cantidad").val(data.cantidad_copias);
                $("#libro").val(data.titulo);
                $("#libro").prop('disabled', true);
            } else
                swal('Info', 'El libro posee solo una copia, solo puede ser utilizado dentro de la biblioteca', 'info');
        },
        type: 'POST',
        dataType: "json"
    });
}



