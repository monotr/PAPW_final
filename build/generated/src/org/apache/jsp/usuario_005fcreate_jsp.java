package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import agenda.model.Usuario;

public final class usuario_005fcreate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Detalle de Usuario</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div align =\"center\">\n");
      out.write("        <h1>Detalle de Usuario</h1>\n");
      out.write("            ");

                Usuario usuario = (Usuario) request.getAttribute("usuario");
            
      out.write("\n");
      out.write("            <form action=\"DetallesUsuarioServlet\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                <table width =\"25%\" border =\"1\" cellpadding =\"5\" cellspacing =\"5\">\n");
      out.write("                    <tr>\n");
      out.write("                        <th width=\"30%\">Nickame: </th>\n");
      out.write("                        <td width=\"70%\"><input type=\"text\" name=\"nickname\" value=\"");
      out.print( usuario == null? "" : usuario.getNickname());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th width=\"30%\">Contraseña: </th>\n");
      out.write("                        <td width=\"70%\"><input type=\"text\" name=\"contrasenia\" value=\"");
      out.print( usuario == null? "" : usuario.getContrasenia());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th width=\"30%\">Imagen de usuario: </th>\n");
      out.write("                        <td width=\"70%\"><input type=\"file\" name=\"archivo\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th width=\"30%\">Nombre: </th>\n");
      out.write("                        <td width=\"70%\"><input type=\"text\" name=\"nombre\" value=\"");
      out.print( usuario == null? "" : usuario.getNombre());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Apellido Paterno: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"apellidoPaterno\" value=\"");
      out.print( usuario == null? "" : usuario.getApellidoPaterno());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Apellido Meterno: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"apellidoMaterno\" value=\"");
      out.print( usuario == null? "" : usuario.getApellidoMaterno());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Fecha Nacimiento: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"fechaNacimiento\" value=\"");
      out.print( usuario == null? "" : usuario.getFechaNacimiento());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                     <tr>\n");
      out.write("                        <th>Email: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"email\" value=\"");
      out.print( usuario == null? "" : usuario.getEmail());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                     <tr>\n");
      out.write("                        <th>Calle: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"calle\" value=\"");
      out.print( usuario == null? "" : usuario.getCalle());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Número: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"numero\" value=\"");
      out.print( usuario == null? "" : usuario.getNumCasa());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Colonia: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"colonia\" value=\"");
      out.print( usuario == null? "" : usuario.getColonia());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Ciudad </th>\n");
      out.write("                        <td><input type=\"text\" name=\"ciudad\" value=\"");
      out.print( usuario == null? "" : usuario.getCiudad());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Estado </th>\n");
      out.write("                        <td><input type=\"text\" name=\"estado\" value=\"");
      out.print( usuario == null? "" : usuario.getEstado());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>País: </th>\n");
      out.write("                        <td><input type=\"text\" name=\"pais\" value=\"");
      out.print( usuario == null? "" : usuario.getPais());
      out.write("\"</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Sexo: </th>\n");
      out.write("                        <td>\n");
      out.write("                        ");

                            if (usuario == null || usuario.getSexo() == ""){                                
                            
      out.write("\n");
      out.write("                                <input type=\"radio\" name=\"sexo\" value=\"1\" checked/> Hombre                 \n");
      out.write("                                <input type=\"radio\" name=\"sexo\" value=\"2\" /> Mujer\n");
      out.write("                        ");

                            }
                            else {
                            
      out.write("\n");
      out.write("                            <input type=\"radio\" name=\"sexo\" value=\"1\"/> Hombre                 \n");
      out.write("                            <input type=\"radio\" name=\"sexo\" value=\"2\" checked/> Mujer\n");
      out.write("                            ");

                            }
                            
      out.write("\n");
      out.write("                        </td>                      \n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\" align=\"center\">\n");
      out.write("                            <input type=\"hidden\" name=\"id\" value=\"");
      out.print( usuario == null? "" : usuario.getId());
      out.write("\"/>\n");
      out.write("                            <input type=\"submit\" value=\"Guardar\"/>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
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
