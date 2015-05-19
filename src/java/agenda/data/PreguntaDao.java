/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.data;

import agenda.model.Pregunta;
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
public class PreguntaDao {
    
    public static int insertarPregunta(Pregunta pregunta) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs;
        cs = null;
        try
        {
            String query = "{CALL sp_NuevaPregunta (?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,pregunta.getTextoPregunta());
            cs.setFloat(2,pregunta.getIdUsuario());
            cs.setInt(3,pregunta.getIdAnuncio());
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
        
    public static int agregarRespuesta(Pregunta pregunta) throws SQLException
    {
        ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        try
        {
            String query = "{call agregar_respuesta (?,?,?)}";
            cs = con.prepareCall(query);
            cs.setString(1,pregunta.getTextoRespuesta());
            cs.setString(2,null);
            cs.setFloat(3,pregunta.getIdPregunta());
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
            String query = "{call borrar_pregunta (?)}";
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
    
    public static List<Pregunta> buscar(int id, boolean anuncioUsuario) throws SQLException
    {
       ConexionPool pool = ConexionPool.getInstancia();
        Connection con = pool.getConexion();
        CallableStatement cs = null;
        ResultSet rs = null;
        try
        {
            if(anuncioUsuario)
                cs = con.prepareCall("{call buscar_preguntas_por_usuario(?)}");
            else
                cs = con.prepareCall("{call buscar_preguntas_por_anuncio(?)}");
            
            cs.setInt(1, id);
            rs = cs.executeQuery();
            
            List<Pregunta> preguntas = new ArrayList<Pregunta>();
            while(rs.next()){
                Pregunta pregunta = new Pregunta();
                pregunta.setIdPregunta(rs.getInt("idPregunta"));
                pregunta.setTextoPregunta(rs.getString("textoPregunta"));
                pregunta.setFechaPregunta(rs.getString("fechaPregunta"));
                pregunta.setTextoRespuesta(rs.getString("textoRespuesta"));
                pregunta.setFechaRespuesta(rs.getString("fechaRespuesta"));
                pregunta.setRespuestaRealizada(rs.getInt("respuestaRealizada"));
                pregunta.setIdUsuario(rs.getInt("Usuario_id"));
                pregunta.setIdAnuncio(rs.getInt("Anuncio_id"));
                if(anuncioUsuario){
                    pregunta.setIdProducto(rs.getInt("idProducto"));
                    pregunta.setDescCorta(rs.getString("descripcionCorta"));
                }
                preguntas.add(pregunta);
            }
            return preguntas;
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
