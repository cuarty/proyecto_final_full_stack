package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Libros;

@WebServlet(name = "LibreriaServlet", urlPatterns = {"/LibreriaServlet"})
public class LibreriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String genero = request.getParameter("genero");
        String ubicacion = request.getParameter("ubicacion");

        //Creamos un nuevo libro con los datos recogidos;
        Libros nuevoLibro = new Libros(titulo, autor, genero, ubicacion);

        // Obtiene la lista de contactos del contexto de la aplicación
        List<Libros> libros = (List<Libros>) getServletContext().getAttribute("libros");
        if (libros == null) {
            libros = new ArrayList<>();
        }
        
        // Añade el nuevo contacto a la lista
        libros.add(nuevoLibro);
        
        // Guarda la lista actualizada en el contexto de la aplicación
        getServletContext().setAttribute("libros", libros);
        
        // Redirige de nuevo al JSP
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
