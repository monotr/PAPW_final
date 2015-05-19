/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.model;

/**
 *
 * @author Monotr_
 */
public class Pregunta {
    private int idPregunta;
    private String textoPregunta;
    private String textoRespuesta;
    private String fechaPregunta;
    private String fechaRespuesta;
    private int respuestaRealizada;
    private int idUsuario;
    private int idAnuncio;
    private int idProducto;
    private String descCorta;

    
    public Pregunta() {
    }

    public String getDescCorta() {
        return descCorta;
    }

    public void setDescCorta(String descCorta) {
        this.descCorta = descCorta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getTextoPregunta() {
        return textoPregunta;
    }

    public void setTextoPregunta(String textoPregunta) {
        this.textoPregunta = textoPregunta;
    }

    public String getTextoRespuesta() {
        return textoRespuesta;
    }

    public void setTextoRespuesta(String textoRespuesta) {
        this.textoRespuesta = textoRespuesta;
    }

    public String getFechaPregunta() {
        return fechaPregunta;
    }

    public void setFechaPregunta(String fechaPregunta) {
        this.fechaPregunta = fechaPregunta;
    }

    public String getFechaRespuesta() {
        return fechaRespuesta;
    }

    public void setFechaRespuesta(String fechaRespuesta) {
        this.fechaRespuesta = fechaRespuesta;
    }

    public int getRespuestaRealizada() {
        return respuestaRealizada;
    }

    public void setRespuestaRealizada(int respuestaRealizada) {
        this.respuestaRealizada = respuestaRealizada;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdAnuncio() {
        return idAnuncio;
    }

    public void setIdAnuncio(int idAnuncio) {
        this.idAnuncio = idAnuncio;
    }
    
    
}
