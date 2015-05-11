<%-- 
    Document   : anuncio_edit
    Created on : 6/05/2015, 12:46:49 AM
    Author     : Monotr_
--%>

<%@page import="agenda.data.AnuncioDao"%>
<%@page import="agenda.model.MetodoPago"%>
<%@page import="java.util.List"%>
<%@page import="agenda.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Anuncio</title>
    </head>
    <body>
        <div align ="center">
        <h1>Detalle de Anuncio</h1>
            <%
                Anuncio anuncio = (Anuncio) request.getAttribute("anuncio");
            %>
            <form action="AnuncioServlet" method="post">
                <table width ="25%" border ="1" cellpadding ="5" cellspacing ="5">
                    <tr>
                        <th width="30%">Vigencia: </th>
                        <td width="70%"><input type="text" name="vigencia" value="<%= anuncio == null? "" : anuncio.getVigencia()%>"></td>
                    </tr>
                     <tr>
                        <th>Thumbnail: </th>
                        <td><input type="text" name="thumbnail" value="<%= anuncio == null? "" : anuncio.getThumbnail()%>"></td>
                    </tr>
                     <tr>
                        <th>Producto: </th>
                        <td><input type="text" name="producto" value="<%= anuncio == null? "" : anuncio.getIdProducto()%>"></td>
                    </tr>
                     <tr>
                        <th>Métodos de pago: </th>
                        <td>
                        <select name="metodosDePago">                            
                            <%
                                List<MetodoPago> metPag = AnuncioDao.buscar_MP();
                                request.setAttribute("metodosPago", metPag);
                            
                                List<MetodoPago> metodos = (List<MetodoPago>) request.getAttribute("metodosPago");
                                if (metodos != null) {
                                    for (MetodoPago mets : metodos) {
                            %>
                                        <option value="<%= mets.getNombre()%>"
                                                <%= anuncio != null && anuncio.getIdMetodoPago() == mets.getId() ? "selected" : "" %>
                                                ><%= mets.getNombre() %>
                                        </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                        
                    </tr>
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="<%= anuncio == null? "" : anuncio.getId()%>"/>
                            <input type="hidden" name="idUsuario" value="1"/>
                            <input type="submit" value="Guardar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
