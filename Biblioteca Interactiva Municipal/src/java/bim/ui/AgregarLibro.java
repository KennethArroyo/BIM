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
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@WebServlet(name = "AgregarLibro", urlPatterns = {"/AgregarLibro", "/GetAsignaturas","/AgregarAsignatura","/ModificarAsig","/EliminarAsig"})
@MultipartConfig
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
            throws ServletException, IOException, Exception {

        switch (request.getServletPath()) {
            case "/AgregarLibro":
                this.agregarLibro(request, response);
                break;
            case "/GetAsignaturas":
                this.buscarAsignatura(request, response);
                break;
            case "/AgregarAsignatura":
                this.agregarAsignatura(request, response);
                break;
            case "/ModificarAsig":
                this.ModificarAsignatura(request, response);
                break;
            case "/EliminarAsig":
                this.EliminarAsignatura(request, response);
                break;
        }
    }

    protected int convert(String estado) {
        if (estado.equals("Bueno")) {
            return 1;
        }
        if (estado.equals("Regular")) {
            return 2;
        }
        if (estado.equals("Malo")) {
            return 3;
        } else {
            return 0;
        }
    }

    protected void agregarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int fisico;
            int digital;
            Part PartImagen;
            Asignatura asig = new Asignatura();
            Libro p = new Libro();
            HttpSession s = request.getSession(true);
            String clasificacion = request.getParameter("clasificacion");
            String titulo = request.getParameter("titulo");
            int asignatura = Integer.parseInt(request.getParameter("asignatura"));
            asig.setId(asignatura);
            int cant = Integer.parseInt(request.getParameter("copias"));
            int tamano = (int) request.getPart("imagenPDF").getSize();
                if(tamano != 0){
                    PartImagen = request.getPart("imagenPDF");
                    String nombreImagen = Paths.get(PartImagen.getSubmittedFileName()).getFileName().toString();
                    String tipo = getServletContext().getMimeType(nombreImagen);
                    OutputStream salida = new FileOutputStream(new File(getServletContext().getRealPath("/") + "Portadas/" + nombreImagen));
                    String caminoImagen = Paths.get(getServletContext().getRealPath("/") + "Portadas/", nombreImagen).toString();
                    p.setDir_portada(caminoImagen);
                    InputStream contenido1 = PartImagen.getInputStream();
                    int leido = 0;
                    final byte[] bytes = new byte[1024];
                    while ((leido = contenido1.read(bytes)) != -1) {
                        salida.write(bytes, 0, leido);
                    }
                    salida.close();
                }
            
            String[] listaF = request.getParameterValues("fisico");
            if (listaF != null) {
                fisico = Integer.parseInt(listaF[0]);
                p.setFisico(fisico);
            } else {
                fisico = 0;
            }
            
            String[] listaD = request.getParameterValues("digital");
            if (listaD != null) {
                digital = Integer.parseInt(listaD[0]);
                p.setDigital(digital);
                Part partPDF = request.getPart("file"); // Retrieves <input type="file" name="file">
                String nombrePDF = Paths.get(partPDF.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                //String path = getServletContext().getRealPath("/");
                OutputStream salida2 = new FileOutputStream(new File(getServletContext().getRealPath("/") + "Libros/" + nombrePDF));
                String caminoPDF = Paths.get(getServletContext().getRealPath("/") + "Portadas/", nombrePDF).toString();
                p.setDir_PDF(caminoPDF);
                InputStream contenido = partPDF.getInputStream();
                int leido = 0;
                final byte[] bytes = new byte[1024];
                while ((leido = contenido.read(bytes)) != -1) {
                    salida2.write(bytes, 0, leido);
                }
                salida2.close();
            } else {
                digital = 0;
                p.setDir_PDF("");
            }
            
            String estado = request.getParameter("estado");
            String autor = request.getParameter("autor");
            String comentario = request.getParameter("comentario");

            
            p.setClasificacion(clasificacion);
            p.setAutor(autor);
            p.setCantidad_copias(cant);
            p.setEstado(convert(estado));
            p.setAsignatura(asig);
            p.setComentario(comentario);
            p.setTitulo(titulo);
            if(cant >= 1) {
                p.setHabilitado(1);
            }
            if(cant < 1) {
                p.setHabilitado(0);
            }
       

            Model.instance().agregarLibro(p);
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Ocurrió un error");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    
    private void buscarAsignatura(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<Asignatura> q = new ArrayList<Asignatura>();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            q = Model.instance().listarAsignaturas();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(q));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }
    
    protected void agregarAsignatura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception{
    Asignatura asig = new Asignatura();
    Model.instance().agregarAsignatura(request.getParameter("asignatura"));
    request.getRequestDispatcher("asignaturas.jsp").forward(request, response);
    }
    
    
    protected void ModificarAsignatura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception{
         try {
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            Gson gson = new Gson();
            Model.instance().modificarAsignatura(Integer.parseInt(request.getParameter("id")),request.getParameter("nombre"));
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson("correcto")); 
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            String text = e.getMessage();
            response.setStatus(401); //Bad request
        }
    }
    
    protected void EliminarAsignatura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception{
        try {
                BufferedReader reader = request.getReader();
                PrintWriter out = response.getWriter();
                HttpSession s = request.getSession(true);
                Gson gson = new Gson();
                Model.instance().eliminarAsignatura(Integer.parseInt(request.getParameter("id")));
                response.setContentType("application/json; charset=UTF-8");
                out.write(gson.toJson("correcto")); 
                response.setStatus(200); // ok with content
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AgregarLibro.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AgregarLibro.class.getName()).log(Level.SEVERE, null, ex);
        }
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
