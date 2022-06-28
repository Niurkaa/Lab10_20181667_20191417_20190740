package com.example.lab10_20181667_20191417_20190740.daos;

import com.example.lab10_20181667_20191417_20190740.beans.BUsuario;
import com.example.lab10_20181667_20191417_20190740.beans.Seguro;
import com.example.lab10_20181667_20191417_20190740.beans.Viaje;


import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends BaseDao {

    public ArrayList<Viaje> listar(int id, String ciudadOrigen, String ciudadDestino){
        ArrayList<Viaje> viajes = new ArrayList<>();
        String sql = null;
        if(ciudadOrigen==null || ciudadDestino==null) {
            sql = "select * from viaje v inner join usuario u on  u.idUsuario = v.Usuario_idUsuario inner join seguro s on v.Seguro_idSeguro = s.idSeguro where u.idUsuario = ?";
        }else {
            sql = "select * from viaje v inner join usuario u on  u.idUsuario = v.Usuario_idUsuario inner join seguro s on v.Seguro_idSeguro = s.idSeguro where (v.ciudadDestino like ? and v.ciudadOrigen like ?) and u.idUsuario = ?";
        }

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

                if(ciudadOrigen==null || ciudadDestino==null) {
                    pstmt.setInt(1, id);
                }else {
                    pstmt.setString(1, "%"+ciudadOrigen+"%");
                    pstmt.setString(2,"%"+ciudadDestino+"%");
                    pstmt.setInt(3, id);
                }


                try (ResultSet resultSet = pstmt.executeQuery()) {
                    while (resultSet.next()) {
                        Viaje viaje = new Viaje();
                        viaje.setId(resultSet.getString(1));
                        viaje.setFechaViaje(resultSet.getString(2));
                        viaje.setCiudadOrigen(resultSet.getString(3));
                        viaje.setCiudadDestino(resultSet.getString(4));
                        viaje.setCosto(resultSet.getDouble(5));
                        viaje.setFechaReserva(resultSet.getString(6));
                        viaje.setNumBoleto(resultSet.getInt(7));
                        BUsuario usuario = new BUsuario();
                        usuario.setIdUsuario(resultSet.getInt(8));
                        viaje.setUsuario(usuario);
                        Seguro seguro = new Seguro();
                        seguro.setNombre(resultSet.getString(19));
                        viaje.setSeguro(seguro);
                        viajes.add(viaje);
                    }
                }

            } catch (SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }



        return viajes;
    }


    public void anadir(String fechaViaje, String fechaReserva, int seguro, int numBoleto, double costo, int usuario, String ciudadDestino, String ciudadOrigen){
        String codigo = generarCodigoCompra();
        String sql = "insert into viaje (idViaje, fechaViaje, fechaReserva,ciudadDestino, ciudadOrigen, costo, numBoleto, Usuario_idUsuario, Seguro_idSeguro) values \n" +
                "(?,?,?,?,?,?,?,?,?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,codigo);
            pstmt.setString(2, fechaViaje);
            pstmt.setString(3,fechaReserva);
            pstmt.setString(4,ciudadDestino);
            pstmt.setString(5,ciudadOrigen);
            pstmt.setDouble(6,costo);
            pstmt.setInt(7,numBoleto);
            pstmt.setInt(8,usuario);
            pstmt.setInt(9,seguro);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

    }

    public String generarCodigoCompra(){
        String codigo="";
        String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
        for (int i = 0; i < 8; i++ ) {
            codigo += letters[(int) Math.round(Math.random() * 15)];
        }
        System.out.println(codigo);
        return codigo;
    }

    public ArrayList<Seguro> listarS(){
        ArrayList<Seguro> seguros = new ArrayList<>();
        String sql = "select * from seguro";
        try (Connection conn = this.getConnection();
             Statement pstmt = conn.createStatement()) {
            try (ResultSet resultSet = pstmt.executeQuery(sql)) {
                while (resultSet.next()) {
                    Seguro seguro = new Seguro();
                    seguro.setId(resultSet.getInt(1));
                    seguro.setNombre(resultSet.getString(2));
                    seguros.add(seguro);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return seguros;
    }

    public void editar(String idViaje, String fechaViaje, String fechaReserva, int seguro, int numBoleto, double costo, int usuario, String ciudadDestino, String ciudadOrigen){
        String sql = "UPDATE viaje\n" +
                "SET fechaViaje = ?, fechaReserva = ?, Seguro_idSeguro = ?, numBoleto = ?, costo = ?, Usuario_idUsuario = ?, ciudadDestino = ?, ciudadOrigen = ?\n" +
                "WHERE idViaje = ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){

            pstmt.setString(1, fechaViaje);
            pstmt.setString(2,fechaReserva);
            pstmt.setInt(3,seguro);
            pstmt.setInt(4,numBoleto);
            pstmt.setDouble(6,costo);
            pstmt.setInt(7, usuario);
            pstmt.setString(8,ciudadDestino);
            pstmt.setString(9,ciudadOrigen);



            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

    }

    public void eliminar(String idViaje){
        String sql = "DELETE FROM viaje\n" +
                "WHERE idViaje = ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, idViaje);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

    }

}
