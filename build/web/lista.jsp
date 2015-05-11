<%-- 
    Document   : index
    Created on : 24-mar-2015, 12:52:57
    Author     : FCFM
--%>
<%@page import="agenda.model.Usuario"%>
<%@page import="agenda.data.UsuarioDao"%>
<%@page import="agenda.data.AgendaBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="agenda.model.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda MVC</title>
    </head>
    <body>
        <div allign="center">
            <h1>Mis contactos</h1>
            <table width ="70%" border ="1" cellpadding ="5" cellspacing ="5">
                <tr>
                    <td colspan ="4"/>
                    <td colspann ="2" align ="center">
                        <form action="usuario_create.jsp" method ="post">
                        <!--<form action="AgendaServlet" method ="post">-->
                            <input type="submit" value="Nuevo"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th width ="22%" > Imagen </th>
                    <th width ="22%" > Apellido </th>
                    <th width ="22%" > Nombre </th>
                    <th width ="22%" > Telefono </th>
                    <th width ="22%" > Email </th>
                    <th width ="6%" > Editar </th>
                    <th width ="6%" > Borrar </th>
                </tr>
                <%
                    
                    List<Usuario> user = UsuarioDao.buscar();
                    request.setAttribute("usuarios", user);
                    
                    if(request.getAttribute("usuarios") != null)
                    {
                        List<Usuario> usuarios = (ArrayList<Usuario>)request.getAttribute("usuarios");
                        for(Usuario usuario: usuarios)
                        {
                %>
                
                <tr>
                    <td><img width="50px" height="50px" src="<%= request.getServletContext().getContextPath() + "/UsuarioMultimediaServlet?id=" + usuario.getId() %>" /> </td>
                    <td><%= usuario.getNickname()%> </td> 
                    <td><%= usuario.getNombre() %> </td> 
                    <td><%= usuario.getApellidoPaterno()%> </td> 
                    <td><%= usuario.getEmail() %> </td>
                    <td align="center"><a href="DetallesUsuarioServlet?accion=editar&id=<%= usuario.getId()%>">Editar</a> </td> 
                    <td align="center"><a href="OtherUsuarioServlet?accion=borrar&id=<%= usuario.getId()%>">Borrar</a> </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
