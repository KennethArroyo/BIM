/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 //agregarLibro.jsp
 
  $(document).ready(function(){
    $(window).scrollTop(0);
});

 var numeracion = 5;
 var clicksUsuario = 0;
 var autores = null;
    $(document).ready(function getAsignaturas(){
            $.ajax({type: "GET", 
                  url:"GetAsigAutor",
                  success: 
                    function(obj){
                        document.addEventListener("click", function (e) {
                        closeAllLists(e.target);
                        });
                      var asig=obj[0]; 
                      autores=obj[1];
                      updateList(asig);
                      autocomplete(document.getElementById("autor1"), autores);
                      autocomplete(document.getElementById("autor2"), autores);
                      autocomplete(document.getElementById("autor3"), autores);
                      autocomplete(document.getElementById("autor4"), autores);
                       //$('#asignatura').reset();
                    },
                  error: function(status){
                         
                         swal('Error al listar las Asignaturas', '', 'error');
                  }                    
                });   
            }        
        );
            
                function updateList(list){
                    for (var i = 0; i < list.length; i++) {
        $('#asignatura').append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
    }
  }
  
  function autocomplete(inp, arr) {
  var inpGlobal = inp;
  //window.alert(arr[0].nombre);
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists(inp);
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].nombre.substr(0, val.length).toUpperCase() === val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].nombre.substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].nombre.substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i].nombre + "' id='" + arr[i].id + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
              b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              clicksUsuario = clicksUsuario + 1;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists(inp);
          });
          a.appendChild(b); 
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  }
  
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(inp,elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt !== x[i] && elmnt !== inp) {
      x[i].parentNode.removeChild(x[i]);
    }
  }
}

  function removeElem(tag,atr,val){
    var els = document.getElementsByTagName(tag);
    val = val.toLowerCase();
        for (var i = 0; i<els.length; i++) {
            var elem=els[i];
            if(elem.getAttribute(atr)){
                if ( elem.getAttribute(atr).toString().toLowerCase()===val){
                    elem.remove();
                    return;
                }
            }
        }
    }
  
  function onClickDigital(){
      if($("#digital").is(':checked')){
          $("#mi_div").before('<label for="file">PDF</label>&nbsp');
          $("#mi_div").before('<input type="file" name="file" class="file" id="file" required><br>');
      }
      else {
          removeElem('label','for','file');
          $("#file").remove();
      }
    }
      
    function RevisarAutores(){
        var nombre = "";
        var autores2 = [];
        var cuenta = 0;
        var cuentaOcurrencias = 0;
        for(var i = 1;i < numeracion;i++){
            nombre = $("#autor"+i.toString()).val();
            if(nombre !== ''){
                cuenta += 1;
                autores2.push(nombre);
                for(var t = 0;t < autores.length;t++){
                    if(autores[t].nombre === nombre){
                        cuentaOcurrencias += 1;
                        break;
                    }
                }
            }
        }
        if(cuenta !== cuentaOcurrencias){
            cuenta = 0;
            cuentaOcurrencias = 0;
            swal("Info","Uno o mas autores no se encunetran registrados","info");
            return false;
        }
        for(var k = 0;k<autores2.length - 1;k++){
            var valor = autores2[k];
            for(var j = k+1; j<autores2.length;j++){
                var valor2 = autores2[j];
                if(valor === valor2){
                    swal("Info","No pueden haber autores repetidos","info");
                    return false;
                }
            }
        }
        return true;
    }
      
      
    function agregarCampoAutor(){
        var nombre = "autor"+numeracion.toString();
        numeracion += 1;
       $("#autores").after('<div class="row"><div class="col-lg-4"><div class="form-group"><label for="autor">Autor (opcional)</label><input type="text" class="form-control" id="'+nombre+'" name="autor"></div></div></div>');
       autocomplete(document.getElementById(nombre), autores);
    }
    function agregarLibro(){
    var dato = $("#imagenPDF").val();
    var num = $("#copias").val();
    
       if($.isNumeric(num)){
            if($("#fisico").prop('checked')||$("#digital").prop('checked')){
                 //revisar imagen
                 if (dato !== '') {
                    var Extension = dato.substring(dato.lastIndexOf('.') + 1).toLowerCase();
            //Es imagen
                if (Extension === "png"|| Extension === "jpeg" || Extension === "jpg") {
                    $(window).scrollTop(0);
                    return RevisarAutores();
                } 
            //No es imagen
                else {
                        $(window).scrollTop(0);
                        swal("Info","Por favor subir en portada unicamente archivos tipo imagen","info");
                        return false;
                    }
                 }
                 //es digital entonces revisa el archivo PDF
                 if($("#digital").prop('checked')){
                    var portadaPdf = $("#file").val();
                    var extensionPdf = portadaPdf.substring(portadaPdf.lastIndexOf('.') + 1).toLowerCase();
                    if(extensionPdf !== "pdf" && extensionPdf !== "PDF"){
                       $(window).scrollTop(0);
                       swal("Info","El libro debe ser un formato PDF","info");
                       return false;
                    }
                 }
                $(window).scrollTop(0);
                return RevisarAutores();
            }
            //ningun check esta seleccionado
            else{
                $(window).scrollTop(0);
                swal("Info","Debe seleccionar al menos un tipo de Libro, físico o digital","info");
                return false;
            }
       }
       else{
           $(window).scrollTop(0);
           $("#copias").css("border-color","#d81a1a").css("border-width", "3px");
           swal("Info","La cantidad de copias debe ser un valor númerico","info");
           return false;
       }
       
   }
     
     
     $(function() {
    var createAllErrors = function() {
        var form = $(this);
        var errorList = $('ul.errorMessages', form);
        
        var showAllErrorMessages = function() {
            errorList.empty();
            
            //Find all invalid fields within the form.
            form.find(':invalid').each(function(index, node) {

                //Find the field's corresponding label
                var label = $('label[for=' + node.id + ']');

                //Opera incorrectly does not fill the validationMessage property.
                var message = node.validationMessage || 'Invalid value.';
                errorList
                    .show()
                    .append('<li><span>' + label.html() + '</span> ' + message + '</li>');
            });
        };
        
        $('input[type=submit], button', form).on('click', showAllErrorMessages);
        $('input[type=text]', form).on('keypress', function(event) {
            //keyCode 13 is Enter
            if (event.keyCode == 13) {
                showAllErrorMessages();
            }
        });
    };
    $('form').each(createAllErrors);
});


