/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.EmailUtility;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
public class SendEmailServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;
    
    @Override
    public void init() {
        // Lee la configuacion del servidor SMTP desde el archivo web.xml
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aqui implementamos la logica para activar la cuenta de usuario
        // Se ejecuta cuando se le da click al link que viende dentro del correo
        System.out.println("EMAIL: " + request.getParameter("email"));
        System.out.println("CODIGO: " + request.getParameter("codigo"));
        
        
        
        getServletContext().getRequestDispatcher("/activation.jsp").forward(
                    request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String result = "Email enviado correctamente.";
        try {
            String verificationCode = UUID.randomUUID().toString();
            
            // El link que viene en el mensaje en este caso apunta a una direccion 
            // en la propia maquina. Si se instalara la aplicacion en un servidor web
            // se debe de cambiar por el dominio o la ip del servidor.
            String message = "<html><body>";
            message += "Presiona click para activar la cuenta.<br/>";
            message += "<a href='http://localhost:8084/emaildemo/sendEmail?email=" +
                    email + "&codigo=" + verificationCode + "'>Activar</a>";
            message += "</body></html>";
            EmailUtility.sendEmail(host, port, user, pass, email, 
                    "Bienvenido!!!", message);
        } catch (Exception ex) {
            ex.printStackTrace();
            result = "Ocurrio un error.";
        } finally {
            request.setAttribute("result", result);
            getServletContext().getRequestDispatcher("/emailResult.jsp").forward(
                    request, response);
        }
    }
}