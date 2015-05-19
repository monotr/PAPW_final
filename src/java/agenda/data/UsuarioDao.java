/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carlos
 */
public class UsuarioDao {
    
    public static int insertar(Usuario usuario) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL sp_NuevoUsuario (?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,usuario.getContrasenia());
            cs.setString(2,usuario.getEmail());
            cs.setInt(3,1);
            cs.registerOutParameter(4, Types.INTEGER);
            cs.execute();
            int id = cs.getInt(4);
            return id;
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
        
    public static int actualizar(Usuario usuario) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String sexoA = "";
            if(usuario.getSexo() == "0")
                sexoA = "M";
            else
                sexoA = "F";
            String query = "{call mod_usuario (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            //cs.setString(1,usuario.getNickname());
            //cs.setString(2,usuario.getContrasenia());
            cs.setString(1,usuario.getEmail());
            //cs.setBlob(4,usuario.getImagen());
            cs.setString(2,usuario.getNombre());
            cs.setString(3,usuario.getApellidoPaterno());
            cs.setString(4,usuario.getApellidoMaterno());
            cs.setString(5,usuario.getFechaNacimiento());
            cs.setString(6,sexoA);
            cs.setString(7,usuario.getColonia());
            cs.setString(8,usuario.getCalle());
            cs.setString(9,usuario.getNumCasa());
            cs.setInt(10,usuario.getCp());
            cs.setString(11,usuario.getCiudad());
            cs.setString(12,usuario.getEstado());
            cs.setString(13,usuario.getPais());
            cs.setInt(14,usuario.getId());
            cs.setString(15,usuario.getNickname());
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
    
    public static int actualizarContrasena(Usuario usuario) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call mod_usuario_contraseña (?,?)}";
            cs = con.prepareCall(query);
            cs.setString(2,usuario.getContrasenia());
            cs.setInt(1,usuario.getId());
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
            String query = "{call borrar_user (?)}";
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
    
    public static List<Usuario> buscar() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_todos_usuarios()}");
            rs = cs.executeQuery();
            
            List<Usuario> usuarios = new ArrayList<Usuario>();
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNickname(rs.getString("nickName"));
                usuario.setContrasenia(rs.getString("contraseniaUsuario"));
                usuario.setEmail(rs.getString("mailUsuario"));
                usuario.setImagen(null);//rs.getBlob("imagen"));
                usuario.setNombre(rs.getString("nombreUsuario"));
                usuario.setApellidoPaterno(rs.getString("apellidoPaterno"));
                usuario.setApellidoMaterno(rs.getString("apellidoMaterno"));
                usuario.setFechaNacimiento(rs.getString("fechaNacimiento"));
                usuario.setSexo(rs.getString("sexoUsuario"));
                usuario.setColonia(rs.getString("coloniaUsuario"));
                usuario.setCalle(rs.getString("calleUsuario"));
                usuario.setNumCasa(rs.getString("numeroCasa"));
                usuario.setCp(rs.getInt("codigoPostal"));
                usuario.setCiudad(rs.getString("ciudadUsuario"));
                usuario.setEstado(rs.getString("estadoUsuario"));
                usuario.setPais(rs.getString("paisUsuario"));
                usuario.setOpcion(0);//rs.getInt("opcion"));
                usuarios.add(usuario);
            }
            return usuarios;
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
    
    public static Usuario obtenerUsuario(int id) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            String query = "{call buscar_usuario (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            
            if(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(id);
                usuario.setNickname(rs.getString("nickName"));
                usuario.setContrasenia(rs.getString("contraseniaUsuario"));
                usuario.setEmail(rs.getString("mailUsuario"));
                //usuario.setImagen(rs.getBlob("imagenUsuario"));
                usuario.setNombre(rs.getString("nombreUsuario"));
                usuario.setApellidoPaterno(rs.getString("apellidoPaterno"));
                usuario.setApellidoMaterno(rs.getString("apellidoMaterno"));
                usuario.setFechaNacimiento(rs.getString("fechaNacimiento"));
                usuario.setSexo(rs.getString("sexoUsuario"));
                usuario.setColonia(rs.getString("coloniaUsuario"));
                usuario.setCalle(rs.getString("calleUsuario"));
                usuario.setNumCasa(rs.getString("numeroCasa"));
                usuario.setCp(rs.getInt("codigoPostal"));
                usuario.setCiudad(rs.getString("ciudadUsuario"));
                usuario.setEstado(rs.getString("estadoUsuario"));
                usuario.setPais(rs.getString("paisUsuario"));
                return usuario;
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
    
    public static Usuario validarLogin(String email, String password) {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = con.prepareCall("{ call validar_login(?, ?) }");
            cs.setString(1, email);
            cs.setString(2, password);
            rs = cs.executeQuery();
            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("idUsuario"));
                u.setNickname(rs.getString("nickname"));
                return u;
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
            
        } finally {
            DBUtil.cerrarResultset(rs);
            DBUtil.cerrarStatement(cs);
            pool.liberarConexion(con);
        }
    }
}