/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Sancion;
import bim.entidades.Usuario;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
 * @author esteban montero
 */
@WebServlet(name = "Sanciones", urlPatterns = {"/Sanciones"})
public class Sanciones extends HttpServlet {

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
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            switch (accion) {
                case "CrearSancion":
                    this.agregarSancion(request, response);
                    out.print("C~U");
                    break;
                case "VerificarSancion":
                    Sancion s = this.verificarSancion(request, response);
                    json = new Gson().toJson(s);
                    out.print(json);
                    break;
                default:
                    out.print("E~");
                    break;
            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
        }
    }

    protected void agregarSancion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

        try {
            Sancion s = new Sancion();
            Calendar calendar = Calendar.getInstance();
            Usuario u;
            String fechatxtIni = request.getParameter("factual");
            String ced = request.getParameter("usuario");
            int cantDias = Integer.parseInt(request.getParameter("cantDias"));

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(fechatxtIni);
            calendar.setTime(date); // Configuramos la fecha que se recibe
            calendar.add(Calendar.DAY_OF_YEAR, cantDias); // numero de días a añadir, o restar en caso de días<0
            Date fecha_dev = calendar.getTime(); // Devuelve el objeto Date con los nuevos días añadidos
            String finSancion = format.format(fecha_dev);

            u = Model.instance().getUsuarioCed(ced);

            s.setFecha_inicio(fechatxtIni);
            s.setFecha_final(finSancion);
            s.setEstado(1);
            s.setUsuario_ID(u.getId());

            Model.instance().agregarSancion(s);

        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("error", "Ocurrió un error");
        }
    }

    protected Sancion verificarSancion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        Sancion s = new Sancion();
        Date fechaActual = new Date();
        try {
            String ced = request.getParameter("usuario");
            s = Model.instance().verficarSancion(ced);
            String fechaFinal = s.getFecha_final();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaFinalDate = format.parse(fechaFinal);
            if (fechaFinalDate.compareTo(fechaActual) >= 0) {
                s.setEstado(1);
            } else {
                s.setEstado(0);
            }
        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("error", "Ocurrió un error");
        }

        return s;
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
