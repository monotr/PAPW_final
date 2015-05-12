/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Anuncio;
import agenda.model.MetodoPago;
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
public class AnuncioDao {
    
    public static int insertar(Anuncio anuncio) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL sp_NuevoAnuncio (?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,anuncio.getVigencia());
            cs.setString(2,anuncio.getFechPublicacion());
            cs.setBlob(3,anuncio.getThumbnail());
            cs.setInt(4,anuncio.getIdProducto());
            cs.setInt(5,anuncio.getIdMetodoPago());
            cs.execute();
            return 1;
       }
        catch(SQLException ex)
                {
                    ex.printStackTrace();
                    return -1;
                }
        finally 
        {
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(con);
        }
    }
        
    public static int actualizar(Anuncio anuncio) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call mod_anuncio (?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,anuncio.getVigencia());
            cs.setString(2,anuncio.getFechPublicacion());
            cs.setBlob(3,anuncio.getThumbnail());
            cs.setInt(4,anuncio.getIdProducto());
            cs.setInt(5,anuncio.getIdMetodoPago());
            cs.setInt(6,anuncio.getId());
            cs.execute();
            return 1;
       }
        catch(SQLException ex)
                {
                    ex.printStackTrace();
                    return -1;
                }
        finally 
        {
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(con);
        }
    }
    
    public static int borrar(int id) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call borrar_anuncio (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, id);
            cs.execute();
            return 1;
       }
        catch(SQLException ex)
                {
                    ex.printStackTrace();
                    return -1;
                }
        finally 
        {
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(con);
        }
    }
    
    public static List<Anuncio> buscar(int idUS) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_todos_anuncios_del_usuario(?)}");
            cs.setInt(1, idUS);
            rs = cs.executeQuery();
            
            List<Anuncio> anuncios = new ArrayList<Anuncio>();
            while(rs.next()){
                Anuncio anuncio = new Anuncio();
                anuncio.setId(rs.getInt("idAnuncio"));
                anuncio.setVigencia(rs.getString("vigenciaAnuncio"));
                anuncio.setFechPublicacion(rs.getString("fechaPublicacion"));
                anuncio.setThumbnail(rs.getBlob("thumbnailAnuncio"));
                anuncio.setIdProducto(rs.getInt("Producto_id"));
                anuncio.setIdMetodoPago(rs.getInt("MetodoPago_id"));
                anuncio.setNombreMP(rs.getString("nombremetodopago"));
                anuncio.setEstado(rs.getInt("estadoAnuncio"));
                anuncio.setPrecio(rs.getFloat("precioProducto"));
                anuncio.setNombreProducto(rs.getString("descripcioncorta"));
                anuncio.setSubcategoria(rs.getString("nombresubcategoria"));
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
    
    public static Anuncio obtenerUsuario(int id) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            String query = "{call buscar_anuncio_del_usuario (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            
            if(rs.next()){
                Anuncio anuncio = new Anuncio();
                anuncio.setId(rs.getInt("idAnuncio"));
                anuncio.setVigencia(rs.getString("vigenciaAnuncio"));
                anuncio.setFechPublicacion(rs.getString("fechaPublicacion"));
                anuncio.setThumbnail(rs.getBlob("thumbnailAnuncio"));
                anuncio.setIdProducto(rs.getInt("Producto_id"));
                anuncio.setIdMetodoPago(rs.getInt("MetodoPago_id"));
                anuncio.setEstado(rs.getInt("estadoAnuncio"));
                return anuncio;
            }
            return null;
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
    
    public static List<MetodoPago> buscar_MP() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_metodosPago()}");
            rs = cs.executeQuery();
            
            List<MetodoPago> metoPago = new ArrayList<MetodoPago>();
            while(rs.next()){
                MetodoPago mp = new MetodoPago();
                mp.setId(rs.getInt("idMetodoPago"));
                mp.setNombre(rs.getString("nombreMetodoPago"));
                metoPago.add(mp);
            }
            return metoPago;
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
    
    public static List<Anuncio> busqueda_home(int tipo) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            String query = "{call view_home("+tipo+")}";
            cs = con.prepareCall(query);
            rs = cs.executeQuery();
            
            List<Anuncio> anuncios = new ArrayList<Anuncio>();
            while(rs.next()){
                Anuncio anuncio = new Anuncio();
                anuncio.setId(rs.getInt("idAnuncio"));
                anuncio.setVigencia(rs.getString("vigenciaAnuncio"));
                anuncio.setFechPublicacion(rs.getString("fechaPublicacion"));
                anuncio.setThumbnail(rs.getBlob("thumbnailAnuncio"));
                anuncio.setIdProducto(rs.getInt("Producto_id"));
                anuncio.setIdMetodoPago(rs.getInt("MetodoPago_id"));
                anuncio.setEstado(rs.getInt("estadoAnuncio"));
                anuncio.setPrecio(rs.getFloat("precioProducto"));
                anuncio.setNickname(rs.getString("nickname"));
                anuncio.setDescCorta(rs.getString("descripcionCorta"));
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
