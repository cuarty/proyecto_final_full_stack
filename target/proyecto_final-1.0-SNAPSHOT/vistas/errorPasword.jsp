
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="style/indexError.css">
        <!--        <link rel="stylesheet" href="style/index.css">-->
        <title>JSP Page</title>
    </head>
    <body style="background: url(img/warning.jpg); background-size: cover">


        <section>
            <form action="OperacionServlet" method="post" class="mb-3" style="align-items: center; text-align: center">                
                <div class="form-group">
                    <label style=" font-size: 50px; font-weight: bold; color: white">CONTRASEÑA INCORRECTA!!</label>
                </div>
                <br> 
                <input type="hidden" name="accion" value="redireccionarAIndex">                
                <button type="submit" class="btn btn-primary">VOLVER</button>
                <br>
            </form>
        </section>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
