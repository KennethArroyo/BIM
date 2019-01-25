/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
                    alert("Por favor en portada subir unicamente archivos tipo imagen ");
                    return false;
                }
            }
            return true;
        }
        //ningun check esta seleccionado
        else {
            alert("Debe seleccionar al menos un tipo de Libro, físico o digital");
            return false;
        }
    } else {
        $("#copias").css("border-color", "#d81a1a").css("border-width", "3px");
        alert("La cantiad de copias debe ser un valor númerico");
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
            window.alert("Error");
        }
    });
});

function updateList(list) {
    for (var i = 0; i <= list.length; i++) {
        $('#asignatura').append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
    }
}



function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaLibros").html("");
    //muestra el enzabezado de la tabla
    var head = $("<thead/>");
    var row = $("<tr/>");
    head.append(row);
    $("#tablaLibros").append(head);
    //row.append($("<th>ID<b></b></th>"));
    row.append($("<th>CLASIFICACION<b></b></th>"));
    row.append($("<th><b>AUTOR</b></th>"));
    row.append($("<th><b>TITULO</b></th>"));
    row.append($("<th><b>ESTADO</b></th>"));
    row.append($("<th><b>COMENTARIO</b></th>"));
    row.append($("<th>CANTIDAD COPIAS<b></b></th>"));
    row.append($("<th>ASIGNATURA<b></b></th>"));
    row.append($("<th>EDITAR<b></b></th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de un libro

    var row = $("<tr/>");
    $("#tablaLibros").append(row);
    //row.append($("<td>" + rowData.id + "</td>"));
    row.append($("<td>" + rowData.clasificacion + "</td>"));
    row.append($("<td>" + rowData.autor + "</td>"));
    row.append($("<td>" + rowData.titulo + "</td>"));
    if (rowData.estado === 1) {
        row.append($("<td>" + "bueno" + "</td>"));
    } else
    if (rowData.estado === 2) {
        row.append($("<td>" + "regular" + "</td>"));
    } else

    if (rowData.estado === 3) {
        row.append($("<td>" + "malo" + "</td>"));
    }
    row.append($("<td>" + rowData.comentario + "</td>"));
    row.append($("<td>" + rowData.cantidad_copias + "</td>"));
    row.append($("<td>" + rowData.asignatura.nombre + "</td>"));
    row.append($('<td><button type="button" class="btn btn-info" onclick="buscarLibroId(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button></td>'));
   
}

function buscar() {
    var tipo = $("#selectBuscar").val();
    var name = $("#textobuscar").val();
    if (tipo === "autor") {
        buscarLibroAutor(name);
    } else
    if (tipo === "titulo") {
        buscarLibroTitulo(name);
    } else
    if (tipo === "clasificacion") {
        buscarLibroClasificacion(name);
    } else
    if (tipo === "asignatura") {
        buscarLibroAsignatura(name);
    } else
    if (tipo === "ident") {
        buscarLibroId(name);
    } 
}


function  buscarLibroAutor(nombre) {
    $.ajax({
        url: "BuscarLibro",
        data: {
            accion: "buscarLibroAutor",
            nombre: nombre
        },

        error: function () { //si existe un error en la respuesta del ajax
            window.alert("1-error");
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
            window.alert("1-error");
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
            window.alert("1-error");
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
            window.alert("Error de ajax");
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
            window.alert("1-error");
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
function cancelar() {
    limpiarForm();
    $("#myModalFormulario").modal("hide");
    //$("#tablaLibros").html("");
}

function modificarLibro() {
    if($("#fisico").prop('checked')){
       $("#fisico").val(1); 
    }
    else{
        $("#fisico").val(0);
    }
    if($("#digital").prop('checked')){
       $("#digital").val(1); 
    }
    else{
        $("#digital").val(0);
    }   
    
    var num = $("#copias").val();
    if($.isNumeric(num)){
    if(validar()){
        $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "modificarLibro",
            clasificacion: $("#clasificacion").val(),
            titulo: $("#titulo").val(),
            autor: $("#autor").val(),
            comentario: $("#comentario").val(),
            estado: $("#estado").val(),
            copias: $("#copias").val(),
            fisico: $("#fisico").val(),
            digital: $("#digital").val(),
            asignatura: $("#asignatura").val()

        },
        error: function () { //si existe un error en la respuesta del ajax
            window.alert("error de ajax, contacte con el administrador");
        },
        success: function (data) {
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") { //correcto
                window.alert("Se modificó el libro correctamente");
                $("#myModalFormulario").modal("hide");
                buscar();
            } else {
                if (tipoRespuesta === "E~") { //error
                    window.alert("No se pudo modificar el libro");
                }
            }
            //$("#tablaLibros").html("");
        },
        type: 'POST'
    });
    }
    else
    { 
        //swal("Debe de digitar los campos del formulario que se encuentran vacíos");
        window.alert("Debe de digitar los campos del formulario que se encuentran vacíos");
    }
}
else
    { 
        //swal("La cantidad de copias debe ser un valor numerico");
        window.alert("La cantidad de copias debe ser un valor numerico");
        
    }
}
function limpiarForm() {
    //Resetear el formulario
    $('#forModal').trigger("reset");
}

function buscarAsignaturaID(idAsignatura) {
    $.ajax({
        url: 'BuscarLibro',
        data: {
            accion: "buscarAsignaturaId",
            idAs: idAsignatura
        },
        error: function () {
            window.alert("1-error");
        },
        succes: function (data) {
            $("#asignatura").val(data.nombre);
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