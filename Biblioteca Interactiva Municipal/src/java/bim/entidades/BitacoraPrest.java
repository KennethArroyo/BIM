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
public class BitacoraPrest {
 
    private String libro_prest;
    private String usuario_prest;
    private String fecha_inicio;
    private String fecha_final;
    private String accion;
    private String fecha;
    private String usuario;

    public String getLibro_prest() {
        return libro_prest;
    }

    public void setLibro_prest(String libro_prest) {
        this.libro_prest = libro_prest;
    }

    public String getUsuario_prest() {
        return usuario_prest;
    }

    public void setUsuario_prest(String usuario_prest) {
        this.usuario_prest = usuario_prest;
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

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public BitacoraPrest() {
    }

}
