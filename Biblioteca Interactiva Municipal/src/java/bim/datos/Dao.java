package bim.datos;
import bim.entidades.Asignatura;
import bim.entidades.Libro;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dao {
    RelDataBase db;
    
    public Dao() {
        db = new RelDataBase();
    }
    
    private Asignatura asignatura(ResultSet rs) throws Exception{
        Asignatura p = new Asignatura();
        p.setId(rs.getInt("ID"));
        p.setNombre(rs.getString("Nombre"));
        return p;
    }
    
   private Libro libro(ResultSet rs) throws Exception{
        Libro o = new Libro();
        Asignatura a = new Asignatura();
        o.setId(rs.getInt("ID"));
        o.setClasificacion(rs.getString("Clasificacion"));
        o.setAutor(rs.getString("Autor"));
        o.setTitulo(rs.getString("Titulo"));
        o.setEstado(rs.getInt("Estado"));
        o.setComentario(rs.getString("Comentario"));
        o.setCantidad_copias(rs.getInt("Cantidad_copias"));
        o.setFisico(rs.getInt("Fisico"));
        o.setDigital(rs.getInt("Digital"));
        o.setDir_portada(rs.getString("Dir_portada"));
        o.setDir_PDF(rs.getString("Dir_PDF"));
        a.setId(rs.getInt("Asignatura_ID"));
        o.setAsignatura(a);
        return o;
    }

    public Asignatura buscarAsignatura(String nombre) {
        Asignatura n=new Asignatura();
        return n;
    }

    public void agregarLibro(Libro p) throws Exception {
        String sql = "insert into Libro(clasificacion,titulo,autor,comentario,cantidad_copias,fisico,digital,asignatura_ID) "
                + "values('%s','%s','%s','%s',%d,%d,%d,%d)"; 
        sql = String.format(sql, p.getClasificacion(), p.getTitulo(), p.getAutor(), p.getComentario(), p.getCantidad_copias(),
                p.getFisico(),p.getDigital(),p.getAsignatura().getId());
        int count = db.executeUpdate(sql);
        if(count == 0) {
            throw new Exception("Error ingresando el libro!");
        }
    }
    
    public ArrayList<Asignatura> listarAsignaturas() throws Exception {
        ArrayList<Asignatura> lista = new ArrayList<Asignatura>();
        try{
            String sql="select * from Asignatura";
            ResultSet rs = db.executeQuery(sql);
            while(rs.next()){
            lista.add(asignatura(rs));
            }
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        }
        return lista;
    }
    
    public ArrayList<Libro> buscarLibroAutor(String autor)throws Exception{
        ArrayList<Libro> libros= new ArrayList<Libro>();
        try {
        String sql="select * from Libro where autor = '%s'";
        sql = String.format(sql, autor);
        ResultSet rs = db.executeQuery(sql);
        while(rs.next()){
        libros.add(libro(rs));
        }
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        error="s";
        }
        return libros;
    }
    
    public ArrayList<Libro> buscarLibroTitulo(String titulo)throws Exception{
        ArrayList<Libro> libros= new ArrayList<Libro>();
        try {
        String sql="select * from Libro where titulo = '%s'";
        sql = String.format(sql, titulo);
        ResultSet rs = db.executeQuery(sql);
        while(rs.next()){
        libros.add(libro(rs));
        }
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        error="s";
        }
        return libros;
    }
    
    public ArrayList<Libro> buscarLibroClasificacion(String clasificacion)throws Exception{
        ArrayList<Libro> libros= new ArrayList<Libro>();
        try {
        String sql="select * from Libro where clasificacion = '%s'";
        sql = String.format(sql, clasificacion);
        ResultSet rs = db.executeQuery(sql);
        while(rs.next()){
        libros.add(libro(rs));
        }
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        error="s";
        }
        return libros;
    }
    
    public ArrayList<Libro> buscarLibroAsignatura(String asignatura)throws Exception{
        ArrayList<Libro> libros= new ArrayList<Libro>();
        try {
        String sql="select * from Libro, Asignatura where = '%s' ";
        sql = String.format(sql, asignatura);
        ResultSet rs = db.executeQuery(sql);
        while(rs.next()){
        libros.add(libro(rs));
        }
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        error="s";
        }
        return libros;
    }
}