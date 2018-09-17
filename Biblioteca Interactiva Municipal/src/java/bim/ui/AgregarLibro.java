package bim.ui;
import bim.entidades.Asignatura;
import bim.entidades.Libro;
import bim.logica.Model;
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
 * @author Sergio
 */
@WebServlet(name = "AgregarLibro", urlPatterns = {"/AgregarLibro"})
public class AgregarLibro extends HttpServlet {

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
            
            switch(request.getServletPath()) {
                case "/AgregarLibro":
                    this.agregarPuesto(request, response);
                    break;
            }
        }
    
    protected int convert(String estado){
    if(estado.equals("Bueno")) return 1;
    if(estado.equals("Regular")) return 2;
    if(estado.equals("Malo")) return 3;
    else return 0;
    }
    
    protected void agregarPuesto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            HttpSession s = request.getSession(true);
            String clasificacion = request.getParameter("clasificacion");
            String titulo = request.getParameter("titulo");
            String asignatura = request.getParameter("asignatura");
            int cant = Integer.parseInt(request.getParameter("copias"));
            String [] list = request.getParameterValues("fisico");
            int fisico=Integer.parseInt(list[0]);
            String [] list2 = request.getParameterValues("digital");
            int digital=Integer.parseInt(list2[0]);
            String estado = request.getParameter("estado");
            String autor = request.getParameter("autor");
            String comentario = request.getParameter("comentario");
            
            //Asignatura asig = (Asignatura)Model.instance().buscarEmpresaNombre(asignatura);
            Asignatura asig=new Asignatura();
            asig.setId(1);
            Libro p = new Libro();
            p.setClasificacion(clasificacion);
            p.setAutor(autor);
            p.setCantidad_copias(cant);
            p.setEstado(convert(estado));
            p.setFisico(fisico);
            p.setAsignatura(asig);
            p.setComentario(comentario);
            p.setDigital(digital);
            p.setTitulo(titulo);
            
            Model.instance().agregarLibro(p);
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
        catch(Exception e) {
            request.setAttribute("error","Ocurrió un error");
            request.getRequestDispatcher("Error.jsp").forward( request, response);
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