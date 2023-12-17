
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Libros"%>
<%@page import="registrosDAO.RegistroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="style/index.css">
        <title>Lista Autor</title>
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

        <div class="container mt-3">
            <h2>Lista por Autor</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>                     
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Género</th>
                        <th>Ubicación</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Crear una instancia de OradoresDAO para acceder a la base de datos
                        RegistroDAO librosDAO = new RegistroDAO();
                        String librito = (String) request.getAttribute("buscarAutor");
//                        librito = "Ojos de Fuego";
                        // Obtener la lista de oradores desde la base de datos
                        List<Libros> listaLibros = librosDAO.obtenerPorAutor(librito);

                        if (listaLibros != null && !listaLibros.isEmpty()) {
                            // Iterar sobre la lista de oradores y mostrar sus datos en la tabla
                            for (Libros libro : listaLibros) {
                    %>
                    <tr class="table-dark">
                        <td><%= libro.getTitulo()%></td>
                        <td><%= libro.getAutor()%></td>
                        <td><%= libro.getGenero()%></td>
                        <td><%= libro.getUbicacion()%></td>

                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr class="table-danger">
                        <td colspan="5">No hay libros encontrados</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <!-- Botón para volver al índice -->
            <a href="index.jsp" class="btn btn-success">Volver</a>  
        </div>

        <!--        </div>
                <div style="margin-top: 50px">
                    <h3 class="container mt-3">"Borrar título"</h3>
                </div>
        
                <div class="container mt-3">            
                    Creamos el formulario;            
                    <form action="OperacionServlet" method="post" class="mb-3">                
                        <div class="form-group">
                            <label>Escriba el nombre del título que desea borrar de la base de datos:</label>
                            <input type="text" class="form-control" name="borrarTitulo">
                        </div>
                        <br> 
                        <input type="hidden" name="accion" value="borrarTituloPorAutor">                
                        <button type="submit" class="btn btn-danger">Borrar</button>
                        <br>
                    </form>
                </div>-->

<!--        <footer class="bg-dark text-white text-center py-3" style="width: 100%; margin-top: 100px; margin-right: 0px; margin-left: 0px">
            <img src="img/logo.png" alt="">
            <hr style="width: 50vw; margin: 10px auto;">    
            <div class="container">
                <p>Copyright &copy;2023 Nicolás Di Bartolo. Todos los derechos reservados</p>
            </div>
        </footer>-->

    </body>
</html>
