/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author FCFM
 */
public class DBUtil {
    public static void cerrarStatement(Statement s)
    {
        try{
            if(s != null)
                s.close();
            }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    public static void cerrarResultset(ResultSet rs)
    {
        try{
        if( rs != null)
            rs.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
}
