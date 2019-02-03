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
@WebServlet(name = "UsuarioEnSesion", urlPatterns = {"/UsuarioEnSesion"})
public class UsuarioAdmin extends HttpServlet {

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
            String input = request.getParameter("identificacion");
            Usuario u;
            switch (accion) {
                case "BuscarUsuario":
                    u = Model.instance().getUsuarioCed("304830405");
//                    String x = Desencriptar(u.getContrasena());
//                    u.setContrasena(x);
                    json = new Gson().toJson(u);
                    out.print(json);
                    break;
                case "EditarUsuario":
                    this.modificarUsuario(request, response);
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
    

protected void modificarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try{
        
        Usuario u = new Usuario();
        
        String identificacion = request.getParameter("identificacion");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String lugar_residencia = request.getParameter("lugar_residencia");
        String telefono = request.getParameter("telefono");
        String ref_trab_est = request.getParameter("ref_trab_est");
        
        u.setIdentificacion(identificacion);
        u.setNombre(nombre);
        u.setApellidos(apellidos);
        u.setLugar_residencia(lugar_residencia);
        u.setTelefono(telefono);
        u.setRef_trab_est(ref_trab_est);
        
        Model.instance().modificarUsuario(u);
        
    
    }catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
