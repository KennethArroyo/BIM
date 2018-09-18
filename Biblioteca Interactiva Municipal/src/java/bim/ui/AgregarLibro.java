package bim.ui;
import com.google.gson.Gson;
import bim.entidades.Asignatura;
import bim.entidades.Libro;
import bim.logica.Model;
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
@WebServlet(name = "AgregarLibro", urlPatterns = {"/AgregarLibro","/GetAsignaturas"})
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
                    this.agregarLibro(request, response);
                    break;
                case "/GetAsignaturas":
                    this.buscarAsignatura(request, response);
                    break;
            }
        }
    
    protected int convert(String estado){
    if(estado.equals("Bueno")) return 1;
    if(estado.equals("Regular")) return 2;
    if(estado.equals("Malo")) return 3;
    else return 0;
    }
    
    protected void agregarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            int fisico; int digital;
            Asignatura asig=new Asignatura();
            asig.setId(1);
            Libro p = new Libro();
            HttpSession s = request.getSession(true);
            String clasificacion = request.getParameter("clasificacion");
            String titulo = request.getParameter("titulo");
            int asignatura = Integer.parseInt(request.getParameter("asignatura"));
            int cant = Integer.parseInt(request.getParameter("copias"));
            String [] list = request.getParameterValues("fisico");
            if(list!=null){
                fisico=Integer.parseInt(list[0]);
                p.setFisico(fisico);
            }
            else fisico=0;
            String [] list2 = request.getParameterValues("digital");
            if(list2!=null){
                digital=Integer.parseInt(list2[0]);
                p.setDigital(digital);
                 Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                OutputStream fotoFile = new FileOutputStream(new File(getServletContext().getRealPath("/")+"Libros/"+fileName));
                InputStream fotoReader = filePart.getInputStream();
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = fotoReader.read(bytes)) != -1) {
                fotoFile.write(bytes, 0, read);
            }
            fotoFile.close();
            }
            else fisico=0;
            String estado = request.getParameter("estado");
            String autor = request.getParameter("autor");
            String comentario = request.getParameter("comentario");
            
            //Asignatura asig = (Asignatura)Model.instance().buscarEmpresaNombre(asignatura);
            p.setClasificacion(clasificacion);
            p.setAutor(autor);
            p.setCantidad_copias(cant);
            p.setEstado(convert(estado));
            p.setAsignatura(asig);
            p.setComentario(comentario);
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

    private void buscarAsignatura(HttpServletRequest request, HttpServletResponse response) {
        try{
        ArrayList<Asignatura> q = new ArrayList<Asignatura>();
        BufferedReader reader = request.getReader();
        PrintWriter out = response.getWriter(); 
        HttpSession s = request.getSession(true);
        Gson gson = new Gson();
        q = Model.instance().listarAsignaturas(); 
        response.setContentType("application/json; charset=UTF-8");
        out.write(gson.toJson(q));
        response.setStatus(200); // ok with content
         }
          catch(Exception e) {	
        String text=e.getMessage();
        response.setStatus(401); //Bad request
      }	
    }

}