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
public class Actividad {
 private int id;
 private String dir;
 private String nombre;

    public Actividad() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public String getDir() {
        return dir;
    }

    public String getNombre() {
        return nombre;
    }
 
 
}
