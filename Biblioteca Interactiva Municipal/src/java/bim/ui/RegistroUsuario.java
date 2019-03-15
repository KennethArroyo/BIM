/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Usuario;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Kenneth
 */
@WebServlet(name = "RegistroUsuario", urlPatterns = {"/RegistroUsuario", "/RegistrarUsuario", "/VerificarCuenta", "/BuscarUsuario"})
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
            case "/BuscarUsuario":
                this.buscarUsuario(request, response);
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
    
    private static String bytesToHex(byte[] hash) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1)
                hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
    
    public static String HashJavaMessageDigest(final String conUs) throws NoSuchAlgorithmException {
        final MessageDigest digest = MessageDigest.getInstance("SHA-256");
        final byte[] encodedhash = digest.digest(conUs.getBytes(StandardCharsets.UTF_8));
        return bytesToHex(encodedhash);
    }
    
    
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
            String hash = HashJavaMessageDigest(contrasena);
            Usuario u =  new Usuario();
            u.setTipo(0);
            u.setIdentificacion(identificacion);
            u.setNombre(nombre);
            u.setApellidos(apellidos);
            u.setLugar_residencia(lugar_residencia);
            u.setTelefono(telefono);
            u.setCorreo(correo);
            u.setContrasena(hash);
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
                    .append("  Código para verificar su cuenta:  <b>" + u.getCod_verificacion() + "</b> <br/>")
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
            
            request.getRequestDispatcher("Principal").forward(request, response);
        }
        catch (Exception e) {
            String msg = e.getMessage();
            if(msg.matches("unique")){
                request.setAttribute("error", "Es posible que el correo o la identificacion ya se encuentran registradas");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            else{
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("Principal").forward(request, response);
            }
        }
    }
    
    
    protected void verificarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario u;
            HttpSession s = request.getSession(true);
            String correo = request.getParameter("correo");
            String codigo = request.getParameter("cod_verificacion");
            u = Model.instance().verificarCuenta(correo, codigo);
            
            if(u != null) {
                u.setHabilitado(1);
                out.print("C~La cuenta ha sido verificada correctamente");
            }
            else {
                out.print("C~Ha ocurrido un error verificando la cuenta");
            }
           request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
        catch (Exception e) {
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
    }
    protected void buscarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario us = new Usuario();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            us = Model.instance().getUsuarioCed(request.getParameter("id"));
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(us));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }
}
