/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.EmailUtility;
import agenda.data.UsuarioDao;
import agenda.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monotr_
 */
public class EmailCompraServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;
    private String path;
    private String email;
    
    @Override
    public void init() {
        // Lee la configuacion del servidor SMTP desde el archivo web.xml
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String vendedor = request.getParameter("vendedor");
        String nombreProd = request.getParameter("nombreProd");
        String comprador = request.getParameter("comprador");
        String precioUnitario = request.getParameter("precioUnitario");
        String cantidad = request.getParameter("cantidad");
        String result = "Email enviado correctamente.";
        String anuncioID = request.getParameter("anuncioID");
        
        Usuario user_comprador = new Usuario();
        try {
            user_comprador = UsuarioDao.obtenerUsuario(Integer.parseInt(comprador));
        } catch (SQLException ex) {
            Logger.getLogger(EmailCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Usuario user_vendedor = new Usuario();
        try {
            user_vendedor = UsuarioDao.obtenerUsuario(Integer.parseInt(vendedor));
        } catch (SQLException ex) {
            Logger.getLogger(EmailCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        email = user_vendedor.getEmail();
        
        try {
            // El link que viene en el mensaje en este caso apunta a una direccion 
            // en la propia maquina. Si se instalara la aplicacion en un servidor web
            // se debe de cambiar por el dominio o la ip del servidor.
            String message = "<html><body>";
            message += "Felicidades " + user_vendedor.getNickname() + "!<br/>";
            message += "El usuario " + user_comprador.getNickname() + " ha realizado una compra de " + cantidad + " de tu artículo " + nombreProd + "<br/>";
            message += "El total de la compra sería de $" + (Float.parseFloat(cantidad)*Float.parseFloat(precioUnitario)) + "<br/>";
            message += "Para concretar la venta es necesario que accedas a Perfíl>Ventas y la aceptes  <br/>";
            message += "<a href='http://52.25.27.233:8080/LMAD_store/producto_lista.jsp'>Ir a tu perfil</a>";
            message += "</body></html>";
            EmailUtility.sendEmail(host, port, user, pass, email, 
                    "Has hecho una venta!", message);
            
            path = "/CompraServlet?cantidad="+cantidad
                    +"&precioUnitario="+precioUnitario+"&"
                    +"&comprador="+comprador
                    +"&anuncioID="+anuncioID;
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
            result = "Ocurrio un error.";
        } finally {
            RequestDispatcher disp = getServletContext().getRequestDispatcher(path);
            disp.forward(request, response);
        }
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
