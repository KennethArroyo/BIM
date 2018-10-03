/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bim.entidades;

/**
 *
 * @author Kenneth
 */
public class Usuario {
    int id;
    int tipo;
    String identificacion;
    String nombre;
    String apellidos;
    String lugar_residencia;
    String telefono;
    String correo;
    String contrasena;
    String ref_trab_est;
    int habilitado;
    String cod_verificacion;
    
    public static String NUMEROS = "0123456789";
    public static String MAYUSCULAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static String MINUSCULAS = "abcdefghijklmnopqrstuvwxyz";


    public Usuario() {
    }

    public String getCod_verificacion() {
        return cod_verificacion;
    }

    public void setCod_verificacion(String codverificacion) {
        this.cod_verificacion = codverificacion;
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

    public void setId(int id) {
        this.id = id;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getLugar_residencia() {
        return lugar_residencia;
    }

    public void setLugar_residencia(String lugar_residencia) {
        this.lugar_residencia = lugar_residencia;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRef_trab_est() {
        return ref_trab_est;
    }

    public void setRef_trab_est(String ref_trab_est) {
        this.ref_trab_est = ref_trab_est;
    }
    
  	public String getPinNumber() {
		return generarCodigo(NUMEROS, 4);
	}
 
	public String getPassword() {
		return getCodigo(8);
	}
 
	public String getCodigo(int length) {
		return generarCodigo(NUMEROS + MAYUSCULAS + MINUSCULAS, length);
	}
 
	public String generarCodigo(String key, int length) {
		String pswd = "";
 
		for (int i = 0; i < length; i++) {
			pswd+=(key.charAt((int)(Math.random() * key.length())));
		}
 
		return pswd;
	}
        
        public void GenerarCodigoVerificacion() {
            String codigo = generarCodigo(NUMEROS + MAYUSCULAS + MINUSCULAS, 10);
            this.setCod_verificacion(codigo);
        }
    
}
