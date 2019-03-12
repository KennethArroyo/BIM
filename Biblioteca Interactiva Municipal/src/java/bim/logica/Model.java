package bim.logica;

import bim.datos.Dao;
import bim.entidades.Actividad;
import bim.entidades.Asignatura;
import bim.entidades.Autor;
import bim.entidades.Libro;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import java.sql.SQLException;
import java.sql.Timestamp;
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
    
    public ArrayList<Libro> buscarTodosLibros() throws Exception{
    return dao.buscarTodosLibros();
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

    public ArrayList<Autor> buscarUltimosAutores() throws Exception {
        return dao.buscarUltimosAutores();
    }

    public void agregarAutor(String autor) throws Exception {
        dao.agregarAutor(autor);
    }

    public void modificarAutor(int id, String nombre) {
        dao.modificarAutor(id,nombre);
    }

    public void eliminarAutor(int id) throws Exception {
        dao.eliminarAutor(id);
    }

    public ArrayList<Autor> obtenerAutoresId(ArrayList<String> autores) throws Exception {
        return dao.obtenerAutoresId(autores);
    }

    public void guardarAutorLibro(ArrayList<Autor> datos, String titulo) throws Exception {
        dao.guardarAutorLibro(datos, titulo);
    }

    public Usuario buscarUsRegistrado(String usuario, String contrasena) throws Exception {
        return dao.buscarUsRegistrado(usuario, contrasena);
    }
    
    public ArrayList<Usuario> buscarTodosUsuarios()throws Exception{
    return dao.buscarTodosUsuarios();
    }
    
    public void modificarUsuario(Usuario u) throws Exception{
    dao.modificarUsuario(u);
    }

    public int buscarIdUsuarioCorreo(String correo) throws Exception {
        return dao.buscarIdUsuarioCorreo(correo);
    }

    public void registrarTemporal(Timestamp timestamp, String temporal, int id) throws Exception {
        dao.registrarTemporal(timestamp, temporal, id);
    }

    public void cambiarClaveTemporal(String temporal, String contrasena) throws SQLException {
        dao.actualizarUsuarioTemporal(temporal, contrasena);
    }
    
    public ArrayList<Prestamo> buscarPrestamosUsuario(String identificacion)throws Exception{
    return dao.buscarPrestamosUsuario(identificacion);
    }

    public void agregarActividad(String nombre, String caminoImagen) throws SQLException {
        dao.agregarActividad(nombre,caminoImagen);
    }

    public ArrayList<Actividad> buscarActividades() throws Exception {
       return dao.actividadesBuscarTodas();
    }

    public void eliminarActividad(int id) throws SQLException {
        dao.eliminarActividad(id);
    }

    public String obtenerDirActividad(int id) {
        return dao.obtenerDirActividad(id);
    }

}