/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Categoria;
import agenda.model.Producto;
import agenda.model.Subcategoria;
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
public class ProductoDao {
    
    public static int insertar(Producto producto) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL sp_NuevoProducto (?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,producto.getDescCorta());
            cs.setString(2,producto.getDescLarga());
            cs.setFloat(3,producto.getPrecio());
            cs.setInt(4,producto.getExistencia());
            cs.setString(5,producto.getVigencia());
            cs.setBlob(6,producto.getImagen1());
            cs.setBlob(7,producto.getImagen2());
            cs.setBlob(8,producto.getImagen3());
            cs.setString(9,producto.getVideo1());
            cs.setString(10,producto.getVideo2());
            cs.setString(11,producto.getVideo3());
            cs.setInt(12,producto.getIdUsuario());
            cs.setInt(13,producto.getIdSubcategoria());
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
        
    public static int actualizar(Producto producto) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call mod_producto (?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,producto.getDescCorta());
            cs.setString(2,producto.getDescLarga());
            cs.setFloat(3,producto.getPrecio());
            cs.setInt(4,producto.getExistencia());
            cs.setString(5,producto.getVigencia());
            cs.setBlob(6,producto.getImagen1());
            cs.setBlob(7,producto.getImagen2());
            cs.setBlob(8,producto.getImagen3());
            cs.setString(9,producto.getVideo1());
            cs.setString(10,producto.getVideo2());
            cs.setString(11,producto.getVideo3());
            cs.setInt(12,producto.getIdUsuario());
            cs.setInt(13,producto.getIdSubcategoria());
            cs.setInt(14,producto.getId());
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
            String query = "{call borrar_producto (?)}";
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
    
    public static List<Producto> buscar() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_todos_productos()}");
            rs = cs.executeQuery();
            
            List<Producto> productos = new ArrayList<Producto>();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setId(rs.getInt("idProducto"));
                producto.setDescCorta(rs.getString("descripcionCorta"));
                producto.setDescLarga(rs.getString("descripcionLarga"));
                producto.setPrecio(rs.getFloat("precioProducto"));
                producto.setExistencia(rs.getInt("existenciaProducto"));
                producto.setVigencia(rs.getString("vigenciaProducto"));
                producto.setImagen1(rs.getBlob("imagenProducto1"));
                producto.setImagen2(rs.getBlob("imagenProducto2"));
                producto.setImagen3(rs.getBlob("imagenProducto3"));
                producto.setVideo1(rs.getString("videoProducto1"));
                producto.setVideo2(rs.getString("videoProducto2"));
                producto.setVideo3(rs.getString("videoProducto3"));
                producto.setIdUsuario(rs.getInt("Usuario_id"));
                producto.setNombreSubcategoria(rs.getString("nombresubcategoria"));
                productos.add(producto);
            }
            return productos;
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
    
    public static Producto obtenerUsuario(int id) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            String query = "{call buscar_producto (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            
            if(rs.next()){
                Producto producto = new Producto();
                producto.setId(rs.getInt("idProducto"));
                producto.setDescCorta(rs.getString("descripcionCorta"));
                producto.setDescLarga(rs.getString("descripcionLarga"));
                producto.setPrecio(rs.getFloat("precioProducto"));
                producto.setExistencia(rs.getInt("existenciaProducto"));
                producto.setVigencia(rs.getString("vigenciaProducto"));
                producto.setImagen1(rs.getBlob("imagenProducto1"));
                producto.setImagen2(rs.getBlob("imagenProducto2"));
                producto.setImagen3(rs.getBlob("imagenProducto3"));
                producto.setVideo1(rs.getString("videoProducto1"));
                producto.setVideo2(rs.getString("videoProducto2"));
                producto.setVideo3(rs.getString("videoProducto3"));
                producto.setIdUsuario(rs.getInt("Usuario_id"));
                producto.setNombreSubcategoria(rs.getString("nombresubcategoria"));
                return producto;
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
    
    public static List<Subcategoria> buscar_subcategorias() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_subcategorias()}");
            rs = cs.executeQuery();
            
            List<Subcategoria> subs = new ArrayList<Subcategoria>();
            while(rs.next()){
                Subcategoria sub = new Subcategoria();
                sub.setId(rs.getInt("idSubcategoria"));
                sub.setNombre(rs.getString("nombreSubcategoria"));
                sub.setIdCategoria(rs.getInt("categoria_id"));
                subs.add(sub);
            }
            return subs;
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
    
    public static List<Categoria> buscar_categorias() throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_categorias()}");
            rs = cs.executeQuery();
            
            List<Categoria> subs = new ArrayList<Categoria>();
            while(rs.next()){
                Categoria cat = new Categoria();
                cat.setNombre(rs.getString("nombreCategoria"));
                subs.add(cat);
            }
            return subs;
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
