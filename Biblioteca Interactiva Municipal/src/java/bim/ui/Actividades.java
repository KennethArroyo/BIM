/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Actividad;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@WebServlet(name = "Actividad", urlPatterns = {"/Actividad", "/EliminarAct", "/BuscarAct"})
public class Actividades extends HttpServlet {

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
        
        switch (request.getServletPath()) {
            case "/Actividad":
                this.agregar(request, response);
                break;
            case "/EliminarAct":
                this.eliminar(request, response);
                break;
            case "/BuscarAct":
                this.buscar(request, response);
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

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
        Part PartImagen;
        String nombre = request.getParameter("nombre");
         PartImagen = request.getPart("imagen");
                    String nombreImagen = Paths.get(PartImagen.getSubmittedFileName()).getFileName().toString();
                    String tipo = getServletContext().getMimeType(nombreImagen);
                    OutputStream salida = new FileOutputStream(new File(getServletContext().getRealPath("/") + "Actividades/" + nombreImagen));
                    String caminoImagen = Paths.get(getServletContext().getRealPath("/") + "Actividades/", nombreImagen).toString();
                    InputStream contenido1 = PartImagen.getInputStream();
                    int leido = 0;
                    final byte[] bytes = new byte[1024];
                    while ((leido = contenido1.read(bytes)) != -1) {
                        salida.write(bytes, 0, leido);
                    }
                    salida.close();
                    Model.instance().agregarActividad(nombre,caminoImagen);
                    request.getRequestDispatcher("mantenimientoActividades.jsp").forward(request, response);
        }
        catch(Exception ex){
            request.setAttribute("error", "Ocurrió un error al agregar actividad");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Actividad act;
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            act = Model.instance().buscarActividades();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(act));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

}
