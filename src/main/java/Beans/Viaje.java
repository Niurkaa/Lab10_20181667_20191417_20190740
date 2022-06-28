package Beans;

public class Viaje {
    private String id;
    private String fechaViaje;
    private String fechaOrigen;
    private String ciudadOrigen;
    private String ciudadDestino;
    private int numBoleto;
    private double costo;
    private Usuario usuario;
    private Seguro seguro;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFechaViaje() {
        return fechaViaje;
    }

    public void setFechaViaje(String fechaViaje) {
        this.fechaViaje = fechaViaje;
    }

    public String getFechaOrigen() {
        return fechaOrigen;
    }

    public void setFechaOrigen(String fechaOrigen) {
        this.fechaOrigen = fechaOrigen;
    }

    public String getCiudadOrigen() {
        return ciudadOrigen;
    }

    public void setCiudadOrigen(String ciudadOrigen) {
        this.ciudadOrigen = ciudadOrigen;
    }

    public String getCiudadDestino() {
        return ciudadDestino;
    }

    public void setCiudadDestino(String ciudadDestino) {
        this.ciudadDestino = ciudadDestino;
    }

    public int getNumBoleto() {
        return numBoleto;
    }

    public void setNumBoleto(int numBoleto) {
        this.numBoleto = numBoleto;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Seguro getSeguro() {
        return seguro;
    }

    public void setSeguro(Seguro seguro) {
        this.seguro = seguro;
    }
}
