<%-- 
    Document   : anuncio_lista
    Created on : 6/05/2015, 12:38:47 AM
    Author     : Monotr_
--%>

<%@page import="agenda.data.AnuncioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agenda.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anuncios</title>
    </head>
    <body>
        <div allign="center">
            <h1>Mis Anuncios</h1>
            <table width ="70%" border ="1" cellpadding ="5" cellspacing ="5">
                <tr>
                    <td colspan ="4"/>
                    <td colspann ="2" align ="center">
                        <form action="anuncio_edit.jsp" method ="post">
                            <input type="submit" value="Nuevo"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th width ="14.66%" > Thumbnail </th>
                    <th width ="14.66%" > Nombre Producto </th> <!-- ID por mientras -->
                    <th width ="14.66%" > Descripción larga </th>
                    <th width ="14.66%" > Fecha de publicación </th>
                    <th width ="14.66%" > Vigencia </th>
                    <th width ="14.66%" > Método de pago </th>
                    <th width ="6%" > Editar </th>
                    <th width ="6%" > Borrar </th>
                </tr>
                <%
                    
                    List<Anuncio> anunc = AnuncioDao.buscar();
                    request.setAttribute("anuncios", anunc);
                    
                    if(request.getAttribute("anuncios") != null)
                    {
                        List<Anuncio> anuncios = (ArrayList<Anuncio>)request.getAttribute("anuncios");
                        for(Anuncio anuncio: anuncios)
                        {
                %>
                
                <tr>
                    <td><%= anuncio.getThumbnail()%> </td> 
                    <td><%= anuncio.getId()%> - <%= anuncio.getNombreMP()%> </td> 
                    <td>DESC HERE </td> 
                    <td><%= anuncio.getFechPublicacion() %> </td>
                    <td><%= anuncio.getVigencia()%> </td>
                    <td><%= anuncio.getNombreProducto()%> </td>
                    <td align="center"><a href="AnuncioServlet?accion=editar&id=<%= anuncio.getId()%>">Editar</a> </td> 
                    <td align="center"><a href="AnuncioServlet?accion=borrar&id=<%= anuncio.getId()%>">Borrar</a> </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
