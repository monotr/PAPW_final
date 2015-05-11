<%-- 
    Document   : producto_edit
    Created on : 5/05/2015, 07:10:48 PM
    Author     : Monotr_
--%>

<%@page import="agenda.model.Subcategoria"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="java.util.List"%>
<%@page import="agenda.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Producto</title>
    </head>
    <body>
        <div align ="center">
        <h1>Detalle de Producto</h1>
            <%
                Producto producto = (Producto) request.getAttribute("producto");
            %>
            <form action="ProductoServlet" method="post" enctype="multipart/form-data">
                <table width ="25%" border ="1" cellpadding ="5" cellspacing ="5">
                    <tr>
                        <th width="30%">Descripción corta: </th>
                        <td width="70%"><input type="text" name="descCorta" value="<%= producto == null? "" : producto.getDescCorta()%>"</td>
                    </tr>
                    <tr>
                        <th>Descripción larga: </th>
                        <td><input type="text" name="descLarga" value="<%= producto == null? "" : producto.getDescLarga()%>"</td>
                    </tr>
                     <tr>
                        <th>Precio: $</th>
                        <td><input type="number" name="precio" value="<%= producto == null? "" : producto.getPrecio()%>"</td>
                    </tr>
                     <tr>
                        <th>Existencia: </th>
                        <td><input type="number" name="existencia" value="<%= producto == null? "" : producto.getExistencia()%>"</td>
                    </tr>
                     <tr>
                        <th>Vigencia: </th>
                        <td><input type="date" name="vigencia" value="<%= producto == null? "" : producto.getVigencia()%>"</td>
                    </tr>
                    <tr>
                        <th>Imagen 1: </th>
                        <td>
                            <img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=1" %>" />
                            <input type="file" name="imagen1">
                        </td>
                    </tr>
                    <tr>
                        <th>Imagen 2: </th>
                        <td><input type="file" name="imagen2"></td>
                    </tr>
                    <tr>
                        <th>Imagen 3: </th>
                        <td><input type="file" name="imagen3"></td>
                    </tr>
                    <tr>
                        <th>Video 1: </th>
                        <td><input type="file" name="video1"></td>
                    </tr>
                    <tr>
                        <th>Video 2: </th>
                        <td><input type="file" name="video2"></td>
                    </tr>
                    <tr>
                        <th>Video 3: </th>
                        <td><input type="file" name="video3"></td>
                    </tr>
                    
                    <tr>
                        <th>Subcategoría: </th>
                        <td>
                        <select name="subcategoria">                            
                            <%
                                List<Subcategoria> subCat = ProductoDao.buscar_subcategorias();
                                request.setAttribute("subcategorias", subCat);
                            
                                List<Subcategoria> subs = (List<Subcategoria>) request.getAttribute("subcategorias");
                                if (subs != null) {
                                    for (Subcategoria sub : subs) {
                            %>
                                        <option value="<%= sub.getId()%>">
                                                <%= producto != null && producto.getIdSubcategoria() == sub.getId() ? "selected" : "" %>
                                                <%= sub.getNombre() %>
                                        </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                        
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="<%= producto == null? "" : producto.getId()%>"/>
                            <input type="hidden" name="idUsuario" value="1"/>
                            <input type="submit" value="Guardar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
