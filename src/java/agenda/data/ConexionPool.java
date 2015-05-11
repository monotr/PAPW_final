/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.InitialContext;

/**
 *
 * @author FCFM
 */
class ConexionPool {
    private static ConexionPool pool = null;
    private static DataSource dataSource = null;
    
    public synchronized static ConexionPool getInstancia()
    {
        if(pool == null)
        {
            pool = new ConexionPool();
        }
        return pool;
    }
    
    private ConexionPool()
    {
        try
        {
            InitialContext ic = new InitialContext();
            dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/papw");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    public Connection getConexion(){
        try{
            return dataSource.getConnection();
        }
            catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
            
    
    public void liberarConexion(Connection c){
    try{
        if (c!= null)
            c.close();
        }
     catch(SQLException ex)
     {
         ex.printStackTrace();
     }
    }
}
