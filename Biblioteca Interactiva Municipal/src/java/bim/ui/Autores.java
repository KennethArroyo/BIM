/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Asignatura;
import bim.entidades.Autor;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "Autores", urlPatterns = {"/AgregarAutor","/ModificarAutor","/EliminarAutor", "/BuscarAutor", "/BuscarAutores"})
public class Autores extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        switch (request.getServletPath()) {
            case "/AgregarAutor":
                this.agregarAutor(request, response);
                break;
            case "/BuscarAutor":
                this.buscarAutor(request, response);
                break;
            case "/BuscarAutores":
                this.buscarAutores(request, response);
                break;
            case "/ModificarAutor":
                this.modificarAutor(request, response);
                break;
            case "/EliminarAutor":
                this.eliminarAutor(request, response);
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
        } catch (Exception ex) {
            Logger.getLogger(Autores.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(Autores.class.getName()).log(Level.SEVERE, null, ex);
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

    
    private void agregarAutor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        try{
            BufferedReader reader = request.getReader();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            Asignatura asig = new Asignatura();
            response.setContentType("application/json; charset=UTF-8");
            String autor = request.getParameter("autor");
            Model.instance().agregarAutor(autor);
            response.setStatus(200); // ok with content
        }
        catch(Exception e){
            String ms = e.getMessage();
            response.setStatus(401); //Bad request    
        }
    }
    
    private void buscarAutor(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<Autor> q = new ArrayList<Autor>();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            q = Model.instance().buscarUltimosAutores();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(q));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

    private void buscarAutores(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<Autor> q = new ArrayList<Autor>();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            q = Model.instance().buscarUltimosAutores();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(q));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

    private void modificarAutor(HttpServletRequest request, HttpServletResponse response) {
         try {
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            Model.instance().modificarAutor(Integer.parseInt(request.getParameter("id")),request.getParameter("nombre"));
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson("correcto")); 
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

    private void eliminarAutor(HttpServletRequest request, HttpServletResponse response) {
         try {
                BufferedReader reader = request.getReader();
                PrintWriter out = response.getWriter();
                HttpSession s = request.getSession(true);
                Gson gson = new Gson();
                Model.instance().eliminarAutor(Integer.parseInt(request.getParameter("id")));
                response.setContentType("application/json; charset=UTF-8");
                out.write(gson.toJson("correcto")); 
                response.setStatus(200); // ok with content
            } catch (Exception e) {
                String text = e.getMessage();
                response.setStatus(401); //Bad request
            }
    }

}
