package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import agenda.data.ProductoDao;
import agenda.model.Categoria;
import agenda.data.AnuncioDao;
import java.util.ArrayList;
import agenda.model.Anuncio;
import java.util.List;

public final class anuncio_005flista_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Let's Sell</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1252\" />\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Css/Style.css\" />\n");
      out.write("<!--[if IE 6]>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"iecss.css\" />\n");
      out.write("<![endif]-->\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"main_container\"> \n");
      out.write("          <div id=\"header\"> \n");
      out.write("\n");
      out.write("              <div class=\"categori_box\">\n");
      out.write("          <h1>Categorias:</h1>\n");
      out.write("        ");

           List<Categoria> cate = ProductoDao.buscar_categorias();
           request.setAttribute("categorias", cate);
                    
            if(request.getAttribute("categorias") != null)
            {
                List<Categoria> categorias = (ArrayList<Categoria>)request.getAttribute("categorias");
                for(Categoria categoria: categorias)
                {
         
      out.write("\n");
      out.write("        <label><a href=\"home.html\">");
      out.print( categoria.getNombre() );
      out.write("</a></label><br> <!-- falta cambiar LINK -->\n");
      out.write("             ");
 }
            }
      out.write("   \n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("         </div>\n");
      out.write("        <div id=\"main_content\">\n");
      out.write("            <div class=\"left_area\">\n");
      out.write("                \n");
      out.write("                <div class=\"left_area_content\" > <a href=\"Resumen.html\">Resumen</a> </div>\n");
      out.write("                <div class=\"left_area_content\"> <a href=\"Perfil_productos.html\">Productos </a> </div>\n");
      out.write("                <div class=\"left_area_content\"><a href=\"Perfil_Anuncio.html\"> Anuncios </a>  </div>\n");
      out.write("                <div class=\"left_area_content\"><a href=\"Perfil_compras.html\"> Compras </a>  </div>\n");
      out.write("                <div class=\"left_area_content\"> <a href=\"Configuracion_usuario.html\">Configuracion de perfil </a> </div>\n");
      out.write("\n");
      out.write("          \n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"main_perfil\">\n");
      out.write("               \n");
      out.write("              ");

                    
                    List<Anuncio> anunc = AnuncioDao.buscar();
                    request.setAttribute("anuncios", anunc);
                    
                    if(request.getAttribute("anuncios") != null)
                    {
                        List<Anuncio> anuncios = (ArrayList<Anuncio>)request.getAttribute("anuncios");
                        for(Anuncio anuncio: anuncios)
                        {
              
      out.write("\n");
      out.write("\n");
      out.write("              <div class=\"main_perfil_conteiner\"> \n");
      out.write("                    <div class=\"imagen_productosuser\"> <img src=\"Css/images/producto.png\"/>  \n");
      out.write("                       \n");
      out.write("                    </div>\n");
      out.write("                   <div class=\"detalles_contenido\">\n");
      out.write("                       <div class=\"nombre_detalle_contenido\">\n");
      out.write("                           <label for=\"nombre_producto\"><a>");
      out.print( anuncio.getNombreProducto());
      out.write("</a></label>\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"info_detalle_contenido\">\n");
      out.write("                           <label id=\"subcategoria\">");
      out.print( anuncio.getSubcategoria());
      out.write("</label><br>\n");
      out.write("                           Fecha de Publicacion:<label id=\"subcategoria\">");
      out.print( anuncio.getFechPublicacion() );
      out.write("</label>  Vigencia:<label id=\"subcategoria\">");
      out.print( anuncio.getVigencia());
      out.write("</label><br>\n");
      out.write("                           <label id=\"existencia\">Productos en existencia:</label><label id=\"existencia\">");
      out.print( anuncio.getExistencia());
      out.write("</label><br>\n");
      out.write("                       </div>\n");
      out.write("                      \n");
      out.write("                        <div class=\"prod_price_big\"><label id=\"precio\">$");
      out.print( anuncio.getPrecio());
      out.write("</label></div>\n");
      out.write("                        <div class=\"button5_pos\"><form action=\"AnuncioServlet?accion=editar&id=");
      out.print( anuncio.getId());
      out.write("\" method =\"post\"><input type=\"submit\" id=\"button2\" value=\"Editar\"/></form> </div>\n");
      out.write("                        <div class=\"button6_pos\"><form action=\"AnuncioServlet?accion=borrar&id=");
      out.print( anuncio.getId());
      out.write("\" method =\"post\"><input type=\"submit\" id=\"button3\"value=\"Eliminar\"/></form> </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                        }
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("            \n");
      out.write("        </div>  \n");
      out.write("          \n");
      out.write("          <div class=\"top_bar\">\n");
      out.write("       \n");
      out.write("       <div id=\"logo\">\n");
      out.write("       <form action=\"index.html\">\n");
      out.write("       <input type=\"image\" src=\"Css/images/demo_logo.png\" alt=\"Submit\" width=\"120\" height=\"100\">\n");
      out.write("      </form>\n");
      out.write("       </div>\n");
      out.write("       \n");
      out.write("       <!-- INICIO BUSQEUDA -->\n");
      out.write("    <div id=\"serch\"> \n");
      out.write("                <form action=\"BusquedaServlet\" method=\"post\">\n");
      out.write("                    <input type=\"text\" id=\"serch_text\" name=\"serch_text\" autofocus> \n");
      out.write("                    <button id=\"serch_button\">Search</button> \n");
      out.write("\n");
      out.write("                    <div class=\"tipo_busqueda\">\n");
      out.write("                        <input type=\"checkbox\" name=\"nombre_articulo\" checked> Nombre de Articulo\n");
      out.write("                        <input type=\"checkbox\" name=\"nombre_del_vendedor\"> Nombre del Vendedor\n");
      out.write("                        <input type=\"checkbox\" onclick=\"check();\" name=\"fechaOpt\" id=\"fechaOpt\"> Fecha\n");
      out.write("                        <br><label id=\"fechaDesde\">Fecha Desde: <input type=\"date\" name=\"fechaD\"></label>\n");
      out.write("                        <br><label id=\"fechaHasta\">Fecha Hasta: <input type=\"date\" name=\"fechaH\"></label>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("         <script>\n");
      out.write("                function check() {\n");
      out.write("                    check_new_user();\n");
      out.write("                    if(document.getElementById(\"fechaOpt\").checked){\n");
      out.write("                        document.getElementById(\"fechaDesde\").style.visibility = \"visible\";\n");
      out.write("                        document.getElementById(\"fechaHasta\").style.visibility = \"visible\";\n");
      out.write("                        \n");
      out.write("                        document.getElementById(\"fechaDesde\").value = (new Date()).format(\"dd/mm/yyyy\");\n");
      out.write("                        document.getElementById(\"fechaDesde\").value = (new Date()).format(\"dd/mm/yyyy\");\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        document.getElementById(\"fechaDesde\").style.visibility = \"hidden\";\n");
      out.write("                        document.getElementById(\"fechaHasta\").style.visibility = \"hidden\";\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                function check_new_user() {\n");
      out.write("                    if(document.getElementById(\"new_user\").checked){\n");
      out.write("                        document.getElementById(\"filaPass\").style.visibility = \"hidden\";\n");
      out.write("                        document.login.action = \"SendEmailServlet\";\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        document.getElementById(\"filaPass\").style.visibility = \"visible\";\n");
      out.write("                        document.login.action = \"index\";\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("         \n");
      out.write("         <!-- FIN BUSQEUDA -->\n");
      out.write("         \n");
      out.write("         <!-- LOGIN -->\n");
      out.write("         <form action=\"index\" method=\"post\" name=\"login\">\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"email\" value=\"\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr id=\"filaPass\">\n");
      out.write("                    <td>Password:</td>\n");
      out.write("                    <td><input type=\"password\" name=\"password\" id=\"password\" value=\"\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" value=\"Entrar\"/>\n");
      out.write("                        <input type=\"checkbox\" name=\"new_user\" id=\"new_user\" onclick=\"check_new_user();\"> Nuevo usuario\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("         \n");
      out.write("         ");
 if (request.getAttribute("mensaje") != null) { 
      out.write("\n");
      out.write("            <div style=\"color: red\">");
      out.print( request.getAttribute("mensaje") );
      out.write(" </div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        <!-- FIN LOGIN -->\n");
      out.write("       \n");
      out.write("    <div class=\"top_bar_options\">\n");
      out.write("         <a href=\"Perfil_productos.html\">Perfil</a>\n");
      out.write("        <a href=\"login.html\">Login</a>\n");
      out.write("         <a href=\"singup.html\">Singup</a>          \n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("      \n");
      out.write(" </div>\n");
      out.write("<!-- end of main_container -->\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
