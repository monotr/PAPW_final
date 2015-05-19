<%-- 
    Document   : producto_edit
    Created on : 5/05/2015, 07:10:48 PM
    Author     : Monotr_
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="agenda.model.Subcategoria"%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="java.util.List"%>
<%@page import="agenda.model.Producto"%>
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
                            <img width="30px" height="30px" src="<%= producto == null? "" : request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=1" %>" />
                            <input type="file" name="imagen1">
                        </td>
                    </tr>
                    <tr>
                        <th>Imagen 2: </th>
                        <td>
                            <img width="30px" height="30px" src="<%= producto == null? "" : request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=2" %>" />
                            <input type="file" name="imagen2"></td>
                    </tr>
                    <tr>
                        <th>Imagen 3: </th>
                        <td>
                            <img width="30px" height="30px" src="<%= producto == null? "" : request.getServletContext().getContextPath() + "/ProductoMultimediaServlet?id=" + producto.getId() + "&col=3" %>" />
                            <input type="file" name="imagen3"></td>
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
                            <input type="hidden" name="idUsuario" value="<%= session.getAttribute("id") %>"/>
                            <input type="submit" value="Guardar"/>
                        </td>
                    </tr>
                </table>
            </form>
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

