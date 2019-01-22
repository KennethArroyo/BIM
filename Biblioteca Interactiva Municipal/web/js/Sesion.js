/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function iniciar(){
    $.ajax({type: "POST", 
            url:"Iniciar",
            success: 
              function(obj){
                
              },
            error: function(status){
                   window.alert("Ha ocurrido un error");
              }                    
          }); 
}