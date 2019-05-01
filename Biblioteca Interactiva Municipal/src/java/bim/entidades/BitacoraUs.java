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
public class BitacoraUs {
    private String nombre;
    private String apellidos;
    private String ident;
    private String accion;
    private String fecha;
    private String usuario;

    public BitacoraUs() {
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getIdent() {
        return ident;
    }

    public String getAccion() {
        return accion;
    }

    public String getFecha() {
        return fecha;
    }

    public String getUsuario() {
        return usuario;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setIdent(String ident) {
        this.ident = ident;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
}
