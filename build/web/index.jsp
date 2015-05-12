<%-- 
    Document   : index
    Created on : 09-oct-2012, 22:23:53
    Author     : Carlos
--%>

<%@page import="agenda.data.AnuncioDao"%>
<%@page import="agenda.model.Anuncio"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
   
   
    <div class="left_content">
   
    </div>    

    <!-- end of left content -->
        <div class="center_content">
            
                
     <!-- MAS recientes -->
    <fieldset> 
     <legend>Mas Recientes:</legend>
      
      <%
           List<Anuncio> anuns = AnuncioDao.busqueda_home(0); // cambiar # del 0 al 3 para diferentes vistas -->
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
     <!-- FIN!!! MAS recientes -->
     
     <!-- MAS VENDIDOS -->
    <fieldset> 
     <legend>Mas vendidos:</legend>
      
      <%
           List<Anuncio> anunsV = AnuncioDao.busqueda_home(1); // cambiar # del 0 al 3 para diferentes vistas
           request.setAttribute("anuncios_home0", anunsV);
                    
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
     
     <!-- MAS comentados -->
    <fieldset> 
     <legend>Mas comentados:</legend>
      
      <%
           List<Anuncio> anunsC = AnuncioDao.busqueda_home(2); // cambiar # del 0 al 3 para diferentes vistas
           request.setAttribute("anuncios_home0", anunsC);
                    
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
     <!-- FIN!!! MAS comentados -->
     
     <!-- MAS caros -->
    <fieldset> 
     <legend>Mas caros:</legend>
      
      <%
           List<Anuncio> anunsCa = AnuncioDao.busqueda_home(3); // cambiar # del 0 al 3 para diferentes vistas
           request.setAttribute("anuncios_home0", anunsCa);
                    
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
     <!-- FIN!!! MAS caros -->
     
    </div>
      
    </div>

    <!-- end of right content -->
  </div>
  <!-- end of main content -->

  <!-- INICIO BARRA SUPERIOR -->  
  
       <div class="top_bar">
       
       <div id="logo">
       <form action="index.html">
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
         
         <!-- RESULTADO BUSQEUDA -->
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
           <!-- FIN BUSQEUDA -->
       
    <div class="top_bar_options">
         
        
    </div>

      
 </div>
<!-- end of main_container -->
</body>
</html>

