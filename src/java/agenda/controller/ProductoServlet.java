/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.controller;

import agenda.data.ArchivoDao;
import agenda.data.ProductoDao;
import agenda.model.Archivo;
import agenda.model.Producto;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Monotr_
 */
public class ProductoServlet extends HttpServlet {

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
            
            String descCorta = request.getParameter("descCorta");
            String descLarga = request.getParameter("descLarga");
            String precio = request.getParameter("precio");
            String existencia = request.getParameter("existencia");
            String vigencia = request.getParameter("vigencia");
            String[] multimedia = {"imagen1","imagen2","imagen3","video1","video2","video3"};
            String idUsuario = request.getParameter("idUsuario");
            String subcategoria = request.getParameter("subcategoria");
            
            
            if (accion != null && id != null && accion.equals("borrar"))
            {
                ProductoDao.borrar(Integer.parseInt(id));
            }
            else if(accion != null && accion.equals("editar")){
                Producto producto = ProductoDao.obtenerUsuario(Integer.parseInt(id));
                request.setAttribute("producto", producto);
                path = "/producto_edit.jsp";
            }
            else{
                Producto producto = new Producto();
                producto.setDescCorta(descCorta);
                producto.setDescLarga(descLarga);
                producto.setPrecio(Float.parseFloat(precio));
                producto.setExistencia(Integer.parseInt(existencia));
                producto.setVigencia(vigencia);
                producto.setImagen1(null);//Blob. (imagen1));
                producto.setImagen2(null);//imagen2);
                producto.setImagen3(null);//imagen3);
                producto.setVideo1(null);//video1);
                producto.setVideo2(null);//video2);
                producto.setVideo3(null);//video3);
                producto.setIdUsuario(Integer.parseInt(idUsuario));
                producto.setIdSubcategoria(Integer.parseInt(subcategoria));
                
                if(id != null && !id.equals("")){
                    producto.setId(Integer.parseInt(id));
                    ProductoDao.actualizar(producto);
                }
                else{
                    ProductoDao.insertar(producto);
                    id = "0";
                }
                
                //IMAGEN
                String uploadPath = getServletContext().getRealPath("/" + directorio + "/");
                System.out.println("PATH: " + uploadPath);

                File fdir = new File(uploadPath);
                if (!fdir.exists()) {
                    fdir.mkdir();
                }

                for(int i=0; i<6; i++){
                    if(request.getPart(multimedia[i]) != null){
                        Part filePart = request.getPart(multimedia[i]);
                        Archivo archivo = new Archivo();
                        archivo.setIdUser(Integer.parseInt(id));

                        if (filePart != null && filePart.getSize() > 0) {
                            String contentType = filePart.getContentType();
                            if (!contentType.equals("video/mp4") 
                                    && !contentType.equals("image/jpeg")
                                    && !contentType.equals("image/png")) {
                                request.setAttribute("error", "Archivo con formato incorrecto.");
                            } else {
                                archivo.setTipo(contentType);
                                String nombreArchivo = String.valueOf(System.currentTimeMillis());
                                nombreArchivo += extractExtension(filePart);

                                if (contentType.equals("video/mp4") && i>2) {
                                    String pathVID = directorio + "/" + nombreArchivo;
                                    archivo.setUbicacion(pathVID);
                                    ArchivoDao.insertarVideo(archivo, i);
                                    filePart.write(uploadPath + "/" + nombreArchivo);
                                    request.setAttribute("path", pathVID);

                                } else if ((contentType.equals("image/jpeg") ||
                                        contentType.equals("image/png")) && i<3) {
                                    InputStream inputStream = filePart.getInputStream();
                                    archivo.setStream(inputStream);
                                    /*int idIMG =*/ ArchivoDao.insertarImagen(archivo, 1, i);
                                    //request.setAttribute("id", idIMG);
                                }
                                else{
                                    
                                }
                            }
                        }
                    }
                }
            }
            
            List<Producto> prod = ProductoDao.buscar(Integer.parseInt(id));
            request.setAttribute("productos", prod);
            
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
            Logger.getLogger(ProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
