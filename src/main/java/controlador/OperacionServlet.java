package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Libros;
import modelo.TipoLibro;
import registrosDAO.RegistroDAO;

@WebServlet(name = "OperacionServlet", urlPatterns = {"/OperacionServlet"})
public class OperacionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        String buscarTitulo = request.getParameter("buscarTitulo");
        String buscarAutor = request.getParameter("buscarAutor");
        String buscarGenero = request.getParameter("buscarGenero");

        RegistroDAO registro = new RegistroDAO();
        TipoLibro tipoLibro = new TipoLibro();
        List<Libros> libros = (List<Libros>) getServletContext().getAttribute("libros");

        switch (accion) {
            case "eliminar":
                // Si la acción es "eliminar", obtenemos el índice del contacto y lo eliminamos de la lista.
                int indiceEliminar = Integer.parseInt(request.getParameter("indice"));
                libros.remove(indiceEliminar);
                // Redirigimos al usuario de vuelta a la página principal.
                response.sendRedirect("index.jsp");
                break;
            case "actualizar":
                // Si la acción es "actualizar", obtenemos los datos actualizados del contacto y los modificamos en la lista.
                int indiceActualizar = Integer.parseInt(request.getParameter("indice"));
                String titulo = request.getParameter("titulo");
                String autor = request.getParameter("autor");
                String genero = request.getParameter("genero");
                String ubicacion = request.getParameter("ubicacion");

                // Creamos un nuevo objeto Contacto con la información actualizada.
                Libros libroActualizado = new Libros(titulo, autor, genero, ubicacion);
                // Actualizamos el contacto en la lista.
                libros.set(indiceActualizar, libroActualizado);

                // Redirigimos al usuario de vuelta a la página principal.
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "editar":
                // Si la acción es "editar", obtenemos el contacto actual de la lista y preparamos la información para enviarla a la página de edición.
                int indiceEditar = Integer.parseInt(request.getParameter("indice"));
                Libros libroAEditar = libros.get(indiceEditar);
                // Establecemos los atributos que se enviarán a la página de edición.
                request.setAttribute("libro", libroAEditar);
                request.setAttribute("indice", indiceEditar);
                // Enviamos al usuario a la página de edición con la información del contacto.
                request.getRequestDispatcher("vistas/editar.jsp").forward(request, response);
                break;
            case "guardar":
                // Si la acción es "guardar", obtenemos el índice del contacto y lo guardamos usando los métodos RegistroDB; de la lista.
                int indiceGuardar = Integer.parseInt(request.getParameter("indice"));
                String titulos = libros.get(indiceGuardar).getTitulo();
                String autores = libros.get(indiceGuardar).getAutor();
                String generos = libros.get(indiceGuardar).getGenero();
                String ubicaciones = libros.get(indiceGuardar).getUbicacion();

                registro.agregarRegistro(titulos, autores, generos, ubicaciones);

                libros.remove(indiceGuardar);
                // Redirigimos al usuario de vuelta a la página principal.
                response.sendRedirect("index.jsp");

                break;

            case "verTodo":
                
                String pasword = request.getParameter("pasword");
                
                if ("admin".equals(pasword)){
                    
                    request.getRequestDispatcher("vistas/listaCompleta.jsp").forward(request, response);
                    
                } else {
                    
                    request.getRequestDispatcher("vistas/errorPasword.jsp").forward(request, response);
                }

                

                break;
                
            case "redireccionarAIndex" :
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                break;

            case "buscarTitulo":

                String dato = request.getParameter("buscarTitulo");
                request.setAttribute("buscarTitulo", dato);

                RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/listasPorTitulo.jsp");

                dispatcher.forward(request, response);

                break;

            case "buscarAutor":

                String dato1 = request.getParameter("buscarAutor");
                request.setAttribute("buscarAutor", dato1);

                RequestDispatcher dispatcher1 = request.getRequestDispatcher("vistas/listasPorAutor.jsp");

                dispatcher1.forward(request, response);

                break;

            case "buscarGenero":

                String dato2 = request.getParameter("buscarGenero");
                request.setAttribute("buscarGenero", dato2);

                RequestDispatcher dispatcher2 = request.getRequestDispatcher("vistas/listasPorGenero.jsp");

                dispatcher2.forward(request, response);

                break;

            case "borrarTituloPorGenero":
                String borrarTituloPorGenero = request.getParameter("borrarTitulo");

                registro.eliminarRegistro(borrarTituloPorGenero);

//                request.getRequestDispatcher("index.jsp");
                request.getRequestDispatcher("vistas/listasPorGenero.jsp").forward(request, response);

                break;

            case "borrarTituloPorTitulo":
                String borrarTituloPorTitulo = request.getParameter("borrarTitulo");

                registro.eliminarRegistro(borrarTituloPorTitulo);

//                request.getRequestDispatcher("index.jsp");
                response.sendRedirect("index.jsp");

                break;

            case "borrarTituloPorAutor":
                String borrarTituloPorAuto = request.getParameter("borrarTitulo");

                registro.eliminarRegistro(borrarTituloPorAuto);

//                request.getRequestDispatcher("index.jsp");
               request.getRequestDispatcher("vistas/listasPorAutor.jsp").forward(request, response);

                break;

            case "borrarTituloListaCompleta":
                String borrarTituloListaCompleta = request.getParameter("borrarTitulo");

                registro.eliminarRegistro(borrarTituloListaCompleta);

//                request.getRequestDispatcher("index.jsp");
                request.getRequestDispatcher("vistas/listaCompleta.jsp").forward(request, response);

                break;
        }

    }

}
