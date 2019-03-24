/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.Usuario;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kenneth
 */
@WebServlet(name = "BuscarUsuarios", urlPatterns = {"/BuscarUsuarios"})
public class BuscarUsuarios extends HttpServlet {

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
            ArrayList<Usuario> q = new ArrayList<>();
            Usuario u = new Usuario();
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            String ident;
            //String input = request.getParameter("nombre");
            switch (accion) {
                case "buscarTodosUsu":
                    q = Model.instance().buscarTodosUsuarios();
                    json = new Gson().toJson(q);
                    out.print(json);
                    break;
                case "buscarUsuarioId":
                    ident = request.getParameter("identificacion");
                    u = Model.instance().getUsuarioCed(ident);
                    json = new Gson().toJson(u);
                    out.print(json);
                    break;
                case "modificarTipoUsuario":
                    this.ModificarTipoUsuario(request, response);
                    out.print("C~U");
                    break;
                case "verificaPrestamosUsu":
                    ident = request.getParameter("identificacion");
                    u = Model.instance().verificaPrestamosUsu(ident);
                    json = new Gson().toJson(u);
                    out.print(json);
                    break;
                case "modificarEstadoUsuario":
                    this.modificarEstadoUsuario(request, response);
                    out.print("C~U");
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

    protected void ModificarTipoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario u = new Usuario();
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            String identificacion =request.getParameter("identificacion");
            u.setIdentificacion(identificacion);
            u.setTipo(tipo);
            
            Model.instance().modificarTipoUsuario(u);

        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }
    
    protected void modificarEstadoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int habilitado = Integer.parseInt(request.getParameter("habilitado"));
            String identificacion =request.getParameter("identificacion");
            Model.instance().modificarEstadoUsuario(identificacion, habilitado);
        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

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
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
