/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.datos;

import bim.entidades.Asignatura;
import bim.entidades.Libro;
import java.sql.ResultSet;

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
        o.setDir_portada(rs.getString("Dir_Portada"));
        o.setDir_PDF(rs.getString("Dir_PDF"));
        a.setId(rs.getInt("Asignatura_ID"));
        o.setAsignatura(a);
        return o;
    }
}
