/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Asignatura;
import bim.entidades.Libro;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet(name = "CrearPrestamoUs", urlPatterns = {"/CrearPrestamoUs", "/VerificarUs"})
public class CrearPrestamoUs extends HttpServlet {

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
            case "/CrearPrestamoUs":
                this.agregarPrestamo(request, response);
                break;
            case "/VerificarUs":
                this.verificarUsuario(request, response);
                break;
        }
    }

    private void agregarPrestamo(HttpServletRequest request, HttpServletResponse response) {

        try {
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            response.setContentType("application/json; charset=UTF-8");
            Prestamo prestamo = gson.fromJson(reader, Prestamo.class);
            Usuario us = Model.instance().getUsuarioCed(String.valueOf(prestamo.getUsuario_ID()));
            prestamo.setUsuario_ID(us.getId());
            Calendar calendar = Calendar.getInstance();
            String fechatxtIni = prestamo.getFecha_inicio();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(fechatxtIni);
            calendar.setTime(date); // Configuramos la fecha que se recibe
            calendar.add(Calendar.DAY_OF_YEAR, 8); // numero de días a añadir, o restar en caso de días<0
            Date fecha_dev = calendar.getTime(); // Devuelve el objeto Date con los nuevos días añadidos
            String dev = format.format(fecha_dev);
            prestamo.setFecha_final(dev);
            prestamo.setEstado_ID(1);
            Model.instance().agregarPrestamo(prestamo);
            //se baja la cantidad del libro a -1
            Libro l = Model.instance().buscarLibroId(prestamo.getLibro_ID());
            int total_copias = l.getCantidad_copias() - 1;
            l.setCantidad_copias(total_copias);
            Model.instance().modificarLibro(l);

            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }

    private void verificarUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ced = request.getParameter("cedUsuario");
            int cantidad = Model.instance().verificarUsuario(ced);
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            response.setContentType("application/json; charset=UTF-8");
            if (cantidad == 1) {
                out.write(gson.toJson(cantidad));
                response.setStatus(200); // ok with content
            } else {
                response.setStatus(401);
            }
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
