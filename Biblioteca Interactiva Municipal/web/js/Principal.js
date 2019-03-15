/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $.ajax({type: "POST", 
            url:"Principal",
            success: 
              function(obj){
                    location.reload();
                    const mySiema = new Siema({duration: 600,easing: 'cubic-bezier(.11,.73,.57,1.53)', loop: true});
                    document.querySelector('#prev').addEventListener('click',() => mySiema.prev());
                    document.querySelector('#next').addEventListener('click',() => mySiema.next());
              },
            error: function(status){
                swal("Error", "Ocurrio un error con la lista de actividades municipales", "error");
              }                    
          }); 
});