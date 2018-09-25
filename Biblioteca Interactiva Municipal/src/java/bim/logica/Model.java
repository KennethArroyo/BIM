package bim.logica;

import bim.datos.Dao;
import bim.entidades.Asignatura;
import bim.entidades.Libro;
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
}