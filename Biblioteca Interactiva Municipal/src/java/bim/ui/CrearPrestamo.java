/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Prestamo;
import bim.logica.Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
            Prestamo p = new Prestamo();
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            switch(accion){
                case "solicitarPrestamo":
                    String fechatxtIni = request.getParameter("fechaInicio");
                    DateFormat formatNac = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date dateNac = formatNac.parse(fechatxtIni);
                    p.setFecha_inicio((java.sql.Date) dateNac);
                    p.setNumero(1);
                    p.setFecha_final((java.sql.Date) dateNac);
                    p.setUsuario_ced("304830405");
                    p.setEstado_ID(1);
                    Integer libroID = Integer.parseInt(request.getParameter("idLibro"));
                    p.setLibro_ID(libroID);
                    Model.instance().agregarPrestamo(p);
                    out.print("C~El libro fue modificado correctamente");
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizarse");
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
