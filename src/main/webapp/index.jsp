
<%@page import="java.util.List"%>
<%@page import="modelo.Libros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="style/index.css">
        <title>Libreria</title>
    </head>
    <body style="background: url(img/cyan.jpg); background-size: cover">

        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="width: 100%;">
                <div class="brandLogo">
                    <div class="logo"></div>
                    <a href="#" class="brand">Proyecto Final Full Stack</a>
                </div>
            </nav>
        </header>

        <h1 style="text-align: center; margin-top: 30px;">Librería Municipal de Ezeiza</h1>
        <div style="margin-top: 80px">
            <h2 class="container mt-3" style="text-align: center; font-weight: bold; color: #353a40">"Agregar un nuevo libro"</h2>
        </div>
        <div class="container mt-3">            
            <!--Creamos el formulario;-->            
            <form action="LibreriaServlet" method="post" class="mb-3">
                <div class="form-group">
                    <label style="font-size: 20px">Título:</label>
                    <input type="text" class="form-control" name="titulo" style = "border: 1px solid steelblue;">
                </div>
                <div class="form-group">
                    <label>Autor:</label>
                    <input type="text" class="form-control" name="autor" style = "border: 1px solid steelblue;">
                </div>
                <div class="form-group">
                    <label>Género:</label>
                    <input type="text" class="form-control" name="genero" style = "border: 1px solid steelblue;">
                </div>
                <div class="form-group">
                    <label>Ubicación:</label>
                    <input type="text" class="form-control" name="ubicacion" style = "border: 1px solid steelblue;">
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Agregar Libro</button>
            </form>

            <!--Tabla para mostrar contactos existentes con las opciones de Modificar, Guardar o Eliminar-->
            <table class="table">
                <thead>
                    <tr class="table-dark">
                        <th scope="col">Título</th>
                        <th scope="col">Autor</th>
                        <th scope="col">Genero</th>
                        <th scope="col">Ubicación</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>                
                <tbody>
                    <%
                        // Recuperar la lista de contactos desde el contexto de la aplicación
                        List<Libros> libros = (List<Libros>) request.getServletContext().getAttribute("libros");
                        if (libros != null) {
                            for (int i = 0; i < libros.size(); i++) {
                    %>
                    <tr class="table-dark">                        
                        <td><%= libros.get(i).getTitulo()%></td>
                        <td><%= libros.get(i).getAutor()%></td>
                        <td><%= libros.get(i).getGenero()%></td>
                        <td><%= libros.get(i).getUbicacion()%></td>
                        <td>
                            <!-- Formularios para eliminar y editar con índices de contactos -->                            
                            <form action="OperacionServlet" method="post" style="display: inline-block;">
                                <input type="hidden" name="accion" value="editar">
                                <input type="hidden" name="indice" value="<%= i%>">
                                <button type="submit" class="btn btn-secondary btn-sm">Editar</button>
                            </form>
                            <form action="OperacionServlet" method="post" style="display: inline-block;">
                                <input type="hidden" name="accion" value="guardar">
                                <input type="hidden" name="indice" value="<%= i%>">
                                <button type="submit" class="btn btn-success btn-sm">Guardar</button>
                            </form>
                            <form action="OperacionServlet" method="post" style="display: inline-block;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="indice" value="<%= i%>">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                        </td>
                    </tr> 
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div> 


        <div style="margin-top: 100px">
            <h2 class="container mt-3" style="text-align: center; font-weight: bold; color: #353a40">"Buscador"</h2>
        </div>
        <section > 
            <div class="container mt-3">            
                <!--Creamos el formulario;-->   

                <form action="OperacionServlet" method="post" class="mb-3">                
                    <div class="form-group">
                        <label>Buscar por Título:</label>
                        <input type="text" class="form-control" name="buscarTitulo" style = "border: 1px solid steelblue;">
                    </div>
                    <br> 
                    <input type="hidden" name="accion" value="buscarTitulo">                
                    <button type="submit" class="btn btn-primary">Buscar Título</button>
                    <br>
                </form>
                <form action="OperacionServlet" method="post" class="mb-3">
                    <div class="form-group" style="margin-top: 30px">
                        <label>Buscar por Autor:</label>
                        <input type="text" class="form-control" name="buscarAutor" style = "border: 1px solid steelblue;">
                    </div> 
                    <br>
                    <input type="hidden" name="accion" value="buscarAutor">
                    <button type="submit" class="btn btn-primary">Buscar Autor</button>
                    <br>
                </form>
                <form action="OperacionServlet" method="post" class="mb-3">
                    <div class="form-group" style="margin-top: 30px">
                        <label>Buscar por género:</label>
                        <input type="text" class="form-control" name="buscarGenero" style = "border: 1px solid steelblue;">
                    </div> 
                    <br>
                    <input type="hidden" name="accion" value="buscarGenero">
                    <button type="submit" class="btn btn-primary">Buscar Género</button>
                    <br>
                </form>
            </div>
        </section>

        <section class="container mt-3" style="background-color:#2d3644 "> 
            <div style="margin-top: 50px">
                <h3 class="container mt-3" style="text-align: center; font-weight: bold; color:buttonshadow">"Acceso administrador"</h3>

                <h5 class="container mt-3" style="color:blanchedalmond">"En esta sección podrás ver la lista completa de títulos y eliminar libros de la base de datos (ACCESO EXCLUSIVO):"</h5>
            </div>

            <div class="container mt-3" style="margin-top: 30px">     

                <form class="row g-3" action="OperacionServlet" method="post">
                    <div class="col-auto">
                        <label for="staticEmail2" class="visually-hidden">Email</label>
                        <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="ACCESO ADMIN" style="font-size: 20px; font-weight: bold; color:blanchedalmond">
                    </div>
                    <div class="col-auto">
                        <label for="inputPassword2" class="visually-hidden">Password</label>
                        <input type="password" class="form-control" id="inputPassword2" name="pasword" placeholder="Password" style = "border: 1px solid steelblue;">
                    </div>
                    <div class="col-auto">
                        <input type="hidden" name="accion" value="verTodo">
                        <button type="submit" class="btn btn-primary mb-3">Acceder</button>
                    </div>
                </form>
            </div>
        </section>


        <footer class="bg-dark text-white text-center py-3" style="width: 100%; margin-top: 100px; margin-right: 0px; margin-left: 0px;">
            <img src="img/logo.png" alt="">
            <hr style="width: 50vw; margin: 10px auto;">    
            <div class="container">
                <p>Copyright &copy;2023 Nicolás Di Bartolo. Todos los derechos reservados</p>
            </div>
        </footer>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
