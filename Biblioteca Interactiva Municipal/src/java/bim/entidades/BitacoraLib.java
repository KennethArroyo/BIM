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
public class BitacoraLib {
    private String titulo;
    private String clasificacion;
    private int copias;
    private String accion;
    private String fecha;
    private String usuario;

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public void setCopias(int copias) {
        this.copias = copias;
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
    
    

    public BitacoraLib() {
    }

    public String getTitulo() {
        return titulo;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public int getCopias() {
        return copias;
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
   
    
    
}
