/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



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
