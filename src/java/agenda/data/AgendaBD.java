/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Contacto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FCFM
 */
public class AgendaBD {
    public static int insertar(Contacto contacto) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL insertarContacto (?,?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,contacto.getNombre());
            cs.setString(2,contacto.getApellido());
            cs.setString(3,contacto.getTelefono());
            cs.setString(4,contacto.getEmail());
            cs.setString(5,contacto.getDireccion1());
            cs.setString(6,contacto.getDireccion2());
            cs.setBoolean(7,contacto.isSexo());
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
        
    public static int actualizar(Contacto contacto) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call actualizarContacto (?,?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, contacto.getId());
            cs.setString(2,contacto.getNombre());
            cs.setString(3,contacto.getApellido());
            cs.setString(4,contacto.getTelefono());
            cs.setString(5,contacto.getEmail());
            cs.setString(6,contacto.getDireccion1());
            cs.setString(7,contacto.getDireccion2());
            cs.setBoolean(8,contacto.isSexo());
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
            String query = "{call borrarContacto (?)}";
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
    
    public static List<Contacto> buscar() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            cs = con.prepareCall("{call buscarContactos ()}");
            rs = cs.executeQuery();
            
            List<Contacto> contactos = new ArrayList<Contacto>();
            while(rs.next()){
                Contacto contacto = new Contacto();
                contacto.setId(rs.getInt("id"));
                contacto.setNombre(rs.getString("nombre"));
                contacto.setApellido(rs.getString("apellido"));
                   contacto.setTelefono(rs.getString("telefono"));
                   contacto.setEmail(rs.getString("email"));
                   contacto.setDireccion1(rs.getString("direccion1"));
                   contacto.setDireccion2(rs.getString("direccion2"));
                   contacto.setSexo(rs.getBoolean("sexo"));
                   contactos.add(contacto);
            }
            return contactos;
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
    
    public static Contacto obtenerContacto(int id) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            String query = "{call obtenerContacto (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            
            if(rs.next()){
                Contacto contacto = new Contacto();
                contacto.setId(rs.getInt("id"));
                contacto.setNombre(rs.getString("nombre"));
                contacto.setApellido(rs.getString("apellido"));
                contacto.setTelefono(rs.getString("telefono"));
                contacto.setEmail(rs.getString("email"));
                contacto.setDireccion1(rs.getString("direccion1"));
                contacto.setDireccion2(rs.getString("direccion2"));
                contacto.setSexo(rs.getBoolean("sexo"));
                return contacto;
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
}
