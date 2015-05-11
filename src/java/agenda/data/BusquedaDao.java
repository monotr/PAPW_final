/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Anuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Monotr_
 */
public class BusquedaDao {
    
    public static List<Anuncio> buscar(String serch_text, boolean op1, boolean op2, boolean op3, String fechaD, String fechaH) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            cs = con.prepareCall("{call sp_busqueda(?,?,?,?,?,?)}");
            cs.setString(1, serch_text);
            cs.setBoolean(2, op1);
            cs.setBoolean(3, op2);
            cs.setBoolean(4, op3);
            cs.setString(5, fechaD);
            cs.setString(6, fechaH);
            rs = cs.executeQuery();
            
            List<Anuncio> anuncios = new ArrayList<Anuncio>();
            while(rs.next()){
                Anuncio anuncio = new Anuncio();
                anuncio.setId(rs.getInt("idAnuncio"));
                anuncio.setVigencia(rs.getString("vigenciaAnuncio"));
                anuncio.setFechPublicacion(rs.getString("fechaPublicacion"));
                anuncio.setThumbnail(rs.getBlob("thumbnailAnuncio"));
                anuncio.setIdProducto(rs.getInt("Producto_id"));
                anuncio.setNombreProducto(rs.getString("descripcionCorta"));
                anuncio.setIdMetodoPago(rs.getInt("MetodoPago_id"));
                anuncio.setNombreMP(rs.getString("nombremetodopago"));
                anuncio.setEstado(rs.getInt("estadoAnuncio"));
                anuncio.setPrecio(rs.getInt("precioProducto"));
                anuncio.setSubcategoria(rs.getString("nombreSubcategoria"));
                anuncio.setExistencia(rs.getInt("existenciaProducto"));
                anuncios.add(anuncio);
            }
            return anuncios;
       }
        catch(SQLException ex)
                {
                    ex.printStackTrace();
                    return null;
                }
        finally 
        {
            DBUtil.cerrarResultset(rs);
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(con);
        }
    } 
    
}
