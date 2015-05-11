package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import agenda.model.Anuncio;
import java.util.ArrayList;
import java.util.List;

public final class Busqueda_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body  onload=\"check();\">\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        \n");
      out.write("        <div class=\"top_bar\">\n");
      out.write("            <div id=\"logo\">\n");
      out.write("                <form action=\"index.html\">\n");
      out.write("                    <input type=\"image\" src=\"Css/images/demo_logo.png\" alt=\"Submit\" width=\"120\" height=\"100\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"serch\"> \n");
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
      out.write("            </div>\n");
      out.write("                            \n");
      out.write("            <script>\n");
      out.write("                function check() {\n");
      out.write("                    if(document.getElementById(\"fechaOpt\").checked){\n");
      out.write("                        document.getElementById(\"fechaDesde\").style.display = 'block';\n");
      out.write("                        document.getElementById(\"fechaHasta\").style.display = 'block';\n");
      out.write("                        \n");
      out.write("                        document.getElementById(\"fechaDesde\").value = (new Date()).format(\"dd/mm/yyyy\");\n");
      out.write("                        document.getElementById(\"fechaDesde\").value = (new Date()).format(\"dd/mm/yyyy\");\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        document.getElementById(\"fechaDesde\").style.display = 'none';\n");
      out.write("                        document.getElementById(\"fechaHasta\").style.display = 'none';\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("             \n");
      out.write("            <div class=\"top_bar_options\">\n");
      out.write("                 <a href=\"Perfil.html\">Perfil</a>\n");
      out.write("                 <a href=\"login.html\">Login</a>\n");
      out.write("                 <a href=\"singup.html\">Singup</a>          \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <div>\n");
      out.write("                ");

                    if(request.getAttribute("anuncios") != null)
                    {
                        List<Anuncio> anuncios = (ArrayList<Anuncio>)request.getAttribute("anuncios");
                        for(Anuncio anunciox: anuncios)
                        {
                
      out.write("\n");
      out.write("                    ");
      out.print( anunciox.getThumbnail());
      out.write(" / ");
      out.print( anunciox.getNombreProducto());
      out.write("  / ");
      out.print( anunciox.getPrecio());
      out.write(" / ");
      out.print( anunciox.getExistencia());
      out.write(" / ");
      out.print( anunciox.getSubcategoria());
      out.write("\n");
      out.write("                    <hr>\n");
      out.write("                ");

                        }
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
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
