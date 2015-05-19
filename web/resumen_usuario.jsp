<%-- 
    Document   : resumen_usuario
    Created on : 18/05/2015, 01:59:30 AM
    Author     : Monotr_
--%>

<%@page import="agenda.data.UsuarioDao"%>
<%@page import="agenda.model.Usuario"%>
<%@page import="agenda.data.PreguntaDao"%>
<%@page import="agenda.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Let's Sell</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="Css/Style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->
<script type="text/javascript" src="js/boxOver.js"></script>
</head>
    <body onload='started();'>
        <div id="main_container"> 
          <div id="header"> 

              <div class="categori_box">
          <h1>Categorias:</h1>
        <%
           List<Categoria> cate = ProductoDao.buscar_categorias();
           request.setAttribute("categorias", cate);
                    
            if(request.getAttribute("categorias") != null)
            {
                List<Categoria> categorias = (ArrayList<Categoria>)request.getAttribute("categorias");
                for(Categoria categoria: categorias)
                {
         %>
        <label><a href="home.html"><%= categoria.getNombre() %></a></label><br> <!-- falta cambiar LINK -->
             <% }
            }%>   
            </div>
         </div>

        <div id="main_content">
            <div class="left_area">
                <div class="left_area_content" > <a href="resumen_usuario.jsp">Resumen</a> </div>
                <div class="left_area_content"><a href="ventas_lista.jsp">Ventas</a>  </div>
                <div class="left_area_content"> <a href="producto_lista.jsp">Productos</a> </div>
                <div class="left_area_content"><a href="anuncio_lista.jsp"> Anuncios</a>  </div>
                <div class="left_area_content"><a href="compras_lista.jsp">Compras</a>  </div>
                <div class="left_area_content"> <a href="usuario_create.jsp">Configuracion de perfil</a> </div>
            </div>
            
            <!-- One prodcut -->

            <div class="main_perfil">
            <h1>Mis preguntas</h1>
            <table width ="70%" border ="1" cellpadding ="5" cellspacing ="5">
                <tr>
                    <th> Anuncio </th>
                    <th> Pregunta </th>
                    <th width ="6%" > Responder </th>
                    <th width ="6%" > Borrar </th>
                </tr>
                <%
                    
                    List<Pregunta> preg = PreguntaDao.buscar(Integer.parseInt(session.getAttribute("id").toString()), true);
                    request.setAttribute("preguntas", preg);
                    
                    if(request.getAttribute("preguntas") != null)
                    {
                        List<Pregunta> preguntas = (ArrayList<Pregunta>)request.getAttribute("preguntas");
                        for(Pregunta pregunta: preguntas)
                        {
                            if(pregunta.getRespuestaRealizada() != 1){
                %>
                
                <tr>
                <form action="PreguntaServlet" method="post">
                    <td>
                        <img width="100px" height="100px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + pregunta.getIdProducto() + "&col=1" %>" />
                        <br>
                        <a href="<%= request.getServletContext().getContextPath() +
                           "/anuncioDetalle.jsp?id="+ pregunta.getIdAnuncio() %>"><%= pregunta.getDescCorta() %></a>
                        
                    </td>
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
                        }
                }%>
            </table>
        </div>
                <!-- END One prodcut -->

        </div>    
        </div> 

        <!-- top bar -->

        <!-- INICIO BARRA SUPERIOR -->  
  
       <div class="top_bar">
       
       <div id="logo">
       <form action="index.jsp">
       <input type="image" src="Css/images/demo_logo.png" alt="Submit" width="120" height="100">
      </form>
       </div>
       
       <!-- INICIO BUSQEUDA -->
    <div id="serch"> 
                <form action="BusquedaServlet" method="post">
                    <input type="text" id="serch_text" name="serch_text" autofocus> 
                    <button id="serch_button">Search</button> 

                    <div class="tipo_busqueda">
                        <input type="checkbox" name="nombre_articulo" checked> Nombre de Articulo
                        <input type="checkbox" name="nombre_del_vendedor"> Nombre del Vendedor
                        <input type="checkbox" onclick="check();" name="fechaOpt" id="fechaOpt"> Fecha
                        <div class="fechas_busqueda">
                        <br><label id="fechaDesde">Fecha Desde: <input type="date" name="fechaD"></label>
                        <br><label id="fechaHasta">Fecha Hasta: <input type="date" name="fechaH"></label>
                        </div>
                    </div>
                </form>
    </div>
    
         <script>
                function started(){
                    document.getElementById("fechaDesde").style.visibility = "hidden";
                    document.getElementById("fechaHasta").style.visibility = "hidden";
                }
             
                function check() {
                    if(document.getElementById("fechaOpt").checked){
                        document.getElementById("fechaDesde").style.visibility = "visible";
                        document.getElementById("fechaHasta").style.visibility = "visible";
                        
                        document.getElementById("fechaDesde").value = (new Date()).format("dd/mm/yyyy");
                        document.getElementById("fechaDesde").value = (new Date()).format("dd/mm/yyyy");
                    }
                    else{
                        document.getElementById("fechaDesde").style.visibility = "hidden";
                        document.getElementById("fechaHasta").style.visibility = "hidden";
                    }
                    check_new_user();
                }
                
                function check_new_user() {
                    if(document.getElementById("new_user").checked){
                        document.getElementById("filaPass").style.visibility = "hidden";
                        document.login.action = "SendEmailServlet";
                    }
                    else{
                        document.getElementById("filaPass").style.visibility = "visible";
                        document.login.action = "index";
                    }
                }
            </script>
         
         <!-- FIN BUSQEUDA -->
         
         <!-- LOGIN -->
         <%
      session = request.getSession();
      if(session.getAttribute("id") == null){
      %>
         <div class="login_table">
         <form action="index" method="post" name="login">
            <table border="1">
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" value=""/></td>
                </tr>
                <tr id="filaPass">
                    <td>Password:</td>
                    <td><input type="password" name="password" id="password" value=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Entrar"/>
                        <input type="checkbox" name="new_user" id="new_user" onclick="check_new_user();"> Nuevo usuario
                        <br><% if (request.getAttribute("mensaje") != null) { %>
            <div style="color: red"><%= request.getAttribute("mensaje") %> </div>
        <% } %>
                    </td>
                </tr>
            </table>
        </form>
         </div> 
         <% } 
      else {%>
      
      <div class="login_table">
         <form action="index?accion=borrar" method="post" name="login">
            <table border="1">
                <tr>
                    <td>User: <%= session.getAttribute("nickname") %></td>
                </tr>
                <tr>
                    <td><a href="producto_lista.jsp">Mi cuenta</a></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Log Out"/>
                    </td>
                </tr>
            </table>
        </form>
         </div>
      
      <% } %>
         
        <!-- FIN LOGIN -->
        
          <!-- fin BARRA SUPERIOR -->
         
         <% if (request.getAttribute("mensaje") != null) { %>
            <div style="color: red"><%= request.getAttribute("mensaje") %> </div>
        <% } %>
        <!-- FIN LOGIN -->
       
    <div class="top_bar_options">
         <a href="Perfil_productos.html">Perfil</a>
        <a href="login.html">Login</a>
         <a href="singup.html">Singup</a>          
    </div>

      
 </div>

        
    </body>
</html>
