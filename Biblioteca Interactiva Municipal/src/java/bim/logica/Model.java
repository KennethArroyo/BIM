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
}