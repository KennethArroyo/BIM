/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Usuario;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Kenneth
 */
@WebServlet(name = "RegistroUsuario", urlPatterns = {"/RegistroUsuario", "/RegistrarUsuario", "/VerificarCuenta"})
public class RegistroUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        switch (request.getServletPath()) {
            case "/RegistrarUsuario":
                this.registroUsuario(request, response);
                break;
            case "/VerificarCuenta":
                this.verificarCuenta(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    protected void registroUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession s = request.getSession(true);
            
            String identificacion = request.getParameter("identificacion");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String lugar_residencia = request.getParameter("lugar_residencia");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String ref_trab_est = request.getParameter("ref_trab_est");
            
            Usuario u =  new Usuario();
            u.setTipo(0);
            u.setIdentificacion(identificacion);
            u.setNombre(nombre);
            u.setApellidos(apellidos);
            u.setLugar_residencia(lugar_residencia);
            u.setTelefono(telefono);
            u.setCorreo(correo);
            u.setContrasena(contrasena);
            u.setRef_trab_est(ref_trab_est);
            u.setHabilitado(0); // 0 = NO HABILITADO, 1 = HABILITADO
            u.GenerarCodigoVerificacion();
            
            Model.instance().registrarUsuario(u);  
            
            //Envio de correo de verificacion
            String MAIL_SMTP_HOST = "smtp.gmail.com";
            String MAIL_USERNAME = "bimsantodomingo@gmail.com";
            String MAIL_PASSWORD = "bibliotecabim";
         
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", MAIL_SMTP_HOST);
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(MAIL_USERNAME, MAIL_PASSWORD);
                    }
                });

            String link = "http://localhost:8083/Biblioteca_Interactiva_Municipal/verificarCuenta.jsp";

            StringBuilder bodyText = new StringBuilder();
            bodyText.append("<div>")
                    .append("  Estimado(a) usuario de la Biblioteca Interactiva Municipal:<br/><br/>")
                    .append("  Código para verificar su cuenta:  " + u.getCod_verificacion() + " <br/>")
                    .append("  Copie y pegue el siguiente texto en el campo de código de verificación en el formulario al que lo redirigue el enlace: ")
                    .append("  <br/>")
                    .append("  Por favor haga click<a href=\"" + link + "\"> aquí</a> o copie el siguiente enlace en su navegador: <br/>")
                    .append("  <a href=\"" + link + "\">" + link + "</a>")
                    .append("  <br/><br/>")
                    .append("  Gracias.<br/>")
                    .append("  Biblioteca Isaac Felipe Azofeifa <br/>")
                    .append("  Municipalidad de Santo Domingo de Heredia <br/>")
                    .append("</div>");
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(correo));
            message.setSubject("Verificación de Cuenta - BIM");
            message.setContent(bodyText.toString(), "text/html; charset=utf-8");
            Transport.send(message);
         
            
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
        catch (Exception e) {
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
    }
    
    
    protected void verificarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario u;
            String json;
            HttpSession s = request.getSession(true);
            String correo = request.getParameter("correo");
            String codigo = request.getParameter("cod_verificacion");
            u = Model.instance().verificarCuenta(correo, codigo);
            json = new Gson().toJson(u);
            if(u != null) {
                u.setHabilitado(1);
                out.print("C~La cuenta ha sido verificada correctamente");
            }
            else {
                out.print("C~Ha ocurrido un error verificando la cuenta");
            }
            
        }
        catch (Exception e) {
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
    }
        
}
