/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Compra;
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
public class CompraDao {
    
    public static int insertar(Compra compra) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL sp_NuevaCompra (?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setInt(1,compra.getCantidad());
            cs.setFloat(2,compra.getTotal());
            cs.setInt(3,compra.getEstado());
            cs.setInt(4,compra.getIdComprador());
            cs.setInt(5,compra.getIdAnuncio());
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
    
    public static List<Compra> buscar(int idUS) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            //String query = "{call buscarContactos ()}";
            cs = con.prepareCall("{call buscar_todas_ventas_del_usuario(?)}");
            cs.setInt(1, idUS);
            rs = cs.executeQuery();
            
            List<Compra> compras = new ArrayList<Compra>();
            while(rs.next()){
                Compra compra = new Compra();
                compra.setId(rs.getInt("idCompra"));
                compra.setCantidad(rs.getInt("cantidadCompra"));
                compra.setFecha(rs.getString("fechaCompra"));
                compra.setTotal(rs.getInt("totalCompra"));
                compra.setEstado(rs.getInt("estadoCompra"));
                compra.setIdComprador(rs.getInt("Comprador_id"));
                compra.setIdAnuncio(rs.getInt("Anuncio_id"));
                compra.setNombreProducto(rs.getString("descripcionCorta"));
                compra.setNickNameComprador(rs.getString("nickName"));
                compra.setEmailVendedor(rs.getString("mailUsuario"));
                compras.add(compra);
            }
            return compras;
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
    
    public static int confirmar(int compraID) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call confirmar_venta (?)}";
            cs = con.prepareCall(query);
            cs.setInt(1,compraID);
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
}
