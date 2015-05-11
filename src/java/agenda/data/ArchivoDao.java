/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Archivo;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import org.apache.tomcat.jdbc.pool.ConnectionPool;

/**
 *
 * @author Monotr_
 */
public class ArchivoDao {
    
    public static void insertarVideo(Archivo a, int col) {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection connection = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try {
            cs = connection.prepareCall("{ call insertar_video_producto(?, ?, ?) }");
            cs.setString(1, a.getUbicacion());
            cs.setInt(2, a.getIdUser());
            cs.setInt(3, col);
            //cs.setString(2, a.getTipo());
            cs.execute();
            
        } catch (Exception ex) {
            ex.printStackTrace();
            
        } finally {
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(connection);
        }
    }
    
    public static int insertarImagen(Archivo a, int user_or_product, int col) {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection connection = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try { 
            String query;
            if(user_or_product == 0)
                query = "{ call insertar_imagen(?, ?, ?) }";
            else
                query = "{ call insertar_imagen_producto(?, ?, ?) }";
                
            cs = connection.prepareCall(query);
            cs.setInt(2, a.getIdUser());
            //cs.setString(2, a.getTipo());
            cs.setBlob(1, a.getStream());
            cs.setInt(3, col);
            //cs.registerOutParameter(4, Types.INTEGER);
            cs.execute();
            //int id = cs.getInt(4);
            return 1;
            
        } catch (Exception ex) {
            ex.printStackTrace();
            return -1;
            
        } finally {
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(connection);
        }
    }
    
    public static InputStream obtenerImagen_user(int id) {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection connection = pool.getConexion();
        CallableStatement cs;
        cs = null;
        ResultSet rs = null;
        try { 
            cs = connection.prepareCall("{ call obtener_imagen_user(?) }");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            if (rs.next()) {
                return rs.getBinaryStream(1);
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
            
        } finally {
            DBUtil.cerrarResultset(rs);
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(connection);
        }
    }
    public static InputStream obtenerImagen_product(int id, int col) {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection connection = pool.getConexion();
        CallableStatement cs;
        cs = null;
        ResultSet rs = null;
        try { 
            cs = connection.prepareCall("{ call obtener_imagen_producto(?, ?) }");
            cs.setInt(1, id);
            cs.setInt(2, col);
            rs = cs.executeQuery();
            if (rs.next()) {
                return rs.getBinaryStream(1);
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
            
        } finally {
            DBUtil.cerrarResultset(rs);
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(connection);
        }
    }
    
}
