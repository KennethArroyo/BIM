/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.ui;

import bim.entidades.ModeloPrestamo;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import bim.logica.Model;
import com.google.gson.Gson;
import java.io.BufferedReader;
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
 * @author esteban
 */
@WebServlet(name = "BuscarPrestamos", urlPatterns = {"/BuscarPrestamos"})
public class BuscarPrestamos extends HttpServlet {

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
        
            ArrayList<ModeloPrestamo> prestamos2= new ArrayList<>();
            Prestamo p = new Prestamo();
            Usuario u;
            int id;
            switch(accion){
                case "BuscarPrestamosUser":
                    u = Model.instance().getUsuarioCed(request.getParameter("identificacion"));
                   //String identificacion = request.getParameter("identificacion");
                    id = u.getId();
                    prestamos2 = Model.instance().buscarPrestamosUsuario(id);
                    json= new Gson().toJson(prestamos2);
                    out.print(json);
                    break;
                case "BuscarTodosPrestamos":
                    ArrayList<ModeloPrestamo> lista= new ArrayList<>();
                    lista =Model.instance().buscarTodosPrestamos();
                    json= new Gson().toJson(lista);
                    out.print(json);
                    break;
                case "BuscarPrestamosSolicitados":
                    ArrayList<ModeloPrestamo> solicitados= new ArrayList<>();
                    solicitados = Model.instance().PrestamosSolicitados();
                    json = new Gson().toJson(solicitados);
                    out.print(json);
                    break;
                case "BuscarLibrosPrestados":
                    ArrayList<ModeloPrestamo> prestados= new ArrayList<>();
                    prestados = Model.instance().buscarLibrosPrestados();
                    json = new Gson().toJson(prestados);
                    out.print(json);
                    break;
                case "BuscarPrestamoId":
                    id = Integer.parseInt(request.getParameter("id"));
                    p = Model.instance().buscarPrestamoId(id);
                    json= new Gson().toJson(p);
                    out.print(json);
                    break;
                    
                case "ModificarEstadoPrestamo":
                    this.ModificarEstadoPrestamo(request, response);
                    out.print("C~U");
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
protected void ModificarEstadoPrestamo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
    Prestamo p = new Prestamo();
    int estado=Integer.parseInt(request.getParameter("estado"));
    int id = Integer.parseInt(request.getParameter("id"));
    int libro=Integer.parseInt(request.getParameter("libro_ID"));
    p.setEstado_ID(estado);
    p.setId(id);
    if(estado==3){
        Model.instance().devolucionLibro(libro);
    Model.instance().modificarEstadoPrestamo(p);
    }
    else
        Model.instance().modificarEstadoPrestamo(p);
    
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
