/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.model;

import java.sql.Blob;

/**
 *
 * @author Monotr_
 */
public class Producto {
    private int id;
    private String descCorta;
    private String descLarga;
    private float precio;
    private int existencia;
    private String vigencia;
    private Blob imagen1;
    private Blob imagen2;
    private Blob imagen3;
    private String video1;
    private String video2;
    private String video3;
    private int idUsuario;
    private int idSubcategoria;
    private String nombreSubcategoria;

    public Producto() {
    }

    public String getNombreSubcategoria() {
        return nombreSubcategoria;
    }

    public void setNombreSubcategoria(String nombreSubcategoria) {
        this.nombreSubcategoria = nombreSubcategoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescCorta() {
        return descCorta;
    }

    public void setDescCorta(String descCorta) {
        this.descCorta = descCorta;
    }

    public String getDescLarga() {
        return descLarga;
    }

    public void setDescLarga(String descLarga) {
        this.descLarga = descLarga;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }

    public Blob getImagen1() {
        return imagen1;
    }

    public void setImagen1(Blob imagen1) {
        this.imagen1 = imagen1;
    }

    public Blob getImagen2() {
        return imagen2;
    }

    public void setImagen2(Blob imagen2) {
        this.imagen2 = imagen2;
    }

    public Blob getImagen3() {
        return imagen3;
    }

    public void setImagen3(Blob imagen3) {
        this.imagen3 = imagen3;
    }

    public String getVideo1() {
        return video1;
    }

    public void setVideo1(String video1) {
        this.video1 = video1;
    }

    public String getVideo2() {
        return video2;
    }

    public void setVideo2(String video2) {
        this.video2 = video2;
    }

    public String getVideo3() {
        return video3;
    }

    public void setVideo3(String video3) {
        this.video3 = video3;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdSubcategoria() {
        return idSubcategoria;
    }

    public void setIdSubcategoria(int idSubcategoria) {
        this.idSubcategoria = idSubcategoria;
    }
    
    
}
