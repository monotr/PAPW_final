<%-- 
    Document   : anuncioDetalle
    Created on : 11/05/2015, 09:22:50 PM
    Author     : Monotr_
--%>

<%@page import="agenda.model.Producto"%>
<%@page import="agenda.data.AnuncioDao"%>
<%@page import="agenda.model.Anuncio"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="java.util.ArrayList"%>
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

            
            <!-- Content START -->
            <%
                    Anuncio anunc = AnuncioDao.obtenerUsuario(8);
//Integer.parseInt(request.getParameter("id")));
                    //request.setAttribute("anuncios", anunc);
                    
                    if(anunc != null)
                    {
                        Producto tempProd = ProductoDao.obtenerUsuario(anunc.getIdProducto());
                        anunc.setDescCorta(tempProd.getDescCorta());
                        anunc.setPrecio(tempProd.getPrecio());
                        anunc.setExistencia(tempProd.getExistencia());
                        anunc.setSubcategoria(tempProd.getNombreSubcategoria());
              %>
            
            
      <div class="prod_box_big">
        <div class="top_prod_box_big"></div>
        <div class="center_prod_box_big">

          <div class="details_big_box">
            <div class="product_title_big">Producto</div>
            <div class="specifications"> Título:  <span class="blue"><%= anunc.getDescCorta() %></span><br />
              Exstencia: <span class="blue"><%= anunc.getExistencia()%></span><br />
              Fecha de publicación: <span class="blue"><%= anunc.getFechPublicacion() %></span><br />
              Vendedor: <span class="blue"><%= anunc.getNickname()%></span><br />
            </div>
            <!--<div class="prod_price_big"><span class="reduce">350$</span> <span class="price">270$</span></div>-->
            <div class="prod_price_big"><span class="price">$<%= anunc.getPrecio()%></span></div>
            <div class="button_comprar"><button id="serch_button">Comprar</button> </div>
            <!--<a href="#" class="addtocart">add to cart</a> <a href="#" class="compare">compare</a> </div>-->
            
        </div>
        <div class="bottom_prod_box_big"></div>
      </div>
              
        
        <div class="product_img_big"><img width="100px" height="100px" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + tempProd.getId() + "&col=1" %>" />
         <div class="thumbs"> <input width="40px" height="40px" type="image" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + tempProd.getId() + "&col=1" %>">
                              <input width="40px" height="40px" type="image" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + tempProd.getId() + "&col=2" %>">
                              <input width="40px" height="40px" type="image" src="<%= request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + tempProd.getId() + "&col=3" %>"> </div>
          
     </div>   

    
    <div class="prod_details_big">
        <div class="videos">
            <video width="320" height="240" controls>
            </video>
            <video width="320" height="240" controls>
            </video>
            <video width="320" height="240" controls>
            </video>
        </div>
    </div>
  <!-- end of main content -->

<div class="comentary_area">
    <div class="tex_comentary">
        <textarea rows="10" cols="100"></textarea><p>
        <button class="send_comentary">Submit</button>
        
    </div>
    <div class="past_comentarys">
        Comentary:---------------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------------------------
      
    </div>
    <p></p>
  
    
     <div class="past_comentarys">
        Comentary2:---------------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------------------------
    </div>
    
</div>
  <% } %>
  
   </div>
                <!-- Content END -->

        </div>    
        </div> 

        <!-- top bar -->

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
