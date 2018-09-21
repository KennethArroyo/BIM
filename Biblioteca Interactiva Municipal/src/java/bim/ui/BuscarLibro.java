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
@WebServlet(name = "BuscarLibro", urlPatterns = {"/BuscarLibro"})
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
        PrintWriter out = response.getWriter();
        try {
            String json;
            ArrayList<Libro> q = new ArrayList<Libro>();
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            String input=request.getParameter("nombre");
            switch (accion) {
                case "buscarLibroAutor":
                    //ArrayList<Libro> q = new ArrayList<Libro>();                 
                    q = Model.instance().buscarLibroAutor(input);
                    json = new Gson().toJson(q);
                    out.print(json);
                    break;
                case "buscarLibroTitulo":
                    //ArrayList<Libro> q = new ArrayList<Libro>();                 
                    q = Model.instance().buscarLibroTitulo(input);
                    json = new Gson().toJson(q);
                    out.print(json);
                    break;
                case "buscarLibroClasificacion":
                    //ArrayList<Libro> q = new ArrayList<Libro>();                 
                    q = Model.instance().buscarLibroClasificacion(input);
                    json = new Gson().toJson(q);
                    out.print(json);
                    break;
                case "buscarLibroAsignatura":
                    //ArrayList<Libro> q = new ArrayList<Libro>();                 
                    q = Model.instance().buscarLibroAsignatura(input);
                    json = new Gson().toJson(q);
                    out.print(json);
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;

            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
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
