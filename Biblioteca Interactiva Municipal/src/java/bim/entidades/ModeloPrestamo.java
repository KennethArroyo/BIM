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
    private int id_estado;
    private String titulo;
    private String usuario;
    private String fecha_inicio;
    private String fecha_final;

    public ModeloPrestamo() {
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }
    

    public void setId(int id) {
        this.id_estado = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getId_estado() {
        return id_estado;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public int getId() {
        return id_estado;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getUsuario() {
        return usuario;
    }
    
}
