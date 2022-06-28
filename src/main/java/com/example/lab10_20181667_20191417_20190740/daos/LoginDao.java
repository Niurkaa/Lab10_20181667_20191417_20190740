package com.example.lab10_20181667_20191417_20190740.daos;

import com.example.lab10_20181667_20191417_20190740.beans.BUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao extends BaseDao {
    public BUsuario encontrarUsuario(String user, String pass){
        BUsuario bUsuario= new BUsuario();
        String sql= "select * from usuario where correo= ? and contrasenia= sha2(?,256);";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,user);
            pstmt.setString(2,pass);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    bUsuario.setIdUsuario(rs.getInt(1));
                    bUsuario.setNombre(rs.getString(2));
                    bUsuario.setApellido(rs.getString(3));
                    bUsuario.setEdad(rs.getInt(4));
                    bUsuario.setCodigo(rs.getInt(5));
                    bUsuario.setCorreo(rs.getString(6));
                    bUsuario.setEspecialidad(rs.getString(7));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bUsuario;
    }
}
