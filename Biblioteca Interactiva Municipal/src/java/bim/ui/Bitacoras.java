/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.BitacoraLib;
import bim.entidades.BitacoraPrest;
import bim.entidades.BitacoraUs;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Sergio
 */
@WebServlet(name = "Bitacoras", urlPatterns = {"/BitacorasLibros", "/BitacorasUsuarios", "/BitacorasPrestamos"})
public class Bitacoras extends HttpServlet {

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
        try {
            switch (request.getServletPath()) {
            case "/BitacorasLibros":
                this.bitacorasLibro(request, response);
                break;
            case "/BitacorasUsuarios":
                this.bitacorasUsuario(request, response);
                break;
            case "/BitacorasPrestamos":
                this.bitacorasPrestamo(request, response);
                break;
            }
        }
        catch(Exception e){
        String msg = e.getMessage();
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

    private void bitacorasLibro(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        try{
        PrintWriter out = response.getWriter();
        String json;
        ArrayList<BitacoraLib> solicitados= new ArrayList<>();
        solicitados = Model.instance().bitacorasLib();
        json = new Gson().toJson(solicitados);
        out.print(json);
        response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

    private void bitacorasUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        try{
        PrintWriter out = response.getWriter();
        String json;
        ArrayList<BitacoraUs> solicitados= new ArrayList<>();
        solicitados = Model.instance().bitacorasUs();
        json = new Gson().toJson(solicitados);
        out.print(json);
        response.setStatus(200); // ok with content
        } 
        catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }
    
    private void bitacorasPrestamo(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        try{
        PrintWriter out = response.getWriter();
        String json;
        ArrayList<BitacoraPrest> solicitados= new ArrayList<>();
        solicitados = Model.instance().bitacorasPrest();
        json = new Gson().toJson(solicitados);
        out.print(json);
        response.setStatus(200); // ok with content
        } 
        catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

}
