/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Libro;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import bim.logica.Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author esteban
 */
@WebServlet(name = "CrearPrestamo", urlPatterns = {"/CrearPrestamo"})
public class CrearPrestamo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Usuario u = new Usuario();
            Prestamo p = new Prestamo();
            Calendar calendar = Calendar.getInstance();
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            switch (accion) {
                case "solicitarPrestamo":
                    String fechatxtIni = request.getParameter("fechaInicio");
                    String identif = request.getParameter("ident");
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = format.parse(fechatxtIni);
                    calendar.setTime(date); // Configuramos la fecha que se recibe
                    calendar.add(Calendar.DAY_OF_YEAR, 8); // numero de días a añadir, o restar en caso de días<0
                    Date fecha_dev = calendar.getTime(); // Devuelve el objeto Date con los nuevos días añadidos
                    String dev = format.format(fecha_dev);
                    p.setFecha_inicio(fechatxtIni);
                    p.setFecha_final(dev);
                    p.setEstado_ID(1);
                    u = Model.instance().getUsuarioCed(identif);
                    p.setUsuario_ID(u.getId());
                    Integer ident = Integer.parseInt(request.getParameter("idLibro"));
                    Libro l = Model.instance().buscarLibroId(ident);
                    p.setLibro_ID(l.getId());
                    Model.instance().agregarPrestamo(p);
                    out.print("C~El prestamo fue realizdo correctamente");
                    //se baja la cantidad del libro a -1;
                    int total_copias=l.getCantidad_copias()-1;
                    l.setCantidad_copias(total_copias);
                    Model.instance().modificarLibro(l);
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizarse");
                    break;

            }
        } catch (NumberFormatException e) {
            String x = e.getMessage();
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
