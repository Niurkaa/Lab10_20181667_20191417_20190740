package com.example.lab10_20181667_20191417_20190740.daos;

import com.example.lab10_20181667_20191417_20190740.beans.BUsuario;
import com.example.lab10_20181667_20191417_20190740.beans.Seguro;
import com.example.lab10_20181667_20191417_20190740.beans.Viaje;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViajesDao extends BaseDao {

    public ArrayList<Viaje> listar(int id, String ciudadOrigen, String ciudadDestino){
        ArrayList<Viaje> viajes = new ArrayList<>();
        String sql = null;
        if(ciudadOrigen==null || ciudadDestino==null) {
            sql = "select * from viaje v inner join usuario u on  u.idUsuario = v.Usuario_idUsuario where u.idUsuario = ?";
        }else {
            sql = "select * from viaje v inner join usuario u on  u.idUsuario = v.Usuario_idUsuario where (v.ciudadDestino like ? or v.ciudadOrigen like ?) and u.idUsuario = ?";
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
                        seguro.setId(resultSet.getInt(9));
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



}
