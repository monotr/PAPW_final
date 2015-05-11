/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.AnuncioDao;
import agenda.model.Anuncio;
import agenda.model.MetodoPago;
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
public class AnuncioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String path = "/OtherUsuarioServlet";
            String accion = request.getParameter("accion");
            String id = request.getParameter("id");
            
            String vigencia = request.getParameter("vigencia");
            String fechaPub = request.getParameter("fechaPub");
            String thumbnail = request.getParameter("thumbnail");
            String producto = request.getParameter("producto");
            String metodoPago = request.getParameter("metodoPago");
            
            
            if (accion != null && id != null && accion.equals("borrar"))
            {
                AnuncioDao.borrar(Integer.parseInt(id));
            }
            else if(accion != null && accion.equals("editar")){
                Anuncio anuncio = AnuncioDao.obtenerUsuario(Integer.parseInt(id));
                request.setAttribute("anuncio", anuncio);
                path = "/anuncio_edit.jsp";
            }
            else{
                Anuncio anuncio = new Anuncio();
                anuncio.setVigencia(vigencia);
                anuncio.setFechPublicacion(null);
                anuncio.setThumbnail(null);//Blob. (thumbnail));
                anuncio.setIdProducto(Integer.parseInt(producto));
                anuncio.setIdMetodoPago(Integer.parseInt(metodoPago));
                
                if(id != null && !id.equals("")){
                    anuncio.setId(Integer.parseInt(id));
                    AnuncioDao.actualizar(anuncio);
                }
                else{
                    AnuncioDao.insertar(anuncio);
                }
            }
            
            List<Anuncio> anun = AnuncioDao.buscar();
            request.setAttribute("anuncios", anun);
                        
            RequestDispatcher disp = getServletContext().getRequestDispatcher(path);
            disp.forward(request, response);
        }
        finally {            
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
            Logger.getLogger(AnuncioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AnuncioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
