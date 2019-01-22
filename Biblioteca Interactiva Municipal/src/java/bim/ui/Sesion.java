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
@WebServlet(name = "Sesion", urlPatterns = {"/Sesion", "/Iniciar", "/Cerrar"})
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
                case "/Cerrar":
                    this.cierraSesion(request, response);
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

    private void iniciaSesion(HttpServletRequest request, HttpServletResponse response) {
        try{
            HttpSession s = request.getSession(true);
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            response.setContentType("application/json; charset=UTF-8");
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            Usuario us = Model.instance().buscarUsRegistrado(usuario,contrasena);
            s.setAttribute("Usuario", us);
            out.write(gson.toJson(us));
            response.setStatus(200); // ok with content
        }
        catch(Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request        }
        }
    }

    private void cierraSesion(HttpServletRequest request, HttpServletResponse response) {
    }

}
