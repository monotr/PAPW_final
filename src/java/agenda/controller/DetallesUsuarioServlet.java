/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.ArchivoDao;
import agenda.data.UsuarioDao;
import agenda.model.Archivo;
import agenda.model.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Monotr_
 */
public class DetallesUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private final String directorio = "archivos";
    
    private String extractExtension(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String filename = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return filename.substring(filename.indexOf(".") - 1, filename.length());
            }
        }
        return "";
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String path = "/OtherUsuarioServlet";
            String accion = request.getParameter("accion");
            String id = request.getParameter("id");
            
            String nickname = request.getParameter("nickname");
            String contrasenia = request.getParameter("contrasenia");
            String nombre = request.getParameter("nombre");
            String apellidoPaterno = request.getParameter("apellidoPaterno");
            String apellidoMaterno = request.getParameter("apellidoMaterno");
            String fechaNacimiento = request.getParameter("fechaNacimiento");
            String email = request.getParameter("email");
            String calle = request.getParameter("calle");
            String numero = request.getParameter("numero");
            String colonia = request.getParameter("colonia");
            String ciudad = request.getParameter("ciudad");
            String estado = request.getParameter("estado");
            String pais = request.getParameter("pais");
            String cp = "";
            if(contrasenia == null)
               cp = request.getParameter("cp");
            String sexo = request.getParameter("sexo");       
            
            
            if(accion != null && accion.equals("borrar")){
                UsuarioDao.borrar(Integer.parseInt(id));
                
                HttpSession session = request.getSession();
                session.removeAttribute("user");
                session.removeAttribute("id");
                session.removeAttribute("nickname");
                session.invalidate();
                
                path = "/index.jsp";
            }
            else if(accion != null && accion.equals("editar")){
                Usuario usuario = UsuarioDao.obtenerUsuario(Integer.parseInt(id));
                request.setAttribute("usuario", usuario);
                path = "/usuario_create.jsp";
            }
            else{
                //DATOS USUARIO
                Usuario usuario = new Usuario();
                usuario.setNickname(nickname);
                usuario.setContrasenia(contrasenia);
                usuario.setNombre(nombre);
                usuario.setApellidoPaterno(apellidoPaterno);
                usuario.setApellidoMaterno(apellidoMaterno);
                usuario.setFechaNacimiento(fechaNacimiento);
                usuario.setEmail(email);
                usuario.setCalle(calle);
                usuario.setNumCasa(numero);
                usuario.setColonia(colonia);
                usuario.setCiudad(ciudad);
                usuario.setEstado(estado);
                usuario.setPais(pais);
                if(contrasenia == null)
                    usuario.setCp(Integer.parseInt(cp));
                usuario.setSexo(sexo);
                
                if(id != null && !id.equals("")){
                    usuario.setId(Integer.parseInt(id));
                    if(contrasenia == null)
                        UsuarioDao.actualizar(usuario);
                    else
                        UsuarioDao.actualizarContrasena(usuario);
                }
                else{
                    UsuarioDao.insertar(usuario);
                    id = "0";
                }
                
                //IMAGEN
            if(request.getPart("archivo") != null && !request.getPart("archivo").equals("")){
                String uploadPath = getServletContext().getRealPath("/" + directorio + "/");
                System.out.println("PATH: " + uploadPath);

                File fdir = new File(uploadPath);
                if (!fdir.exists()) {
                    fdir.mkdir();
                }

                Archivo archivo = new Archivo();
                archivo.setIdUser(Integer.parseInt(id));
                
                Part filePart = request.getPart("archivo");
                if (filePart != null && filePart.getSize() > 0) {
                    String contentType = filePart.getContentType();
                    if (!contentType.equals("video/mp4") 
                            && !contentType.equals("image/jpeg")) {
                        request.setAttribute("error", "Archivo con formato incorrecto.");
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/desplegar.jsp");
                        disp.forward(request, response);

                    } else {
                        archivo.setTipo(contentType);
                        String nombreArchivo = String.valueOf(System.currentTimeMillis());
                        nombreArchivo += extractExtension(filePart);

                        if (contentType.equals("video/mp4")) {
                            String pathVID = directorio + "/" + nombreArchivo;
                            archivo.setUbicacion(pathVID);
                            ArchivoDao.insertarVideo(archivo, 0);
                            filePart.write(uploadPath + "/" + nombreArchivo);
                            request.setAttribute("path", pathVID);

                        } else if (contentType.equals("image/jpeg")) {
                            InputStream inputStream = filePart.getInputStream();
                            archivo.setStream(inputStream);
                            /*int idIMG =*/ ArchivoDao.insertarImagen(archivo, 0, 0);
                            //request.setAttribute("id", idIMG);
                        }
                    }
                }
            }
                
                
            }
            
            List<Usuario> user = UsuarioDao.buscar();
            request.setAttribute("usuarios", user);
            
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
            Logger.getLogger(DetallesUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DetallesUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
