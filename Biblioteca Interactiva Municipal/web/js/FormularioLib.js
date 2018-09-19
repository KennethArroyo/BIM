/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 //agregarLibro.jsp


    $(document).ready(function getAsignaturas(){
            $.ajax({type: "GET", 
                  url:"GetAsignaturas",
                  success: 
                    function(obj){
                      updateList(obj);
                       $('#asignatura').reset();
                    },
                  error: function(status){
                         window.alert("Error");
                    }                    
                });   
            });
            
            //id='\""+quest[i].dia+"\"'
                function updateList(list){
                    for (var i = 0; i <= list.length; i++) {
        $('#asignatura').append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
    }
  }
  function onClickDigital(){
      if($("#digital").is(':checked')){
          $("#libForm").append('<div class="form-group" id="divFile"></div>');
          $("#libForm").append('<input type="file" name="file" class="file" id="file" required>');
      }
      else {
          $("#file").remove();
          $("#divFile").remove();
      }
      }
      
   function agregarLibro(){
       var num = $("#copias").val();
       if($.isNumeric(num)){
            if($("#fisico").prop('checked')||$("#digital").prop('checked')){
                return true;
            }
            else{
                alert("Debe seleccionar al menos un tipo de Libro, físico o digital");
                return false;
            }
       }
       else{
           $("#copias").css("border-color","#d81a1a").css("border-width", "3px");
           alert("La cantiad de copias debe ser un valor númerico");
           return false;
       }
       
   }
