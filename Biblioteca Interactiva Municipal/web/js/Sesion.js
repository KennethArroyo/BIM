/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var usuario = null;
function iniciar(){
    $.ajax({type: "POST", 
            url:"Iniciar",
            success: 
              function(obj){
                usuario = obj;
                $("div.anonimo").hide();
                $("div.anonimoR").hide();
                if(obj.tipo===1){
                    $("div.usuario").show();
                    $("div.usuarioR").show();
                }
                if(obj.tipo===2){
                    $("div.administrador").show();
                    $("div.administradorR").show();
                }
              },
            error: function(status){
                   window.alert("El usuario o la contraseña son inválidos");
              }                    
          }); 
}