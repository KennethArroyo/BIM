package bim.entidades;
import bim.entidades.Asignatura;
/**
 *
 * @author Sergio
 */
public class Libro {
    int id;
    String clasificacion;
    String autor;
    String titulo;
    int estado;
    String comentario;
    int cantidad_copias;
    int fisico;
    int digital;
    String dir_portada;
    String dir_PDF;
    Asignatura asignatura;

    public Libro() {
    }

    public int getId() {
        return id;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public String getAutor() {
        return autor;
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

    public void setAutor(String autor) {
        this.autor = autor;
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