/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.entidades;

/**
 *
 * @author esteban montero
 */
public class Sancion {
    
    int id;
    String fecha_inicio;
    String fecha_final;
    int estado;
    int usuario_ID;
    String identUsuario;

    public String getIdentUsuario() {
        return identUsuario;
    }

    public void setIdentUsuario(String identUsuario) {
        this.identUsuario = identUsuario;
    }

    public int getUsuario_ID() {
        return usuario_ID;
    }

    public void setUsuario_ID(int usuario_ID) {
        this.usuario_ID = usuario_ID;
    }
    
    public Sancion(int id, String fecha_inicio, String fecha_final, int estado,int usuario_ID) {
        this.id = id;
        this.fecha_inicio = fecha_inicio;
        this.fecha_final = fecha_final;
        this.estado = estado;
        this.usuario_ID=usuario_ID;
    }

    public Sancion() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
