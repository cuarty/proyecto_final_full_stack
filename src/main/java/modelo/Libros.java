
package modelo;

public class Libros {
    private String titulo;
    private String autor;
    private String genero;
    private String ubicacion;

    public Libros() {
    }

    public Libros(String titulo, String autor, String genero, String ubicacion) {
        this.titulo = titulo;
        this.autor = autor;
        this.genero = genero;
        this.ubicacion = ubicacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    
    
}
