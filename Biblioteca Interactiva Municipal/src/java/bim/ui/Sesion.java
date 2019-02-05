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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
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
@WebServlet(name = "Sesion", urlPatterns = {"/Sesion", "/Iniciar", "/Cerrar", "/Cambio"})
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
            throws ServletException, IOException {
        switch(request.getServletPath()){
                case "/Iniciar":
                    this.iniciaSesion(request, response);
                    break;
                case "/Cambio":
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
    
    private void iniciaSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int error = 401;
        try{
            HttpSession s = request.getSession(true);
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            response.setContentType("application/json; charset=UTF-8");
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            String hash = HashJavaMessageDigest(contrasena);
            Usuario us = Model.instance().buscarUsRegistrado(usuario,hash);
            if(us.getHabilitado()==0){
                //response.sendError(0);
                error = 405;
                throw new Exception();
            }
            out.write(gson.toJson(us));
            response.setStatus(200); // ok with content
        }
        catch(Exception e) {
            String msj = e.getMessage();
            response.sendError(error);
        }
    }

    private void cierraSesion(HttpServletRequest request, HttpServletResponse response) {
    }

    private void cambiarContrasena(HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException {
            
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        String correo = request.getParameter("correo");

        response.setContentType("application/json; charset=UTF-8");
        String autor = request.getParameter("nombre");
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

        String link = "http://localhost:8080/Biblioteca_Interactiva_Municipal/recuperarContrasena.jsp";

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
    }
}
