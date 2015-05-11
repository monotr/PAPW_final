/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.UsuarioDao;
import agenda.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos
 */
public class IndexServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String accion = request.getParameter("accion");
        if ("borrar".equals(accion)) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            session.invalidate();
            RequestDispatcher disp = getServletContext().
                        getRequestDispatcher("/index.jsp");
            disp.forward(request, response);
            
        } else {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Usuario user = UsuarioDao.validarLogin(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user); //aqui mete valorea a guardar en usuario
                RequestDispatcher disp = getServletContext().
                        getRequestDispatcher("/lista.jsp");
                disp.forward(request, response);
            } else {
                String mensaje = "Usuario no existe.";
                request.setAttribute("mensaje", mensaje);
                RequestDispatcher disp = getServletContext().
                        getRequestDispatcher("/index.jsp");
                disp.forward(request, response);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
