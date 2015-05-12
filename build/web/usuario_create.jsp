<%-- 
    Document   : detalle_contacto
    Created on : 21-abr-2015, 12:55:53
    Author     : FCFM
--%>
<%@page import="agenda.data.ProductoDao"%>
<%@page import="agenda.model.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import = "agenda.model.Usuario"%>
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
                
                <div class="left_area_content" > <a href="Resumen.html">Resumen</a> </div>
                <div class="left_area_content"><a href="Perfil_compras.html">Ventas</a>  </div>
                <div class="left_area_content"> <a href="producto_lista.jsp">Productos</a> </div>
                <div class="left_area_content"><a href="anuncio_lista.jsp"> Anuncios</a>  </div>
                <div class="left_area_content"><a href="Perfil_compras.html">Compras</a>  </div>
                <div class="left_area_content"> <a href="usuario_create.jsp">Configuracion de perfil</a> </div>
            </div>
            
            <!-- user form -->

            <div class="main_perfil">
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
                    <tr>
                        <th width="30%">NUEVA Contraseña: </th>
                        <td width="70%"><input type="password" name="contrasenia"></td>
                    </tr>
                    <tr>
                        <th width="30%">Imagen de usuario: </th>
                        <td width="70%">
                            <img width="300px" height="300px" src="<%= usuario == null? "" : request.getServletContext().getContextPath() + "/UsuarioMultimediaServlet?id=" + usuario.getId() %>" />
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
                        <th>Código Postal: </th>
                        <td><input type="number" name="cp" value="<%= usuario == null? "" : usuario.getCp()%>"</td>
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
                <!-- END user form -->

        </div>    
        </div> 

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
       
    <div class="top_bar_options">
         <a href="Perfil_productos.html">Perfil</a>
        <a href="login.html">Login</a>
         <a href="singup.html">Singup</a>          
    </div>

      
 </div>

        
    </body>
</html>


