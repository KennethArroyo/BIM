package bim.datos;

import bim.entidades.Actividad;
import bim.entidades.Asignatura;
import bim.entidades.Autor;
import bim.entidades.Libro;
import bim.entidades.ModeloPrestamo;
import bim.entidades.Prestamo;
import bim.entidades.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Dao {

    RelDataBase db;
    int id_auxiliar;

    public Dao() {
        db = new RelDataBase();
        id_auxiliar = 0;
    }

    private Asignatura asignatura(ResultSet rs) throws Exception {
        Asignatura p = new Asignatura();
        p.setId(rs.getInt("asignatura_id"));
        p.setNombre(rs.getString("nombre"));
        return p;
    }
    
    private Actividad actividad(ResultSet rs) throws Exception {
        Actividad p = new Actividad();
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        p.setDir(rs.getString("direccion"));
        return p;
    }
    
    private ModeloPrestamo modeloPrestamo(ResultSet rs) throws Exception {
        ModeloPrestamo p = new ModeloPrestamo();
        p.setId(rs.getInt("id"));
        p.setTitulo(rs.getString("titulo"));
        p.setUsuario(rs.getString("nombre"));
        p.setEstado(rs.getString("estado_prestamo"));
        p.setFecha_inicio(rs.getString("fecha_inicio"));
        p.setFecha_final(rs.getString("fecha_final"));
        return p;
    }
    
    private Autor autor(ResultSet rs) throws Exception {
        Autor aut = new Autor();
        aut.setId(rs.getInt("autor_id"));
        aut.setNombre(rs.getString("nombre_autor"));
        return aut;
    }
    
    private Autor autorID(ResultSet rs) throws Exception {
        Autor aut = new Autor();
        aut.setId(rs.getInt("autor_id"));
        return aut;
    }
    
    private Libro libroID(ResultSet rs) throws Exception {
        Libro lib = new Libro();
        lib.setId(rs.getInt("libro_id"));
        return lib;
    }

    private Libro libro(ResultSet rs) throws Exception {
        Libro lib = new Libro();
        Asignatura a = new Asignatura();
        a = asignatura(rs);
        int id = rs.getInt("libro_id");
        lib.setId(id);
        lib.setClasificacion(rs.getString("Clasificacion"));
        lib.setTitulo(rs.getString("Titulo"));
        lib.setEstado(rs.getInt("Estado"));
        lib.setCuentaAutores(rs.getInt("cuenta_autores"));
        lib.setComentario(rs.getString("Comentario"));
        lib.setCantidad_copias(rs.getInt("Cantidad_copias"));
        lib.setFisico(rs.getInt("Fisico"));
        lib.setDigital(rs.getInt("Digital"));
        lib.setDir_portada(rs.getString("Dir_portada"));
        lib.setDir_PDF(rs.getString("Dir_PDF"));
        a.setId(rs.getInt("Asignatura_ID"));
        lib.setAsignatura(a);
        return lib;
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
        u.setHabilitado(rs.getInt("habilitado"));
        u.setRef_trab_est(rs.getString("ref_trab_est"));
        return u;
    }
    
    private Usuario usuarioSesion(ResultSet rs) throws Exception {
        Usuario u = new Usuario();
        u.setId(rs.getInt("id"));
        u.setTipo(rs.getInt("tipo"));
        u.setIdentificacion(rs.getString("identificacion"));
        u.setCorreo(rs.getString("correo"));
        u.setHabilitado(rs.getInt("habilitado"));
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
        PreparedStatement preparedStatement = null;
//        String sql = "insert into Usuario(tipo, identificacion, nombre, apellidos, lugar_residencia, telefono, correo, contrasena, ref_trab_est, habilitado, cod_verificacion)"
//                + "values(%d, '%s', '%s', '%s', '%s', %s, '%s', '%s','%s', %d, '%s')";
//        sql = String.format(sql, u.getTipo(), u.getIdentificacion(), u.getNombre(), u.getApellidos(), u.getLugar_residencia(),
//                u.getTelefono(), u.getCorreo(), u.getContrasena(), u.getRef_trab_est(), u.getHabilitado(), u.getCod_verificacion());
//        int count = db.executeUpdate(sql);
//        if (count == 0) {
//            throw new Exception("Error registrando al usuario!");
//        }
try{
        String insertTableSQL = "insert into Usuario(tipo, identificacion, nombre, apellidos, lugar_residencia, "
                + "telefono, correo, contrasena, ref_trab_est, habilitado, cod_verificacion)"
                 + "values"
		+ "(?,?,?,?,?,?,?,?,?,?,?)";
        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
        preparedStatement.setInt(1, u.getTipo());
        preparedStatement.setString(2, u.getIdentificacion());
        preparedStatement.setString(3, u.getNombre());
        preparedStatement.setString(4, u.getApellidos());
        preparedStatement.setString(5, u.getLugar_residencia());
        preparedStatement.setString(6, u.getTelefono());
        preparedStatement.setString(7, u.getCorreo());
        preparedStatement.setString(8, u.getContrasena());
        preparedStatement.setString(9, u.getRef_trab_est());
        preparedStatement.setInt(10, u.getHabilitado());
        preparedStatement.setString(11, u.getCod_verificacion());
        
        int count = preparedStatement.executeUpdate();
        preparedStatement.close();
        
            if (count == 0) {
                throw new Exception("Error ingresando el libro!");
            }
        }
        catch(SQLException e){
            int codigoSQL = e.getErrorCode();
            if(codigoSQL == 2627){
                throw new Exception("unique");
            }
        }
    }

    public void agregarLibro(Libro p) throws Exception {
        PreparedStatement preparedStatement = null;
         
        try{
        String insertTableSQL = "insert into Libro(clasificacion,titulo,comentario,estado,cantidad_copias,"
                 + "dir_Portada,dir_PDF,habilitado,fisico,digital,asignatura_ID, cuenta_autores, derechos_autor)"
                 + "values"
		+ "(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
        preparedStatement.setString(1, p.getClasificacion());
        preparedStatement.setString(2, p.getTitulo());
        preparedStatement.setString(3, p.getComentario());
        preparedStatement.setInt(4, p.getEstado());
        preparedStatement.setInt(5, p.getCantidad_copias());
        preparedStatement.setString(6, p.getDir_portada());
        preparedStatement.setString(7, p.getDir_PDF());
        preparedStatement.setInt(8, p.getHabilitado());
        preparedStatement.setInt(9, p.getFisico());
        preparedStatement.setInt(10, p.getDigital());
        preparedStatement.setInt(11, p.getAsignatura().getId());
        preparedStatement.setInt(12, p.getCuentaAutores());
        preparedStatement.setInt(13, 0);
        int count = preparedStatement.executeUpdate();
        preparedStatement.close();
        
            if (count == 0) {
                throw new Exception("Error ingresando el libro!");
            }
        }
        catch(SQLException e){
            String msg = e.getMessage();
            int codigoSQL = e.getErrorCode();
            if(codigoSQL == 2627){
                throw new Exception("unique");
            }
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
    
    public ArrayList<Autor> listarAutoresLibro() throws Exception {
        ArrayList<Autor> lista = new ArrayList<Autor>();
        try {
            String sql = "select * from Autor where ";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                lista.add(autor(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
        }
        return lista;
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
    public ArrayList<Libro> buscarTodosLibros()throws Exception{
    ArrayList<Libro> libros = new ArrayList<Libro>();
    Libro l = new Libro();
    Autor a = new Autor();
    int id;
    try{
        String sql = "select * from Asignatura a,Libro l, Autor e, Libro_Autor r "
                + "where l.asignatura_ID = a.asignatura_id and (l.libro_id = r.libro_ID and e.autor_id = r.autor_ID)";
        sql = String.format(sql);
        Statement stmt = db.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery (sql); 
        while(rs.next()){
            int cuenta = rs.getInt("cuenta_autores");
            l = libro(rs);
            id_auxiliar = l.getId();
            while(cuenta != 0){
                cuenta--;
                a = autor(rs);
                l.setAutor(a);
                rs.next();
            }
            rs.previous();
            libros.add(l);
        }
    }catch(SQLException ex){
        String error=ex.getMessage();
        error="s";
    }
    return libros;
    }
    public ArrayList<Libro> buscarLibroAutor(String autor) throws Exception {
        ArrayList<Libro> libros = new ArrayList<Libro>();
        try {
            String sql = "select * from Libro l, Asignatura a where l.autor like '%%%s%%' and l.asignatura_ID = a.asignatura_id";
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
            String sql = "select * from Libro l, Asignatura a where l.titulo like '%%%s%%' and l.asignatura_ID = a.asignatura_id";
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
            String sql = "select * from Libro l, Asignatura a where l.clasificacion like '%%%s%%' and l.asignatura_ID = a.asignatura_id";
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
            String sql = "select * from Libro l, Asignatura a where l.libro_id=%d and l.asignatura_ID = a.asignatura_id";
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
    
    public Prestamo buscarPrestamoId(int id)throws Exception{
    Prestamo p = new Prestamo();
    try{
    String sql = "select * from Prestamo p where p.id=%d";
            sql = String.format(sql, id);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            p = prestamo(rs);
    }catch (SQLException ex) {
            String error = ex.getMessage();
            error = "s";
        }
    return p;
    }
    public Usuario buscarUsuarioCed(String ced) throws Exception{
    Usuario u = new Usuario();
    try {
            String sql = "select * from Usuario where identificacion='%s'";
            sql = String.format(sql, ced);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            u = usuario(rs);
        } catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    return u;
    }
    
    public int buscarIdUsuarioCorreo(String correo) throws Exception{
    Usuario u = new Usuario();
    int id = 0;
    try {
            String sql = "select id from Usuario where correo='%s'";
            sql = String.format(sql, correo);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    return id;
    }

    public Libro modificarLibro(Libro l) throws Exception {
        String sql = "update Libro set clasificacion='%s',titulo='%s',comentario='%s',estado=%d,cantidad_copias=%d, habilitado=%d, fisico=%d,digital=%d,asignatura_ID=%d where clasificacion='%s'";
        sql = String.format(sql, l.getClasificacion(), l.getTitulo(), l.getComentario(), l.getEstado(), l.getCantidad_copias(), l.getHabilitado(), l.getFisico(), l.getDigital(), l.getAsignatura().getId(), l.getClasificacion());
        db.executeUpdate(sql);
        return buscarLibroId(l.getId());
    }

    public Asignatura getAsigantura(int id) throws Exception {
        Asignatura a = new Asignatura();
        try {
            String sql = "select * from Asignatura where asignatura_id=%d ";
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

    public void agregarAsignatura(String asig) throws Exception {
        String sql = "insert into Asignatura(nombre)"
                + "values('%s')";
        sql = String.format(sql, asig);
        int count = db.executeUpdate(sql);
        if (count == 0) {
            throw new Exception("Error ingresando la Asignatura");
        }
    }

    public void modificarAsignatura(int id, String nombre) {
        String sql = "update Asignatura set nombre='%s' where asignatura_id=%d";
        sql = String.format(sql, nombre, id);
        db.executeUpdate(sql);
    }

    public void eliminarAsignatura(int id) throws Exception {
            String sql = "delete from Asignatura where asignatura_id=%d";
            sql = String.format(sql, id);
            int resultado = db.executeUpdate(sql);
                if(resultado == 0){
                    throw new Exception("Error ingresando la Asignatura");
                }
    }

    public ArrayList<Autor> listarAutores() throws Exception {
       ArrayList<Autor> lista = new ArrayList<Autor>();
        try {
            String sql = "select * from Autor";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                lista.add(autor(rs));
            }
        } catch (SQLException ex) {
            String error = ex.getMessage();
        }
        return lista;
    }
    public ArrayList<Autor> buscarUltimosAutores() throws Exception {
        ArrayList<Autor> autores = new ArrayList<Autor>();
        try{
            String sql="select top 5 autor_id, nombre_autor from Autor order by autor_id desc";
            ResultSet rs = db.executeQuery(sql);
            while(rs.next()){
            Autor autor1 =autor(rs);
            autores.add(autor1);
            }
        }
        catch(SQLException ex){
        String s = ex.getMessage();
        ex.getMessage();
        }
        return autores;
    }

    public void agregarAutor(String autor) throws Exception {
        String sql = "insert into Autor(nombre_autor)"
                + "values('%s')";
        sql = String.format(sql, autor);
        int count = db.executeUpdate(sql);
        if (count == 0) {
            throw new Exception("Error ingresando el autor");
        }
    }

    public void modificarAutor(int id, String nombre) {
        String sql = "update Autor set nombre_autor='%s' where autor_id=%d";
        sql = String.format(sql, nombre, id);
        db.executeUpdate(sql);
    }

    public void eliminarAutor(int id) throws Exception {
        String sql = "delete from Autor where autor_id=%d";
            sql = String.format(sql, id);
            int resultado = db.executeUpdate(sql);
                if(resultado == 0){
                    throw new Exception("Error ingresando la Asignatura");
                }
    }

    public ArrayList<Autor> obtenerAutoresId(ArrayList<String> autores) throws Exception {
        ArrayList<Autor> lista = new ArrayList<>();
        try {
            for(int i = 0;i<autores.size();i++){
                String sql = "select autor_id from Autor where nombre_autor = '%s'";
                sql = String.format(sql, autores.get(i));
                ResultSet rs = db.executeQuery(sql);
                while (rs.next()) {
                    lista.add(autorID(rs));
                }
            }
        } 
        catch (SQLException ex) {
            String error = ex.getMessage();
        }
        return lista;
        
    }

    public void guardarAutorLibro(ArrayList<Autor> datos, String titulo) throws Exception {
        Libro lib = new Libro();
        try {
            String sql = "select libro_id from Libro where titulo = '%s'";
            sql = String.format(sql, titulo);
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                lib = libroID(rs);
            }
        }
        catch (SQLException ex) {
            String error = ex.getMessage();
        }
            for(int i = 0;i<datos.size();i++){
                String sql = "insert into Libro_Autor(libro_ID,autor_ID)"
                + "values(%d,%d)";
                sql = String.format(sql,lib.getId(),datos.get(i).getId());
                int count = db.executeUpdate(sql);
                if (count == 0) {
                    throw new Exception("Error ingresando los datos");
                }
            }
    }

    public Usuario buscarUsRegistrado(String usuario, String contrasena) throws SQLException, Exception {
        Usuario u = new Usuario();
    try {
            String sql = "select * from Usuario where identificacion='%s' and contrasena='%s'";
            sql = String.format(sql, usuario,contrasena);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            u = usuarioSesion(rs);
        } catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    return u;
    }
    
    public ArrayList<Usuario> buscarTodosUsuarios()throws Exception{
    ArrayList<Usuario> usuarios = new ArrayList<>();
    try{
        String sql = "select * from Usuario";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                usuarios.add(usuario(rs));
            }
    
    }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    
    return usuarios;
    }
    
    
    
    public void modificarUsuario(Usuario u)throws Exception{
    String sql = "update Usuario set nombre='%s', apellidos='%s', lugar_residencia='%s', telefono='%s', ref_trab_est='%s' where identificacion='%s'";
    sql = String.format(sql, u.getNombre(),u.getApellidos(),u.getLugar_residencia(),u.getTelefono(),u.getRef_trab_est(),u.getIdentificacion());
    db.executeUpdate(sql);
    }
    
    public void modificarTipoUsuario(Usuario u)throws Exception{
    String sql = "update Usuario set tipo = %d where identificacion='%s'";
    sql = String.format(sql,u.getTipo(),u.getIdentificacion());
    db.executeQuery(sql);
    }
    
    public void modificarEstadoPrestamo(Prestamo p)throws Exception{
    String sql ="update Prestamo set estado_ID = %d where id=%d";
    sql = String.format(sql, p.getEstado_ID(),p.getId());
    db.executeQuery(sql);
    }

    public void registrarTemporal(Timestamp timestamp, String temporal, int id) throws Exception {
        PreparedStatement preparedStatement = null;
        try{
        String insertTableSQL = "INSERT INTO Claves_Temporales"
		+ "(id, fecha, usuario_ID) VALUES"
		+ "(?,?,?)";
        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
        preparedStatement.setString(1, temporal);
        preparedStatement.setTimestamp(2, timestamp);
        preparedStatement.setInt(3, id);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        } catch (SQLException ex) {
            String error = ex.getMessage();
            preparedStatement.close();
            throw ex;
        }
    }

    public void actualizarUsuarioTemporal(String temporal, String contrasena) throws SQLException {
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatement2 = null;
        try {
            String insertTableSQL = "update Usuario set contrasena = ? where id = (select usuario_ID from Claves_Temporales where id = ?)";
            preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
            preparedStatement.setString(1, contrasena);
            preparedStatement.setString(2, temporal);
            preparedStatement.executeUpdate();
            
            String sql = "delete from Claves_Temporales where id = ?";
            preparedStatement2 = db.getConnection().prepareStatement(sql);
            preparedStatement2.setString(1, temporal);
            preparedStatement2.executeUpdate();
            
            preparedStatement.close();
            preparedStatement2.close();
        } catch (SQLException ex) {
            String error = ex.getMessage();
            preparedStatement.close();
            preparedStatement2.close();
            throw ex;
        }
    }  
    
    public ArrayList<Prestamo> buscarPrestamosUsuario(int id) throws Exception {
        
    ArrayList<Prestamo> prestamos = new ArrayList<>();
    try{
        String sql = "SELECT p.id id, p.fecha_inicio fecha_inicio, p.fecha_final fecha_final, p.usuario_ID usuario_ID, p.libro_ID libro_ID, p.estado_ID estado_ID FROM Prestamo p where p.usuario_ID=%d";
        sql = String.format(sql, id);    
        ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                prestamos.add(prestamo(rs));
            }
    
    }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    
    return prestamos;
        
    }
    
    public ArrayList<ModeloPrestamo> buscarPrestamosSolicitados() throws Exception {
        
    ArrayList<ModeloPrestamo> prestamos = new ArrayList<>();
    try{
        String sql = "select p.fecha_inicio, p.id, p.fecha_final,e.estado_prestamo, l.titulo, u.nombre from Prestamo p, "
        + "Libro l, Usuario u, Estado e where p.libro_ID = l.libro_id "
                + "and p.usuario_ID = u.id and p.estado_ID = e.id and p.estado_ID = 1";
        sql = String.format(sql);    
        ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                prestamos.add(modeloPrestamo(rs));
            }
    
    }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    
    return prestamos;
        
    }
    
    
    public ArrayList<ModeloPrestamo> buscarTodosPrestamos() throws Exception {
        
    ArrayList<ModeloPrestamo> prestamos = new ArrayList<>();
    try{
        String sql = "select p.fecha_inicio, p.id, p.fecha_final,e.estado_prestamo, l.titulo, u.nombre from Prestamo p, "
                + "Libro l, Usuario u, Estado e where p.libro_ID = l.libro_id and p.usuario_ID = u.id and p.estado_ID = e.id";
        sql = String.format(sql);    
        ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                prestamos.add(modeloPrestamo(rs));
            }
    
    }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    
    return prestamos;
        
    }
    
    

    public String buscarDireccionPDF(String clas) throws SQLException {
        PreparedStatement preparedStatement = null;
        String insertTableSQL = "select dir_PDF from Libro where clasificacion = ?";
        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
        preparedStatement.setString(1, clas);
        ResultSet rs = preparedStatement.executeQuery();
        rs.next();
        String dir = rs.getString("dir_PDF");
        return dir;
    }

    public void agregarActividad(String nombre, String caminoImagen) throws SQLException {
        PreparedStatement preparedStatement = null;
        try{
        String insertTableSQL = "insert into Actividad"
		+ "(direccion, nombre) VALUES"
		+ "(?,?)";
        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
        preparedStatement.setString(1, caminoImagen);
        preparedStatement.setString(2, nombre);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        } catch (SQLException ex) {
            String error = ex.getMessage();
            preparedStatement.close();
            throw ex;
        }
    }
    
    public ArrayList<Actividad> actividadesBuscarTodas() throws SQLException, Exception {
        ArrayList<Actividad> act = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        String sql = "select * from Actividad";
        preparedStatement = db.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
                act.add(actividad(rs));
            };
        return act;
    }

    public void eliminarActividad(int id) throws SQLException {
        try{
        PreparedStatement preparedStatement2 = null;
         String sql = "delete from Actividad where id = ?";
            preparedStatement2 = db.getConnection().prepareStatement(sql);
            preparedStatement2.setInt(1, id);
            preparedStatement2.executeUpdate();
            preparedStatement2.close();
        }
        catch(Exception ex){
            throw ex;
        }
    }

    public String obtenerDirActividad(int id) throws SQLException {
        PreparedStatement preparedStatement = null;
        String sql = "select direccion from Actividad where id = ?";
        preparedStatement = db.getConnection().prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        rs.next();
        String dir = rs.getString("direccion");
        return dir;
    }
    
    public void devolucionLibro(int id)throws SQLException{
    String sql = "update Libro set cantidad_copias = cantidad_copias+1 where libro_id=%d";
    sql = String.format(sql,id);
    db.executeQuery(sql);
    }
    public ArrayList<ModeloPrestamo> obtenerReportePrestados() throws SQLException, Exception{
        PreparedStatement preparedStatement = null;
        ArrayList<ModeloPrestamo> lista = new ArrayList<>();
        String sql = "select p.id, titulo, u.nombre from Prestamo p, Libro l, Usuario u where p.libro_ID = l.libro_id and p.usuario_ID = u.id";
        preparedStatement = db.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            lista.add(modeloPrestamo(rs));
        }
        return lista;
    }

    public ArrayList<ModeloPrestamo> buscarLibrosPrestados() throws SQLException, Exception {
ArrayList<ModeloPrestamo> prestamos = new ArrayList<>();
    try{
        String sql = "select p.fecha_inicio, p.id, p.fecha_final,e.estado_prestamo, l.titulo, u.nombre from Prestamo p, "
        + "Libro l, Usuario u, Estado e where p.libro_ID = l.libro_id "
                + "and p.usuario_ID = u.id and p.estado_ID = e.id and p.estado_ID = 2";
        sql = String.format(sql);    
        ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {
                prestamos.add(modeloPrestamo(rs));
            }
    
    }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
    
    return prestamos;    
    
    }
    
    public Usuario verificaPrestamosUsu(String ced )throws SQLException{
        Usuario u=new Usuario();
        int cantidad;
        try{
            String sql ="select count(id) cuenta from Prestamo where usuario_ID='%s'";
            sql = String.format(sql, ced);
            ResultSet rs = db.executeQuery(sql);
            rs.next();
            cantidad = rs.getInt("cuenta");
            if(cantidad>0){
            u.setTienePrestamos(true);
            u.setIdentificacion(ced);
            //u.setHabilitado(1);
            }else{
                u.setTienePrestamos(false);
                u.setIdentificacion(ced);
              //  u.setHabilitado(1);
            }
        
        }catch (SQLException ex) {
            String error = ex.getMessage();
            throw ex;
        }
        return u;
    }
    
    public void modificarEstadoUsuario(String ced,int estado)throws Exception{
    String sql = "update Usuario set habilitado = %d where identificacion='%s'";
    sql = String.format(sql,estado,ced);
    db.executeQuery(sql);
    }
    
//    public String bitacoraLibro(int id) throws SQLException {
//        PreparedStatement preparedStatement = null;
//        String insertTableSQL = "select * from Libro_bit where libro_id = ?";
//        preparedStatement = db.getConnection().prepareStatement(insertTableSQL);
//        preparedStatement.setInt(1, id);
//        ResultSet rs = preparedStatement.executeQuery();
//        rs.next();
//        String dir = rs.getString("dir_PDF");
//        return dir;
//    }
}