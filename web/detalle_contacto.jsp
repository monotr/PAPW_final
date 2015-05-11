<%-- 
    Document   : detalle_contacto
    Created on : 21-abr-2015, 12:55:53
    Author     : FCFM
--%>
<%@ page import = "agenda.model.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Contacto</title>
    </head>
    <body>
        <div align ="center">
        <h1>Detalle de Contacto</h1>
            <%
                Contacto contacto = (Contacto) request.getAttribute("contacto");
            %>
            <form action="DetalleServlet" method="post">
                <table width ="25%" border ="1" cellpadding ="5" cellspacing ="5">
                    <tr>
                        <th width="30%">Nombre: </th>
                        <td width="70%"><input type="text" name="nombre" value="<%= contacto == null? "" : contacto.getNombre()%>"</td>
                    </tr>
                    <tr>
                        <th>Apellido: </th>
                        <td><input type="text" name="apellido" value="<%= contacto == null? "" : contacto.getApellido()%>"</td>
                    </tr>
                     <tr>
                        <th>Telefono: </th>
                        <td><input type="text" name="telefono" value="<%= contacto == null? "" : contacto.getTelefono()%>"</td>
                    </tr>
                     <tr>
                        <th>Email: </th>
                        <td><input type="text" name="email" value="<%= contacto == null? "" : contacto.getEmail()%>"</td>
                    </tr>
                     <tr>
                        <th>Direccion1: </th>
                        <td><input type="text" name="direccion1" value="<%= contacto == null? "" : contacto.getDireccion1()%>"</td>
                    </tr>
                    <tr>
                        <th>Direccion2: </th>
                        <td><input type="text" name="direccion2" value="<%= contacto == null? "" : contacto.getDireccion2()%>"</td>
                    </tr>
                    <tr>
                        <th>Sexo: </th>
                        <td>
                        <%
                            if (contacto == null || contacto.isSexo()){                                
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
                            <input type="submit" value="Guardar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
