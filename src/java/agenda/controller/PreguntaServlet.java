/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.PreguntaDao;
import agenda.model.Pregunta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monotr_
 */
public class PreguntaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String path, id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            
            String accion = request.getParameter("accion");
            id = request.getParameter("id");
            path = "/anuncioDetalle.jsp?id=" + id;
            String textoRespuesta = request.getParameter("respuesta");
            String textoPregunta = request.getParameter("pregunta");
            String idUsuario = request.getParameter("idUsuario");
            
            if (accion != null && id != null && accion.equals("borrar"))
            {
                PreguntaDao.borrar(Integer.parseInt(id));
                path = "/resumen_usuario.jsp";
            }
            else if(accion != null && accion.equals("responder")){
                Pregunta respuesta = new Pregunta();
                respuesta.setTextoRespuesta(textoRespuesta);
                respuesta.setIdPregunta(Integer.parseInt(id));
                PreguntaDao.agregarRespuesta(respuesta);
                path = "/resumen_usuario.jsp";
            }
            else if(accion != null && accion.equals("preguntar")){
                Pregunta pregunta = new Pregunta();
                pregunta.setTextoPregunta(textoPregunta);
                pregunta.setIdAnuncio(Integer.parseInt(id));
                pregunta.setIdUsuario(Integer.parseInt(idUsuario));
                PreguntaDao.insertarPregunta(pregunta);
            }
        }
        finally {
            RequestDispatcher disp = getServletContext().getRequestDispatcher(path);
            disp.forward(request, response);
            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
