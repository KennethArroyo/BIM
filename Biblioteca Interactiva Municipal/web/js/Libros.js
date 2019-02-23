/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    inicializar();
    inicializar1();
});

function inicializar(){
        var t = $('#mydata').DataTable({
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ libros",
        "sZeroRecords":   "No se encontraron libros",
        "sEmptyTable":    "Ningún libro disponible en esta tabla",
        "sInfo":          "Mostrando _END_ libro(s) de un total de _TOTAL_ libro(s)",
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
    buscarTodosLibros();
    
    function buscarTodosLibros() {
    $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "buscarTodos"
        },
        error: function () {
           swal("Error", "No se pudieron cargar los libros", "error");
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
    if(rowData.estado===1){est="Bueno";}
    else if(rowData.estado===2){est="Regular";}
    else if(rowData.estado===3){est="Malo";}
    t.row.add([rowData.clasificacion, 'ARREGLAR AUTORES', rowData.titulo, est, rowData.comentario, rowData.cantidad_copias, rowData.asignatura.nombre, '<button id="editar" type="button" class="btn btn-info" onclick="buscarLibroId(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();

}
}

function inicializar1(){
        var t = $('#mydataUsuario').DataTable({
        "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ libros",
        "sZeroRecords":   "No se encontraron libros",
        "sEmptyTable":    "Ningún libro disponible en esta tabla",
        "sInfo":          "Mostrando _END_ libro(s) de un total de _TOTAL_ libro(s)",
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
    buscarTodosLibros();
    
    function buscarTodosLibros() {
    $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "buscarTodos"
        },
        error: function () {
           swal("Error", "No se pudieron cargar los libros", "error");
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
    if(rowData.estado===1){est="Bueno";}
    else if(rowData.estado===2){est="Regular";}
    else if(rowData.estado===3){est="Malo";}
    t.row.add([rowData.clasificacion, 'ARREGLAR AUTORES', rowData.titulo, est, rowData.comentario, rowData.cantidad_copias, rowData.asignatura.nombre, '<button id="editar" type="button" class="btn btn-info" onclick="buscarLibroId(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();

}
}


function onClickDigital() {
    if ($("#digital").is(':checked')) {
        $("#libForm").append('<input type="file" name="file" class="file" id="file" required>');
    } else {
        $("#file").remove();
    }
}

function agregarLibro() {
    var dato = $("#imagenPDF").val();
    var num = $("#copias").val();
    if ($.isNumeric(num)) {
        if ($("#fisico").prop('checked') || $("#digital").prop('checked')) {
            //revisar imagen
            if (dato !== '') {
                var Extension = dato.substring(dato.lastIndexOf('.') + 1).toLowerCase();
                //Es imagen
                if (Extension === "png" || Extension === "jpeg" || Extension === "jpg") {

                    return true;
                }
                //No es imagen
                else {
                    swal("Info","Por favor en portada subir unicamente archivos tipo imagen","info");
                    return false;
                }
            }
            return true;
        }
        //ningun check esta seleccionado
        else {
            swal("Info","Debe seleccionar al menos un tipo de Libro, físico o digital","info");
            return false;
        }
    } else {
        $("#copias").css("border-color", "#d81a1a").css("border-width", "3px");
        swal("Info","La cantiad de copias debe ser un valor númerico","info");
        return false;
    }

}
//$(document).ready(function(){
//    $("#tablaLibros").DataTable();
//    });


$(document).ready(function getAsignaturas() {
    $.ajax({type: "GET",
        url: "GetAsignaturas",
        success:
                function (obj) {
                    updateList(obj);
                    $('#asignatura').reset();
                },
        error: function (status) {
            swal('Error', 'No se pudieron cargar las asignaturas', 'error');
        }
    });
});

function updateList(list) {
    for (var i = 0; i <= list.length; i++) {
        $('#asignatura').append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
    }
}

function cancelar() {
    limpiarForm();
    $("#myModalFormulario").modal("hide");
    //$("#tablaLibros").html("");
}

function modificarLibro() {
    if ($("#fisico").prop('checked')) {
        $("#fisico").val(1);
    } else {
        $("#fisico").val(0);
    }
    if ($("#digital").prop('checked')) {
        $("#digital").val(1);
    } else {
        $("#digital").val(0);
    }

    var num = $("#copias").val();
    if ($.isNumeric(num)) {
        if (validar()) {
            $.ajax({
                url: 'BuscarLibro',
                data: {
                    accion: "modificarLibro",
                    clasificacion: $("#clasificacion").val(),
                    titulo: $("#titulo").val(),
                    comentario: $("#comentario").val(),
                    estado: $("#estado").val(),
                    copias: $("#copias").val(),
                    fisico: $("#fisico").val(),
                    digital: $("#digital").val(),
                    asignatura: $("#asignatura").val()

                },
                error: function () { //si existe un error en la respuesta del ajax
                    swal("Error", "No se pudo cargar la información del libro", "error");
                },
                success: function (data) {
                    var tipoRespuesta = data.substring(0, 2);
                    if (tipoRespuesta === "C~") { //correcto
                        swal("Listo!", "Se modifico el libro correctamente", "success");
                        $("#myModalFormulario").modal("hide");
                        $("#mydata").DataTable().destroy();
                        inicializar();
                    } else {
                        if (tipoRespuesta === "E~") { //error
                            swal("Error", "No se pudo modificar el libro", "error");
                        }
                    }
                    //$("#tablaLibros").html("");
                },
                type: 'POST'
            });
        } else
        {
            swal("Info","Debe de digitar los campos del formulario que se encuentran vacíos","info");
            
        }
    } else
    {
        swal("Info","La cantidad de copias debe ser un valor numerico","info");
        

    }
}
function limpiarForm() {
    //Resetear el formulario
    $('#forModal').trigger("reset");
}

function  buscarLibroAutor(nombre) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroAutor",
            nombre: nombre
        },

        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "No se pudieron cargar los libros", "error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroClasificacion(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroClasificacion",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "No se pudo cargar el libro", "error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroTitulo(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroTitulo",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "No se pudieron cargar los libros", "error");
        },
        success: function (data) {
            dibujarTabla(data);

        },
        type: 'POST',
        dataType: "json"
    });
}

function  buscarLibroAsignatura(name) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroAsignatura",
            nombre: name
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "No se pudieron cargar los libros", "error");
        },
        success: function (data) {
            dibujarTabla(data);
        },
        type: 'POST',
        dataType: "json"
    });
}

