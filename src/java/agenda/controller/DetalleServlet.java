/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.AgendaBD;
import agenda.model.Contacto;
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
 * @author FCFM
 */
public class DetalleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            String path = "/AgendaServlet";
            String accion = request.getParameter("accion");
            
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String direccion1 = request.getParameter("direccion1");
            String direccion2 = request.getParameter("direccion2");
            String sexo = request.getParameter("sexo");
            
            if(accion != null && accion.equals("editar")){
                Contacto contacto = AgendaBD.obtenerContacto(Integer.parseInt(id));
                request.setAttribute("contacto", contacto);
                path = "/detalle_contacto.jsp";
            }
            else{
                Contacto contacto = new Contacto();
                contacto.setNombre(nombre);
                contacto.setApellido(apellido);
                contacto.setTelefono(telefono);
                contacto.setEmail(email);
                contacto.setDireccion1(direccion1);
                contacto.setDireccion2(direccion2);
                contacto.setSexo(Integer.parseInt(sexo) == 1 ? true : false);
                
                if(id != null && id.equals("")){
                    contacto.setId(Integer.parseInt(id));
                    AgendaBD.actualizar(contacto);
                }
                else{
                    AgendaBD.insertar(contacto);
                }
            }
            
            List<Contacto> contact = AgendaBD.buscar();
            request.setAttribute("contactos", contact);
            
            RequestDispatcher disp = getServletContext().getRequestDispatcher(path);
            disp.forward(request, response);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
            Logger.getLogger(DetalleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
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
            Logger.getLogger(DetalleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
