package bim.datos;

import bim.entidades.Asignatura;
import bim.entidades.Libro;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dao {

    RelDataBase db;

    public Dao() {
        db = new RelDataBase();
    }

    private Asignatura asignatura(ResultSet rs) throws Exception {
        Asignatura p = new Asignatura();
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        return p;
    }

    private Libro libro(ResultSet rs) throws Exception {
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

    private Usuario usuario(ResultSet rs) throws Exception {
        Usuario u = new Usuario();
        u.setId(rs.getInt("id"));
        u.setTipo(rs.getInt("tipo"));
        u.setIdentificacion(rs.getString("identificacion"));
        u.setNombre(rs.getString("nombre"));
        u.setApellidos(rs.getString("apellidos"));
        u.setLugar_residencia(rs.getString("lugar_residencia"));
        u.setTelefono(rs.getString("telefono"));
        u.setCorreo(rs.getString("correo"));
        u.setContrasena(rs.getString("contrasena"));
        u.setRef_trab_est(rs.getString("ref_trab_est"));
        return u;
    }

    private Prestamo prestamo(ResultSet rs) throws Exception {
        Prestamo p = new Prestamo();
        p.setId(rs.getInt("id"));
        p.setFecha_inicio(rs.getString("fecha_inicio"));
        p.setFecha_final(rs.getString("fecha_final"));
        p.setEstado_ID(rs.getInt("estado_ID"));
        p.setUsuario_ID(rs.getInt("usuario_ID"));
        p.setLibro_ID(rs.getInt("libro_ID"));
        return p;
    }

    public Asignatura buscarAsignatura(String nombre) {
        Asignatura n = new Asignatura();
        return n;
    }

    public void agregarUsuario(Usuario u) throws Exception {
        String sql = "insert into Usuario(tipo, identificacion, nombre, apellidos, lugar_residencia, telefono, correo, contrasena, ref_trab_est, habilitado, cod_verificacion)"
                + "values(%d, '%s', '%s', '%s', '%s', '%s', '%s', '%s','%s', %d,'%s')";
        sql = String.format(sql, u.getTipo(), u.getIdentificacion(), u.getNombre(), u.getApellidos(), u.getLugar_residencia(),
                u.getTelefono(), u.getCorreo(), u.getContrasena(), u.getRef_trab_est(), u.getHabilitado(), u.getCod_verificacion());
        int count = db.executeUpdate(sql);
        if (count == 0) {
            throw new Exception("Error registrando al usuario!");
        }
    }

    public void agregarLibro(Libro p) throws Exception {
        String sql = "insert into Libro(clasificacion,titulo,autor,comentario,estado,cantidad_copias,habilitado,fisico,digital,asignatura_ID) "
                + "values('%s','%s','%s','%s',%d,%d,%d,%d,%d,%d)";
        sql = String.format(sql, p.getClasificacion(), p.getTitulo(), p.getAutor(), p.getComentario(), p.getEstado(), p.getCantidad_copias(),
                p.getHabilitado(), p.getFisico(), p.getDigital(), p.getAsignatura().getId());
        int count = db.executeUpdate(sql);
        if (count == 0) {
            throw new Exception("Error ingresando el libro!");
        }
    }
    
    public void agregarPrestamo(Prestamo p)throws Exception{
    String sql ="insert into Prestamo(fecha_inicio,fecha_final,usuario_ID,estado_ID,libro_ID)"
            + "values('%s','%s','%s',%d,%d)";
    sql=String.format(sql,p.getFecha_inicio(),p.getFecha_final(),p.getUsuario_ID(),p.getEstado_ID(),p.getLibro_ID());
    int count =db.executeUpdate(sql);
    if(count==0){
    throw new Exception("Error crendo el nuevo prestamo");
    }
    }
    public ArrayList<Asignatura> listarAsignaturas() throws Exception {
        ArrayList<Asignatura> lista = new ArrayList<Asignatura>();
        try {
            String sql = "select * from Asignatura";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                lista.add(asignatura(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
        }
        return lista;
    }

    public ArrayList<Libro> buscarLibroAutor(String autor) throws Exception {
        ArrayList<Libro> libros = new ArrayList<Libro>();
        try {
            String sql = "select * from Libro l, Asignatura a where l.autor like '%%%s%%' and l.asignatura_ID = a.id";
            sql = String.format(sql, autor);
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                libros.add(libro(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return libros;
    }

    public ArrayList<Libro> buscarLibroTitulo(String titulo) throws Exception {
        ArrayList<Libro> libros = new ArrayList<Libro>();
        try {
            String sql = "select * from Libro l, Asignatura a where l.titulo like '%%%s%%' and l.asignatura_ID = a.id";
            sql = String.format(sql, titulo);
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                libros.add(libro(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return libros;
    }

    public ArrayList<Libro> buscarLibroClasificacion(String clasificacion) throws Exception {
        ArrayList<Libro> libros = new ArrayList<Libro>();
        try {
            String sql = "select * from Libro l, Asignatura a where l.clasificacion like '%%%s%%' and l.asignatura_ID = a.id";
            sql = String.format(sql, clasificacion);
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                libros.add(libro(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return libros;
    }

    public ArrayList<Libro> buscarLibroAsignatura(String asignatura) throws Exception {
        ArrayList<Libro> libros = new ArrayList<Libro>();
        try {
            String sql = "select * from Libro l, Asignatura a where l.asignatura_ID = a.id and a.nombre like '%%%s%%'";
            sql = String.format(sql, asignatura);
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                libros.add(libro(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return libros;
    }

    public Libro buscarLibroId(int id) throws Exception {
        Libro libro = new Libro();
        try {
            String sql = "select * from Libro l, Asignatura a where l.id=%d and l.asignatura_ID = a.id";
            sql = String.format(sql, id);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            libro = libro(rs);
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return libro;
    }
    
    public Usuario buscarUsuarioCed(String ced) throws Exception{
    Usuario u = new Usuario();
    try {
            String sql = "select* from Usuario where identificacion='%s'";
            sql = String.format(sql, ced);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            u = usuario(rs);
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
    return u;
    }

    public Libro modificarLibro(Libro l) throws Exception {
        String sql = "update Libro set clasificacion='%s',titulo='%s',autor='%s',comentario='%s',estado=%d,cantidad_copias=%d, habilitado=%d, fisico=%d,digital=%d,asignatura_ID=%d where clasificacion='%s'";
        sql = String.format(sql, l.getClasificacion(), l.getTitulo(), l.getAutor(), l.getComentario(), l.getEstado(), l.getCantidad_copias(), l.getHabilitado(), l.getFisico(), l.getDigital(), l.getAsignatura().getId(), l.getClasificacion());
        db.executeQuery(sql);
        return buscarLibroId(l.getId());
    }

    public Asignatura getAsigantura(int id) throws Exception {
        Asignatura a = new Asignatura();
        try {
            String sql = "select * from Asignatura where id=%d ";
            sql = String.format(sql, id);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            a = asignatura(rs);
        } catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
        return a;
    }
    
        public Usuario verificarCuenta(String correo, String cod_verificacion) throws Exception {
        Usuario u;
        try{
            String sql = "select * from Usuario where correo = '%s' and cod_verificacion = '%s'";
            sql = String.format(sql, correo, cod_verificacion);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            u = usuario(rs); 
            String sql1 = "update Usuario set habilitado = 1 where correo = '%s'";
            sql1 = String.format(sql1, correo);
            db.executeQuery(sql1);
            
        }
        catch (SQLException ex) {
            return null;
        }
        return u;
    }

    public int verificarUsuario(String ced) {
        int cantidad;
        try{
            String sql = "select count(*) Cuenta from Usuario where  identificacion = %d";
            sql = String.format(sql, ced);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            cantidad = rs.getInt("Cuenta");
        }
        catch (SQLException ex) {
            return 0;
        }
        return cantidad;
    }
}
