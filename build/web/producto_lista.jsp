<%-- 
    Document   : index
    Created on : 24-mar-2015, 12:52:57
    Author     : FCFM
--%>
<%@page import="agenda.data.AnuncioDao"%>
<%@page import="agenda.model.Anuncio"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="agenda.model.Producto"%>
<%@page import="agenda.model.Usuario"%>
<%@page import="agenda.data.UsuarioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <div allign="center">
            <h1>Mis productos</h1>
            
            <!-- MAS VENDIDOS -->
    <fieldset> 
     <legend>Mas vendidos:</legend>
      
      <%
           List<Anuncio> anuns = AnuncioDao.busqueda_home(0);
           request.setAttribute("anuncios_home0", anuns);
                    
            if(request.getAttribute("anuncios_home0") != null)
            {
                List<Anuncio> anuncios = (ArrayList<Anuncio>)request.getAttribute("anuncios_home0");
                for(Anuncio anuncio: anuncios)
                {
         %>    
     <div class="prod_box">
        <div class="center_prod_box">
          <div class="prod_price"><span class="price"> <%=anuncio.getDescCorta()%> </span></div>
          <div class="prod_price"><span class="price"> <%=anuncio.getPrecio()%> </span></div>
          <div class="prod_nickname"><span class="nickname"> <%=anuncio.getNickname()%> </span></div>
          <div class="prod_nickname"><span class="nickname"> <%=anuncio.getFechPublicacion()%> </span></div>
          <div class="product_img"><a href="Detalle_producto.html"><img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + anuncio.getIdProducto() + "&col=1" %>" /></a></div>  
        </div>
     </div>
      
      <% }
         }%>
      
    </fieldset>  
     <!-- FIN!!! MAS VENDIDOS -->
            
            <table width ="70%" border ="1" cellpadding ="5" cellspacing ="5">
                <tr>
                    <td colspan ="4"/>
                    <td colspann ="2" align ="center">
                        <form action="producto_edit.jsp" method ="post">
                        <!--<form action="AgendaServlet" method ="post">-->
                            <input type="submit" value="Nuevo"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th width ="12.57%" > Imagen1 </th>
                    <th width ="12.57%" > Imagen2 </th>
                    <th width ="12.57%" > Imagen3 </th>
                    <th width ="12.57%" > Video1 </th>
                    <th width ="12.57%" > Video2 </th>
                    <th width ="12.57%" > Video3 </th>
                    <th width ="12.57%" > Descripción corta </th>
                    <th width ="12.57%" > Descripción larga </th>
                    <th width ="12.57%" > Precio </th>
                    <th width ="12.57%" > Existencia </th>
                    <th width ="12.57%" > Vigencia </th>
                    <th width ="12.57%" > Subcategoría </th>
                    <th width ="6%" > Editar </th>
                    <th width ="6%" > Borrar </th>
                </tr>
                <%
                    
                    List<Producto> product = ProductoDao.buscar();
                    request.setAttribute("productos", product);
                    
                    if(request.getAttribute("productos") != null)
                    {
                        List<Producto> productos = (ArrayList<Producto>)request.getAttribute("productos");
                        for(Producto producto: productos)
                        {
                %>
                
                <tr>
                    <td><img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=1" %>" /> </td>
                    <td><img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=2" %>" /> </td>
                    <td><img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=3" %>" /> </td>
                    <td>
                        <% if(producto.getVideo1() != null){ %>
                        <video width="100px" height="100px" controls="controls">
                        <source src="<%=request.getServletContext().getContextPath() + "/" + producto.getVideo1() %>" type="video/mp4">
                        Tu navegador no soporta el tag de video.</video>
                        <% } %>
                    </td>
                    <td>
                        <% if(producto.getVideo2() != null){ %>
                        <video width="100px" height="100px" controls="controls">
                        <source src="<%=request.getServletContext().getContextPath() + "/" + producto.getVideo2() %>" type="video/mp4">
                        Tu navegador no soporta el tag de video.</video>
                        <% } %>
                    </td>
                    <td>
                        <% if(producto.getVideo3() != null){ %>
                        <video width="100px" height="100px" controls="controls">
                        <source src="<%=request.getServletContext().getContextPath() + "/" + producto.getVideo3() %>" type="video/mp4">
                        Tu navegador no soporta el tag de video.</video>
                        <% } %>
                    </td>
                    <td><%= producto.getDescCorta() %> </td> 
                    <td><%= producto.getDescLarga() %> </td> 
                    <td><%= producto.getPrecio() %> </td> 
                    <td><%= producto.getExistencia() %> </td>
                    <td><%= producto.getVigencia()%> </td>
                    <td><%= producto.getNombreSubcategoria()%> </td>
                    <td align="center"><a href="ProductoServlet?accion=editar&id=<%= producto.getId()%>">Editar</a> </td> 
                    <td align="center"><a href="ProductoServlet?accion=borrar&id=<%= producto.getId()%>">Borrar</a> </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