function buscarLibroId(idLibro) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroId",
            idLibro: idLibro
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "No se pudo cargar el libro", "error");
        },
        success: function (data) {
            $("#myModalFormulario").modal();
            //dibujarTabla(data);
            //buscarAsignaturaId(data.asignatura.id);
            $("#clasificacion").attr('readonly', 'readonly');
            $("#libroAction").val("modificarLibro");

            //$("#id").val(data.idLibro);
            $("#clasificacion").val(data.clasificacion);
            $("#titulo").val(data.titulo);
            $("#autor").val(data.autor);
            $("#comentario").val(data.comentario);
            $("#estado").val(data.estado);
            $("#copias").val(data.cantidad_copias);
            if (data.fisico === 1) {
                $("#fisico").prop('checked', true);
            } else {
                $("#fisico").prop('checked', false);
            }
            if (data.digital === 1) {
                $("#digital").prop('checked', true);
            } else {
                $("#digital").prop('checked', false);
            }
            $("select").val(data.asignatura.id);
        },
        type: 'POST',
        dataType: "json"
    });
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    //$("#groupId").removeClass("has-error");
    //$("#groupNombre").removeClass("has-error");
    //$("#groupApellidos").removeClass("has-error");
    //$("#groupFechaNacimiento").removeClass("has-error");
    //$("#groupFechaVencimiento").removeClass("has-error");
    //$("#groupTipoLicencia").removeClass("has-error");
    //  $("#groupEstado").removeClass("has-error");
//    $("#groupEsClienteTransportista").removeClass("has-error");

    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#titulo").val() === "") {
        //$("#groupId").addClass("has-error");
        validacion = false;
    }
    if ($("#autor").val() === "") {
        //$("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#estado").val() === "") {
        //$("#groupApellidos").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

