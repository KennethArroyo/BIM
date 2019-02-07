package bim.entidades;

import bim.entidades.Asignatura;
import java.util.ArrayList;

/**
 *
 * @author Sergio
 */
public class Libro {

    int id;
    String clasificacion;
    ArrayList<Autor> autores;
    String titulo;
    int estado;
    String comentario;
    int cantidad_copias;
    int fisico;
    int digital;
    String dir_portada;
    String dir_PDF;
    Asignatura asignatura;
    int habilitado;

    public Libro() {
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }

    public int getId() {
        return id;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public ArrayList<Autor> getAutor() {
        return autores;
    }

    public String getTitulo() {
        return titulo;
    }

    public int getEstado() {
        return estado;
    }

    public String getComentario() {
        return comentario;
    }

    public int getCantidad_copias() {
        return cantidad_copias;
    }

    public int getFisico() {
        return fisico;
    }

    public int getDigital() {
        return digital;
    }

    public String getDir_portada() {
        return dir_portada;
    }

    public String getDir_PDF() {
        return dir_PDF;
    }

    public Asignatura getAsignatura() {
        return asignatura;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public void setAutor(ArrayList<Autor> autor) {
        this.autores = autor;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public void setCantidad_copias(int cant_copias) {
        this.cantidad_copias = cant_copias;
    }

    public void setFisico(int fisico) {
        this.fisico = fisico;
    }

    public void setDigital(int digital) {
        this.digital = digital;
    }

    public void setDir_portada(String dir_portada) {
        this.dir_portada = dir_portada;
    }

    public void setDir_PDF(String dir_PDF) {
        this.dir_PDF = dir_PDF;
    }

    public void setAsignatura(Asignatura asignatura) {
        this.asignatura = asignatura;
    }

}
