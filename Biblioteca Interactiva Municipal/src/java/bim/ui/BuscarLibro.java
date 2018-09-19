/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Asignatura;
import bim.entidades.Libro;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "BuscarLibro", urlPatterns = {"/buscarLibroAutor"})
public class BuscarLibro extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");          
            switch(request.getServletPath()){
                case "/buscarLibroAutor":
                    buscarLibroAutor(request,response);
                break;
            }
    }

    protected void buscarLibroAutor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        try {
            ArrayList<Libro> q = new ArrayList<Libro>();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter(); 
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            String a = request.getParameter("buscar");
            q= Model.instance().buscarLibro(a);
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(q));
            response.setStatus(200);
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
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

}
