package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import agenda.model.Categoria;
import agenda.data.ProductoDao;
import agenda.model.Producto;
import agenda.model.Usuario;
import agenda.data.UsuarioDao;
import java.util.ArrayList;
import java.util.List;

public final class producto_005flista_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Productos</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div allign=\"center\">\n");
      out.write("            <h1>Mis productos</h1>\n");
      out.write("            \n");
      out.write("            <div class=\"categori_box\">\n");
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
      out.write("   \t\t\t<label><a href=\"home.html\">");
 categoria.getNombre(); 
      out.write("</a></label><br>\n");
      out.write("             ");
 } 
      out.write("   \n");
      out.write("      </div>\n");
      out.write("            \n");
      out.write("            <table width =\"70%\" border =\"1\" cellpadding =\"5\" cellspacing =\"5\">\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan =\"4\"/>\n");
      out.write("                    <td colspann =\"2\" align =\"center\">\n");
      out.write("                        <form action=\"producto_edit.jsp\" method =\"post\">\n");
      out.write("                        <!--<form action=\"AgendaServlet\" method =\"post\">-->\n");
      out.write("                            <input type=\"submit\" value=\"Nuevo\"/>\n");
      out.write("                        </form>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th width =\"12.57%\" > Imagen1 </th>\n");
      out.write("                    <th width =\"12.57%\" > Imagen2 </th>\n");
      out.write("                    <th width =\"12.57%\" > Imagen3 </th>\n");
      out.write("                    <th width =\"12.57%\" > Video1 </th>\n");
      out.write("                    <th width =\"12.57%\" > Video2 </th>\n");
      out.write("                    <th width =\"12.57%\" > Video3 </th>\n");
      out.write("                    <th width =\"12.57%\" > Descripción corta </th>\n");
      out.write("                    <th width =\"12.57%\" > Descripción larga </th>\n");
      out.write("                    <th width =\"12.57%\" > Precio </th>\n");
      out.write("                    <th width =\"12.57%\" > Existencia </th>\n");
      out.write("                    <th width =\"12.57%\" > Vigencia </th>\n");
      out.write("                    <th width =\"12.57%\" > Subcategoría </th>\n");
      out.write("                    <th width =\"6%\" > Editar </th>\n");
      out.write("                    <th width =\"6%\" > Borrar </th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    
                    List<Producto> product = ProductoDao.buscar();
                    request.setAttribute("productos", product);
                    
                    if(request.getAttribute("productos") != null)
                    {
                        List<Producto> productos = (ArrayList<Producto>)request.getAttribute("productos");
                        for(Producto producto: productos)
                        {
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td><img width=\"30px\" height=\"30px\" src=\"");
      out.print( request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=1" );
      out.write("\" /> </td>\n");
      out.write("                    <td><img width=\"30px\" height=\"30px\" src=\"");
      out.print( request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=2" );
      out.write("\" /> </td>\n");
      out.write("                    <td><img width=\"30px\" height=\"30px\" src=\"");
      out.print( request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=3" );
      out.write("\" /> </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
 if(producto.getVideo1() != null){ 
      out.write("\n");
      out.write("                        <video width=\"100px\" height=\"100px\" controls=\"controls\">\n");
      out.write("                        <source src=\"");
      out.print(request.getServletContext().getContextPath() + "/" + producto.getVideo1() );
      out.write("\" type=\"video/mp4\">\n");
      out.write("                        Tu navegador no soporta el tag de video.</video>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
 if(producto.getVideo2() != null){ 
      out.write("\n");
      out.write("                        <video width=\"100px\" height=\"100px\" controls=\"controls\">\n");
      out.write("                        <source src=\"");
      out.print(request.getServletContext().getContextPath() + "/" + producto.getVideo2() );
      out.write("\" type=\"video/mp4\">\n");
      out.write("                        Tu navegador no soporta el tag de video.</video>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
 if(producto.getVideo3() != null){ 
      out.write("\n");
      out.write("                        <video width=\"100px\" height=\"100px\" controls=\"controls\">\n");
      out.write("                        <source src=\"");
      out.print(request.getServletContext().getContextPath() + "/" + producto.getVideo3() );
      out.write("\" type=\"video/mp4\">\n");
      out.write("                        Tu navegador no soporta el tag de video.</video>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>");
      out.print( producto.getDescCorta() );
      out.write(" </td> \n");
      out.write("                    <td>");
      out.print( producto.getDescLarga() );
      out.write(" </td> \n");
      out.write("                    <td>");
      out.print( producto.getPrecio() );
      out.write(" </td> \n");
      out.write("                    <td>");
      out.print( producto.getExistencia() );
      out.write(" </td>\n");
      out.write("                    <td>");
      out.print( producto.getVigencia());
      out.write(" </td>\n");
      out.write("                    <td>");
      out.print( producto.getNombreSubcategoria());
      out.write(" </td>\n");
      out.write("                    <td align=\"center\"><a href=\"ProductoServlet?accion=editar&id=");
      out.print( producto.getId());
      out.write("\">Editar</a> </td> \n");
      out.write("                    <td align=\"center\"><a href=\"ProductoServlet?accion=borrar&id=");
      out.print( producto.getId());
      out.write("\">Borrar</a> </td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                        }
                    }
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
