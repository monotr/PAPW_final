/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Compra;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

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
            String query = "{CALL sp_NuevaCompra (?,?,?,?,?,?)}";
            cs = con.prepareCall(query);
            cs.setInt(1,compra.getCantidad());
            cs.setString(2,compra.getFecha());
            cs.setFloat(3,compra.getTotal());
            cs.setInt(4,compra.getEstado());
            cs.setInt(5,compra.getIdComprador());
            cs.setInt(6,compra.getIdAnuncio());
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
