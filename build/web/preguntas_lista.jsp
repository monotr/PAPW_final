<%-- 
    Document   : preguntas_lista
    Created on : 6/05/2015, 03:31:48 AM
    Author     : Monotr_
--%>

<%@page import="agenda.model.Usuario"%>
<%@page import="agenda.data.UsuarioDao"%>
<%@page import="agenda.data.PreguntaDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agenda.model.Pregunta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas</title>
    </head>
    <body>
        <div allign="center">
            <h1>Mis preguntas</h1>
            <table width ="70%" border ="1" cellpadding ="5" cellspacing ="5">
                <tr>
                    <th> Pregunta </th>
                    <th width ="6%" > Responder </th>
                    <th width ="6%" > Borrar </th>
                </tr>
                <%
                    
                    List<Pregunta> preg = PreguntaDao.buscar(1);
                    request.setAttribute("preguntas", preg);
                    
                    if(request.getAttribute("preguntas") != null)
                    {
                        List<Pregunta> preguntas = (ArrayList<Pregunta>)request.getAttribute("preguntas");
                        for(Pregunta pregunta: preguntas)
                        {
                %>
                
                <tr>
                <form action="PreguntaServlet" method="post">
                    <td>
                        <% Usuario u = UsuarioDao.obtenerUsuario(pregunta.getIdUsuario()); %>
                        <%= u.getNickname()%> :  <%= pregunta.getTextoPregunta()%>
                        <hr>
                    <% if(pregunta.getRespuestaRealizada() == 0){
                    %><input type="text" name="respuesta" value="">
                    <% } else { %> <%= pregunta.getTextoRespuesta() %> <% } %>
                    </td>
                    <input type="hidden" name="id" value="<%=pregunta.getIdPregunta()%>"/>
                    <input type="hidden" name="accion" value="responder"/>
                    <td align="center">
                        <% if(pregunta.getRespuestaRealizada() == 0){
                    %><input type="submit" value="Responder"/></td>
                    <% } %>
                    <td align="center"><a href="PreguntaServlet?accion=borrar&id=<%= pregunta.getIdPregunta()%>">Borrar</a> </td>
                </form>
                </tr>
                <%
                        }
                %>
                <tr>
                    <th>Hacer pregunta al vendedor</th>
                    <th></th>
                </tr>
                <tr>
                    <form action="PreguntaServlet" method="post">
                    <input type="hidden" name="idAnuncio" value="3"/>
                    <input type="hidden" name="idUsuario" value="1"/>
                    <input type="hidden" name="accion" value="preguntar"/>
                    <td><input type="text" name="pregunta" value=""></td>
                    <td><input type="submit" value="Preguntar"/></td>
                    </form>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
