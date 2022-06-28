package com.example.lab10_20181667_20191417_20190740.beans;


public class Viaje {
    private String id;
    private String fechaViaje;
    private String fechaReserva;
    private String ciudadOrigen;
    private String ciudadDestino;
    private int numBoleto;
    private double costo;
    private BUsuario usuario;
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

    public String getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(String fechaReserva) {
        this.fechaReserva = fechaReserva;
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

    public BUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(BUsuario usuario) {
        this.usuario = usuario;
    }

    public Seguro getSeguro() {
        return seguro;
    }

    public void setSeguro(Seguro seguro) {
        this.seguro = seguro;
    }
}
