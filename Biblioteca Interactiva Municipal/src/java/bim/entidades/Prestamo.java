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
    int numero;
    Date fecha_inicio;
    Date fecha_final;
    String cedula_ID;
    int estado_ID;

    public int getLibro_ID() {
        return libro_ID;
    }

    public void setLibro_ID(int libro_ID) {
        this.libro_ID = libro_ID;
    }
    int libro_ID;
    
    public Prestamo() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(Date fecha_final) {
        this.fecha_final = fecha_final;
    }

    public String getCedula_ID() {
        return cedula_ID;
    }

    public void setCedula_ID(String cedula_ID) {
        this.cedula_ID = cedula_ID;
    }

    public int getEstado_ID() {
        return estado_ID;
    }

    public void setEstado_ID(int estado_ID) {
        this.estado_ID = estado_ID;
    }

    
    
}
