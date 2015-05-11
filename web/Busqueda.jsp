<%-- 
    Document   : Busqueda
    Created on : 7/05/2015, 11:23:24 PM
    Author     : Monotr_
--%>

<%@page import="agenda.model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  onload="check();">
        <h1>Hello World!</h1>
        
        <div class="top_bar">
            <div id="logo">
                <form action="index.html">
                    <input type="image" src="Css/images/demo_logo.png" alt="Submit" width="120" height="100">
                </form>
            </div>

            <div id="serch"> 
                <form action="BusquedaServlet" method="post">
                    <input type="text" id="serch_text" name="serch_text" autofocus> 
                    <button id="serch_button">Search</button> 

                    <div class="tipo_busqueda">
                        <input type="checkbox" name="nombre_articulo" checked> Nombre de Articulo
                        <input type="checkbox" name="nombre_del_vendedor"> Nombre del Vendedor
                        <input type="checkbox" onclick="check();" name="fechaOpt" id="fechaOpt"> Fecha
                        <br><label id="fechaDesde">Fecha Desde: <input type="date" name="fechaD"></label>
                        <br><label id="fechaHasta">Fecha Hasta: <input type="date" name="fechaH"></label>
                    </div>
                </form>
            </div>
                            
            <script>
                function check() {
                    if(document.getElementById("fechaOpt").checked){
                        document.getElementById("fechaDesde").style.display = 'block';
                        document.getElementById("fechaHasta").style.display = 'block';
                        
                        document.getElementById("fechaDesde").value = (new Date()).format("dd/mm/yyyy");
                        document.getElementById("fechaDesde").value = (new Date()).format("dd/mm/yyyy");
                    }
                    else{
                        document.getElementById("fechaDesde").style.display = 'none';
                        document.getElementById("fechaHasta").style.display = 'none';
                    }
                }
            </script>
             
            <div class="top_bar_options">
                 <a href="Perfil.html">Perfil</a>
                 <a href="login.html">Login</a>
                 <a href="singup.html">Singup</a>          
            </div>

            <br>
            <div>
                <%
                    if(request.getAttribute("anuncios") != null)
                    {
                        List<Anuncio> anuncios = (ArrayList<Anuncio>)request.getAttribute("anuncios");
                        for(Anuncio anunciox: anuncios)
                        {
                %>
                <img width="30px" height="30px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + anunciox.getIdProducto() + "&col=1" %>" />
                     / <%= anunciox.getNombreProducto()%>  / <%= anunciox.getPrecio()%> / <%= anunciox.getExistencia()%> / <%= anunciox.getSubcategoria()%>
                    <hr>
                <%
                        }
                    }
                %>
            </div>
            
        </div>
    </body>
</html>
