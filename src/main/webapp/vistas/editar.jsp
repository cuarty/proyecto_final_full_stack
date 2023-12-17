
<%@page import="modelo.Libros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style/index.css">
        <title>Editar Contacto</title>
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
        
        <div class="container mt-4">
            <h2>Editar Libro</h2>
            <!-- Formulario con clases de Bootstrap -->
            <form action="OperacionServlet" method="post" class="mt-3">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="indice" value="<%= request.getAttribute("indice")%>">

                <div class="form-group">
                    <label>Título:</label>
                    <input type="text" class="form-control" name="titulo" value="<%= ((Libros) request.getAttribute("libro")).getTitulo()%>">
                </div>

                <div class="form-group">
                    <label>Autor:</label>
                    <input type="text" class="form-control" name="autor" value="<%= ((Libros) request.getAttribute("libro")).getAutor()%>">
                </div>

                <div class="form-group">
                    <label>Genero:</label>
                    <input type="text" class="form-control" name="genero" value="<%= ((Libros) request.getAttribute("libro")).getGenero()%>">
                </div>

                <div class="form-group">
                    <label>Ubicacion:</label>
                    <input type="text" class="form-control" name="ubicacion" value="<%= ((Libros) request.getAttribute("libro")).getUbicacion()%>">
                </div>

                <button type="submit" class="btn btn-primary">Actualizar Libro</button>
            </form>
        </div>

        <footer class="bg-dark text-white text-center py-3" style="width: 100%; margin-top: 100px; margin-right: 0px; margin-left: 0px">
            <img src="img/logo.png" alt="">
            <hr style="width: 50vw; margin: 10px auto;">    
            <div class="container">
                <p>Copyright &copy;2023 Nicolás Di Bartolo. Todos los derechos reservados</p>
            </div>
        </footer>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
