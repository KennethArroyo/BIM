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
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        return p;
    }
    
   private Libro libro(ResultSet rs) throws Exception{
        Libro o = new Libro();
        Asignatura a = new Asignatura();
        a = asignatura(rs);
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
        String sql = "insert into Libro(clasificacion,titulo,autor,comentario,estado,cantidad_copias,habilitado,fisico,digital,asignatura_ID) "
                + "values('%s','%s','%s','%s',%d,%d,%d,%d,%d,%d)"; 
        sql = String.format(sql, p.getClasificacion(), p.getTitulo(), p.getAutor(), p.getComentario(), p.getEstado(), p.getCantidad_copias(),
               p.getHabilitado(),p.getFisico(),p.getDigital(),p.getAsignatura().getId());
        int count = db.executeUpdate(sql);
        if(count == 0) {
            throw new Exception("Error ingresando el libro!");
        }
    }
    
    /* no funciona con las direcicones por ser tal largas, hablar con ronald y karolais
    public void agregarLibro(Libro p) throws Exception {
        String sql = "insert into Libro(clasificacion,titulo,autor,comentario,estado,cantidad_copias,dir_portada,dir_PDF,habilitado,fisico,digital,asignatura_ID) "
                + "values('%s','%s','%s','%s',%d,%d,'%s','%s',%d,%d,%d,%d)"; 
        sql = String.format(sql, p.getClasificacion(), p.getTitulo(), p.getAutor(), p.getComentario(), p.getEstado(), p.getCantidad_copias(),
                p.getDir_portada(),p.getDir_PDF(),p.getHabilitado(),p.getFisico(),p.getDigital(),p.getAsignatura().getId());
        int count = db.executeUpdate(sql);
        if(count == 0) {
            throw new Exception("Error ingresando el libro!");
        }
    }
    
    */
    
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
        String sql="select * from Libro l, Asignatura a where l.autor like '%%%s%%' and l.asignatura_ID = a.id";
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
        String sql="select * from Libro l, Asignatura a where l.titulo like '%%%s%%' and l.asignatura_ID = a.id";
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
        String sql="select * from Libro l, Asignatura a where l.clasificacion like '%%%s%%' and l.asignatura_ID = a.id";
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
        String sql="select * from Libro l, Asignatura a where l.asignatura_ID = a.id and a.nombre like '%%%s%%'";
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
    
    public Libro buscarLibroId(int id)throws Exception{
        Libro libro = new Libro();
        try {
        String sql="select * from Libro l, Asignatura a where l.id=%d and l.asignatura_ID = a.id";
        sql = String.format(sql, id);
        ResultSet rs = db.executeQuery(sql);
        rs.next();
        libro=libro(rs);
        }
        catch(SQLException ex){
        String error = ex.getMessage();
        error="s";
        }
        return libro;
    }
       
    public Libro modificarLibro(Libro l)throws Exception{
    String sql="update Libro set clasificacion='%s',titulo='%s',autor='%s',comentario='%s',estado=%d,cantidad_copias=%d, habilitado=%d, fisico=%d,digital=%d,asignatura_ID=%d where clasificacion='%s'";
    sql= String.format(sql,l.getClasificacion(),l.getTitulo(),l.getAutor(),l.getComentario(),l.getEstado(),l.getCantidad_copias(), l.getHabilitado(), l.getFisico(),l.getDigital(),l.getAsignatura().getId(),l.getClasificacion());
    db.executeQuery(sql);
    return buscarLibroId(l.getId());
    }
}