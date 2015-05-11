<%-- 
    Document   : detalle_contacto
    Created on : 21-abr-2015, 12:55:53
    Author     : FCFM
--%>
<%@ page import = "agenda.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Usuario</title>
    </head>
    <body>
        <div align ="center">
        <h1>Detalle de Usuario</h1>
            <%
                Usuario usuario = (Usuario) request.getAttribute("usuario");
            %>
            <form action="DetallesUsuarioServlet" method="post" enctype="multipart/form-data">
                <table width ="25%" border ="1" cellpadding ="5" cellspacing ="5">
                    <tr>
                        <th width="30%">Nickame: </th>
                        <td width="70%"><input type="text" name="nickname" value="<%= usuario == null? "" : usuario.getNickname()%>"</td>
                    </tr>
                    <!-- <tr>
                        <th width="30%">Contraseña: </th>
                        <td width="70%"><input type="password" name="contrasenia"></td>
                    </tr> -->
                    <tr>
                        <th width="30%">Imagen de usuario: </th>
                        <td width="70%">
                            <img width="300px" height="300px" src="<%= request.getServletContext().getContextPath() + "/UsuarioMultimediaServlet?id=" + usuario.getId() %>" />
                            <input type="file" name="archivo">
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <th width="30%">Nombre: </th>
                        <td width="70%"><input type="text" name="nombre" value="<%= usuario == null? "" : usuario.getNombre()%>"</td>
                    </tr>
                    <tr>
                        <th>Apellido Paterno: </th>
                        <td><input type="text" name="apellidoPaterno" value="<%= usuario == null? "" : usuario.getApellidoPaterno()%>"</td>
                    </tr>
                    <tr>
                        <th>Apellido Meterno: </th>
                        <td><input type="text" name="apellidoMaterno" value="<%= usuario == null? "" : usuario.getApellidoMaterno()%>"</td>
                    </tr>
                    <tr>
                        <th>Fecha Nacimiento: </th>
                        <td><input type="date" name="fechaNacimiento" value="<%= usuario == null? "" : usuario.getFechaNacimiento()%>"</td>
                    </tr>
                     <tr>
                        <th>Email: </th>
                        <td><input type="text" name="email" value="<%= usuario == null? "" : usuario.getEmail()%>"</td>
                    </tr>
                     <tr>
                        <th>Calle: </th>
                        <td><input type="text" name="calle" value="<%= usuario == null? "" : usuario.getCalle()%>"</td>
                    </tr>
                    <tr>
                        <th>Número: </th>
                        <td><input type="number" name="numero" value="<%= usuario == null? "" : usuario.getNumCasa()%>"</td>
                    </tr>
                    <tr>
                        <th>Colonia: </th>
                        <td><input type="text" name="colonia" value="<%= usuario == null? "" : usuario.getColonia()%>"</td>
                    </tr>
                    <tr>
                        <th>Ciudad </th>
                        <td><input type="text" name="ciudad" value="<%= usuario == null? "" : usuario.getCiudad()%>"</td>
                    </tr>
                    <tr>
                        <th>Estado </th>
                        <td><input type="text" name="estado" value="<%= usuario == null? "" : usuario.getEstado()%>"</td>
                    </tr>
                    <tr>
                        <th>País: </th>
                        <td><input type="text" name="pais" value="<%= usuario == null? "" : usuario.getPais()%>"</td>
                    </tr>
                    <tr>
                        <th>Sexo: </th>
                        <td>
                        <%
                            if (usuario == null || usuario.getSexo() == ""){                                
                            %>
                                <input type="radio" name="sexo" value="1" checked/> Hombre                 
                                <input type="radio" name="sexo" value="2" /> Mujer
                        <%
                            }
                            else {
                            %>
                            <input type="radio" name="sexo" value="1"/> Hombre                 
                            <input type="radio" name="sexo" value="2" checked/> Mujer
                            <%
                            }
                            %>
                        </td>                      
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="<%= usuario == null? "" : usuario.getId()%>"/>
                            <input type="submit" value="Guardar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
