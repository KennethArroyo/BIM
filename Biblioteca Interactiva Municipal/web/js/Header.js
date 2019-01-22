/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global usuarioFinal */

$(document).ready(function mostrar(){
    var user = JSON.parse(sessionStorage.getItem("usuario"));
            if(user !== null){
                $(".anonimo").hide();
                $(".anonimoR").hide();
                if(user.tipo===0){
                    $(".usuario").show();
                    $(".usuarioR").show();
                }
                if(user.tipo===1){
                    $(".administrador").show();
                    $(".administradorR").show();
                }
            }
});