package registrosDAO;

import conexion.ConexionDB;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Libros;

public class RegistroDAO {

    // Método para INSERTAR UN REGISTRO 
    public void agregarRegistro(String titulo, String autor, String genero, String ubicacion) {
        // Consulta SQL para insertar datos en la tabla
        String SQL = "INSERT INTO tablaLibros (titulo, autor, genero, ubicacion) VALUES (?, ?, ?, ?)";

        try {
            // Establecer conexión
            Connection conn = ConexionDB.getConnection();
            // Preparar la consulta
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            // Asignar valores a los parámetros de la consulta
            pstmt.setString(1, titulo);
            pstmt.setString(2, autor);
            pstmt.setString(3, genero);
            pstmt.setString(4, ubicacion);

            // Ejecutar la consulta de actualización
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(); // Imprimir la traza de la excepción en caso de error
        }
    }

    // Método para LEER TODOS LOS REGISTROS
    public List<String[]> obtenerRegistros() {
        List<String[]> registros = new ArrayList<>();
        // Consulta SQL para seleccionar todos los registros
        String SQL = "SELECT * FROM tablaLibros";

        try {
            // Establecer conexión
            Connection conn = ConexionDB.getConnection();
            // Preparar la consulta
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            // Ejecutar la consulta y obtener los resultados
            ResultSet rs = pstmt.executeQuery();

            // Iterar sobre los resultados
            while (rs.next()) { // next() obtener el siguiente elemento
                // Almacenar los datos de cada registro en un array y añadirlo a la lista
                String[] registro = {rs.getString("titulo"), rs.getString("autor"), rs.getString("genero"), rs.getString("ubicacion")};
                registros.add(registro);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(); // Manejo de errores SQL
        }
        return registros; // Devolver la lista de registros
    }

    // Método para ACTUALIZAR UN REGISTRO
    public void actualizarRegistro(int id, String titulo, String autor, String genero, String codigo) {
        // Consulta SQL para actualizar
        String SQL = "UPDATE tablaLibros SET titulo = ?, autor = ?, genero = ?, ubicacion = ? WHERE id = ?";
        try {
            // Establecer conexión
            Connection conn = ConexionDB.getConnection();
            // Preparar la consulta
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            // Asignar valores a los parámetros de la consulta
            pstmt.setString(1, titulo);
            pstmt.setString(2, autor);
            pstmt.setString(3, genero);
            pstmt.setString(4, codigo);
            pstmt.setInt(5, id);

            // Ejecutar la consulta de actualización
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(); // Manejo de errores SQL
        }
    }

    // Método para ELIMINAR UN REGISTRO
    public void eliminarRegistro(String titulo) {
        String SQL = "DELETE FROM tablaLibros WHERE titulo = ?"; // Consulta SQL para eliminar
        try {
            // Establecer conexión
            Connection conn = ConexionDB.getConnection();
            // Preparar la consulta
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            // Asignar valor al parámetro de la consulta
            pstmt.setString(1, titulo);

            // Ejecutar la consulta de actualización
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(); // Manejo de errores SQL
        }
    }

    public List<Libros> obtenerPorTitulo(String titulo) {
        List<Libros> listaLibros = new ArrayList<>();
        String sql = "SELECT * FROM tablaLibros WHERE titulo = ?";
        try ( Connection conn = ConexionDB.getConnection();  
              PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, titulo);
            ResultSet rs = pstmt.executeQuery();
            
                while (rs.next()) {
                    Libros libro = new Libros();
                    libro.setTitulo(rs.getString("titulo"));
                    libro.setAutor(rs.getString("autor"));
                    libro.setGenero(rs.getString("genero"));
                    libro.setUbicacion(rs.getString("ubicacion"));
                    listaLibros.add(libro);
                }                           
            

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaLibros;        

    }

    public List<Libros> obtenerPorAutor(String autor) {
        List<Libros> listaLibros = new ArrayList<>();
        String sql = "SELECT * FROM tablaLibros WHERE autor = ?";
        try ( Connection conn = ConexionDB.getConnection();  PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, autor);
            ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Libros libro = new Libros();
                    libro.setTitulo(rs.getString("titulo"));
                    libro.setAutor(rs.getString("autor"));
                    libro.setGenero(rs.getString("genero"));
                    libro.setUbicacion(rs.getString("ubicacion"));
                    listaLibros.add(libro);
                }
                

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaLibros;
    }

    public List<Libros> obtenerPorGenero(String genero) {
        List<Libros> listaLibros = new ArrayList<>();
        String sql = "SELECT * FROM tablaLibros WHERE genero = ?";
        try ( Connection conn = ConexionDB.getConnection();  PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, genero);
            ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Libros libro = new Libros();
                    libro.setTitulo(rs.getString("titulo"));
                    libro.setAutor(rs.getString("autor"));
                    libro.setGenero(rs.getString("genero"));
                    libro.setUbicacion(rs.getString("ubicacion"));
                    listaLibros.add(libro);
                }
                

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaLibros;
    }

}
