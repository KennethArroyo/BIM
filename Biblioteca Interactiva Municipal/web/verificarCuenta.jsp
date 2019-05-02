<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <title>Verificación de Cuenta</title>
        <%@ include file="header.jsp" %>
    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
                    <div class="containerInicioSesionForm">                        
                    <div class="registroDataTableForm">    
                    <h2 class='tituleForm'>Verificación de Cuenta</h2>       
                    <div class='divisionTitulo'></div> 
                <form action="VerificarCuenta" method="POST" id="verificaUsuario">
                    <div class="form-group">
                        <h6 style="color:red;">Favor revisar su correo electrónico para obtener el código de verificación.</h6>
                        <label for="correo">Correo a Verificar </label>
                        <input type="text" class="form-control" id="correo" name="correo" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                        <p>Formato: ejemplo@dominio.com</p>

                    </div>
                    
                    <div class="form-group">
                        <label for="cod_verificacion">Código de Verificación </label>
                        <input type="text" class="form-control" id="cod_verificacion" name="cod_verificacion" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                    </div>
                    
                <div id="mi_div">    
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" id="botonRegistrar" form="verificaUsuario" >Verificar</button>
                        <a href="Principal" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                    </div>
                </div>
                </form>
                    
                 <form action="ReenviarVerificar" method="POST" action="ReenviarVerificar">  
                     <button type="submit">Reenviar código</button>
                 </form> 
                <br>
            </div>    
        </div>
        <script src="js/Usuarios.js" type="text/javascript"></script>
    </body>
    
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>