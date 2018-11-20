package bim.logica;

import bim.datos.Dao;
import bim.entidades.Asignatura;
import bim.entidades.Autor;
import bim.entidades.Libro;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import java.util.ArrayList;


/**
 *
 * @author Sergio
 */
public class Model {
    private Dao dao;
    
    private static Model uniqueInstance;
    
    public static Model instance() {
        if(uniqueInstance == null) {
            uniqueInstance = new Model();
        }
        return uniqueInstance;
    }
    
    private Model() {
        dao = new Dao();
    }
    
    public Asignatura buscarAsignatura(String nombre){
    return dao.buscarAsignatura(nombre);
    }

    public void agregarLibro(Libro p) throws Exception {
        dao.agregarLibro(p);
    }
    public void registrarUsuario(Usuario u) throws Exception {
        dao.agregarUsuario(u);
    }
    
    public void agregarPrestamo(Prestamo p)throws Exception{
    dao.agregarPrestamo(p);
    }
    
    public Usuario verificarCuenta(String correo, String codigo) throws Exception {
        return dao.verificarCuenta(correo, codigo);
    }
    
    public ArrayList<Asignatura> listarAsignaturas() throws Exception {
        return dao.listarAsignaturas();
    }
    
    public ArrayList<Libro> buscarLibroAutor(String autor) throws Exception {
        return dao.buscarLibroAutor(autor);
    }
    
    public ArrayList<Libro> buscarLibroTitulo(String titulo) throws Exception {
        return dao.buscarLibroTitulo(titulo);
    }
    
    public ArrayList<Libro> buscarLibroAsignatura(String asignatura) throws Exception {
        return dao.buscarLibroAsignatura(asignatura);
    }
    
    public ArrayList<Libro> buscarLibroClasificacion(String clasificacion) throws Exception {
        return dao.buscarLibroClasificacion(clasificacion);
    }
    public Libro buscarLibroId(int id)throws Exception{
        return dao.buscarLibroId(id);
    }
    public Libro modificarLibro(Libro l)throws Exception{
    return dao.modificarLibro(l);
    }
    
    public Asignatura getAsigantura(int id)throws Exception{
    return dao.getAsigantura(id);
    }
    public Usuario getUsuarioCed(String ced)throws Exception{
    return dao.buscarUsuarioCed(ced);
    }

    public int verificarUsuario(String ced) {
        return dao.verificarUsuario(ced);
    }

    public void agregarAsignatura(String asig) throws Exception{
        dao.agregarAsignatura(asig);
    }

    public void modificarAsignatura(int id,String nombre) {
        dao.modificarAsignatura(id,nombre);
    }

    public void eliminarAsignatura(int id) throws Exception {
        dao.eliminarAsignatura(id);
    }

    public ArrayList<Autor> listarAutores() throws Exception {
        return dao.listarAutores();
    }
}