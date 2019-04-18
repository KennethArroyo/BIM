/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.entidades;

/**
 *
 * @author Sergio
 */
public class ModeloPrestamo {
    private int id;
    private String estado;
    private String titulo;
    private int libro_ID;
    private int usuario_ID;
   
    private String usuario;
    private String fecha_inicio;
    private String fecha_final;

    public ModeloPrestamo() {
    }

    public int getUsuario_ID() {
        return usuario_ID;
    }

    public void setUsuario_ID(int usuario_ID) {
        this.usuario_ID = usuario_ID;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }
    

    public void setEstado(String id) {
        this.estado = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
     public int getLibro_id() {
        return libro_ID;
    }

    public void setLibro_id(int libro_id) {
        this.libro_ID = libro_id;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEstado() {
        return estado;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getUsuario() {
        return usuario;
    }
    
}
