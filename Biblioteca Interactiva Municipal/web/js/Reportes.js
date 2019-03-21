/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("#ModalReportes").modal();
});

function reportePrestados() {
    $.ajax({type: "GET",
        url: "ReportePrestados",
        success:
                function (datos) {
                    var kennethSePara;
                    var y = 30;
                    var x = 20;
                    window.alert("entra");
                    var doc = new jsPDF();
                    doc.setFontSize(22);
                    doc.text(20,20,'Reporte de Libros prestados');
                    for (var i = 0; i < datos.length; i++) {
                        doc.setFontSize(16);
                        doc.text(x,y,datos[i].titulo);
                        y += 10;
                        x += 10;
                        doc.text(x,y,datos[i].usuario);
                        y += 10;
                        x -=10;
                    }
                    doc.save("ReportePrestados.pdf");
                },
        error: function (status) {
            swal('Error', 'Ha ocurrido un error al generar el reporte', 'error');
        }
    });
}
