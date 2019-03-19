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
    t.row.add([rowData.identificacion, rowData.nombre, rowData.apellidos, rowData.lugar_residencia, rowData.telefono, rowData.correo, rowData.ref_trab_est, hab,'<button type="button" class="btn btn-info" onclick="buscarUsuarioId(' + rowData.identificacion + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button>']).draw();

}
}

function buscarUsuarioId(identificacion){
    $.ajax({
        url: "BuscarUsuarios",
        data: {
            accion: "buscarUsuarioId",
            identificacion: identificacion
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Ha ocurrido un error al cargar el usuario', 'error');
        },
        success: function (data) {
            if (data.habilitado === 1) {
                $("#myModalFormulario").modal();
                $("#Tipoaction").val("cambiarTipoUsuario");
                $("#identificacion").val(data.identificacion);
                if(data.tipo===1){
                    $("#tipo").val(1);
                }else if(data.tipo===2){
                    $("#tipo").val(2);
                }
            } else
                swal('Info', 'El correo del usuario usuario no esta verificado', 'info');
        },
        type: 'POST',
        dataType: "json"
    });
}

function cambiarTipoUsuario(){
    $.ajax({
       url:'BuscarUsuarios',
       data:{
           accion: "modificarTipoUsuario",
           tipo:$("#tipo").val(),
           identificacion:$("#identificacion").val()
       },
       error:function(){
           swal('Error', 'Ha ocurrido un error al editar el tipo de usuario', 'error');
       },
       success: function(data){
           var tipoRespuesta = data.substring(0,2);
           if (tipoRespuesta === "C~") { //correcto
                        swal("Listo", "Se modificó el tipo de usuario correctamente", "success");
                        //window.alert("Se modificó el usuario correctamente");
                        $("#myModalFormulario").modal("hide");
                        //window.location.assign("http://localhost:8083/Biblioteca_Interactiva_Municipal/principal.jsp");
                    } else {
                        if (tipoRespuesta === "E~") { //error
                            swal('Error', 'No se pudo modificar el tipo', 'error');
                    }else {
                    swal('Error', 'No se pudo modificar el tipo', 'error');
                    
                }
                    }
       },
       type: 'POST'
    });
    
}




