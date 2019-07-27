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
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Service;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "Sesion", urlPatterns = {"/Sesion", "/Iniciar", "/Cerrar", "/SolicitudCambiar", "/Cambiar"})
public class Sesion extends HttpServlet {

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
            throws ServletException, IOException, MessagingException, Exception {
        response.setContentType("application/json; charset=UTF-8");

        switch(request.getServletPath()){
                case "/Iniciar":
                    this.iniciaSesion(request, response);
                    break;
                case "/SolicitudCambiar":
                    this.enviarCodigo(request, response);
                    break;
                case "/Cambiar":
                    this.cambiarContrasena(request, response);
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    
    private void iniciaSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
      /*  int error = 401;
        try {
            //HttpSession s = request.getSession(true);
            //BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            //Gson gson = new Gson();
            String json;
            String usuario = request.getParameter("usuario");
            error=1;
            String contrasena = request.getParameter("contrasena");
            error=2;
            String hash = HashJavaMessageDigest(contrasena);
            error=3;
            Usuario us = Model.instance().buscarUsRegistrado(usuario, hash);
            error=4;
            if (us.getHabilitado() == 0) {
                //response.sendError(0);
                error = 405;
                throw new Exception();
            } else {
                if ((us.getHabilitado() == 2) || (us.getHabilitado() == 3)) {
                    //response.sendError(0);
                    error = 406;
                    throw new Exception();
                }
            }
            //    out.write(gson.toJson(us));
            error=5;
            json = new Gson().toJson(us);
            error=6;
            out.print(json);
            error=7;
            //response.setStatus(200); // ok with content
        } catch (Exception e) {
            //error = 14;
            String msj = e.getMessage();
            response.sendError(error);
        }*/
      
      int error = 401;
      int sleep;
        try {
            //HttpSession s = request.getSession(true);
            //BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            //Gson gson = new Gson();
            String json;
            String usuario = request.getParameter("usuario");
            sleep=1;
            String contrasena = request.getParameter("contrasena");
            sleep=2;
            String hash = HashJavaMessageDigest(contrasena);
            sleep=3;
            Usuario us = Model.instance().buscarUsRegistrado(usuario, hash);
            sleep=4;
            if (us.getHabilitado() == 0) {
                //response.sendError(0);
                error = 405;
                throw new Exception();
            } else {
                if ((us.getHabilitado() == 2) || (us.getHabilitado() == 3)) {
                    //response.sendError(0);
                    error = 406;
                    throw new Exception();
                }
            }
            //    out.write(gson.toJson(us));
            sleep=5;
            json = new Gson().toJson(us);
            sleep=6;
            out.print(json);
            sleep=7;
            //response.setStatus(200); // ok with content
        } catch (Exception e) {
            //error = 14;
            String msj = e.getMessage();
            response.sendError(error);
        }
    }
    
    private String generarCodigo() {
                String nums = "0123456789";
                String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String pswd = "";
 
		for (int i = 0; i <= 2; i++) {
			pswd+=(nums.charAt((int)(Math.random() * nums.length())));
                        pswd+=(letras.charAt((int)(Math.random() * letras.length())));
		}
 
		return pswd;
	}

    private void enviarCodigo(HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException, Exception {
        try{
        String temporal = generarCodigo();
        String temporal2 = HashJavaMessageDigest(temporal);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        
        String correo = request.getParameter("correo");
        int id = Model.instance().buscarIdUsuarioCorreo(correo);
        Model.instance().registrarTemporal(timestamp,temporal2,id);
        
        //Email
//        String MAIL_SMTP_HOST = "smtp.gmail.com";
//        String MAIL_USERNAME = "bimsantodomingo@gmail.com";
//        String MAIL_PASSWORD = "bibliotecabim";
//
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", MAIL_SMTP_HOST);
//        props.put("mail.smtp.port", "587");
//
//        Session session = Session.getInstance(props,
//            new javax.mail.Authenticator() {
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(MAIL_USERNAME, MAIL_PASSWORD);
//                }
//            });
//
//        String link = "http://192.170.10.103/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp";
//        StringBuilder bodyText = new StringBuilder();
//        bodyText.append("<div>")
//                .append("  Estimado(a) usuario de la Biblioteca Interactiva Municipal:<br/><br/>")
//                .append("  Su codigo temporal es:  <b>" + temporal + "</b> <br/>")
//                .append("  Copie y pegue el siguiente texto en el campo de código temporal en el formulario al que lo redirigue el enlace: ")
//                .append("  <br/>")
//                .append("  Por favor haga click<a href=\"" + link + "\"> aquí</a> o copie el siguiente enlace en su navegador: <br/>")
//                .append("  <a href=\"" + link + "\">" + link + "</a>")
//                .append("  <br/><br/>")
//                .append("  Gracias.<br/>")
//                .append("  Biblioteca Isaac Felipe Azofeifa <br/>")
//                .append("  Municipalidad de Santo Domingo de Heredia <br/>")
//                .append("</div>");
//
//        Message message = new MimeMessage(session);
//        message.setFrom(new InternetAddress(MAIL_USERNAME));
//        message.setRecipients(Message.RecipientType.TO,
//                InternetAddress.parse(correo));
//        message.setSubject("Cambio de contraseña - BIM");
//        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
//        Transport.send(message);
        response.setStatus(200); // ok with content
        }
        catch(Exception e){
        String msg = e.getMessage();
        response.setStatus(401);
        }
    }

    private void cambiarContrasena(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        try{
            String temporal = HashJavaMessageDigest(request.getParameter("temporal"));
            String contrasena = HashJavaMessageDigest(request.getParameter("contrasena"));
            Usuario u = new Usuario();
            Model.instance().cambiarClaveTemporal(temporal, contrasena);
        }
        catch(Exception e){
        response.setStatus(401);
        }
    }
}
