/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.entidades;

import java.sql.Date;

/**
 *
 * @author esteban
 */
public class Prestamo {
    int id;
    String fecha_inicio;
    String fecha_final;
    int usuario_ID;
    int estado_ID;
    int libro_ID;
    
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
    public int getLibro_ID() {
        return libro_ID;
    }

    public void setLibro_ID(int libro_ID) {
        this.libro_ID = libro_ID;
    }
    
    public Prestamo() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuario_ID() {
        return usuario_ID;
    }

    public void setUsuario_ID(int usuario_ID) {
        this.usuario_ID = usuario_ID;
    }

    public int getEstado_ID() {
        return estado_ID;
    }

    public void setEstado_ID(int estado_ID) {
        this.estado_ID = estado_ID;
    }

    
    
}
