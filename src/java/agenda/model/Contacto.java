/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.model;

/**
 *
 * @author FCFM
 */
public class Contacto {
    private int id;
    private String nombre;
    private String apellido;
    private String telefono;
    private String email;
    private String direccion1;
    private String direccion2;
    private boolean sexo;

    public String getApellido() {
        return apellido;
    }

    public Contacto() {
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion1() {
        return direccion1;
    }

    public void setDireccion1(String direccion1) {
        this.direccion1 = direccion1;
    }

    public String getDireccion2() {
        return direccion2;
    }

    public void setDireccion2(String direccion2) {
        this.direccion2 = direccion2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }
    
    
}
