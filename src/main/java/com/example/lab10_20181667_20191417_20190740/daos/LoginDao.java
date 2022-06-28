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

    public void crearUsuario(String nombre, String apellido, int edad, int codigo, String correo,String especialidad, String pass){
        String sql= "insert into usuario (nombre, apellido, edad, codigo, correo, especialidad, contrasenia) VALUES " +
                "(?, ?, ?, ?, ?, ?, sha2(?,256));";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3, edad);
            pstmt.setInt(4, codigo);
            pstmt.setString(5,correo);
            pstmt.setString(6, especialidad);
            pstmt.setString(7,pass);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean noEmpezarNumero(String name){
        String[] name0=name.split("");
        if(!esNumero(name0[0])){
            return true;
        }
        return false;
    }
    public boolean correoFormNumPUCP(String correo){
        String[] pucp= correo.split("@");
        if(pucp[1].equals("pucp.edu.pe")){
            String[] primeraParte= correo.split("");
            if(primeraParte.length==21){
                for(int i=1;i<=8;i++){
                    //Indentificamos que sea un número
                    if(!esNumero(primeraParte[i])){
                        return false;
                    }
                }
            }else{
                return false;
            }
        }else{
            return false;
        }
        return true;
    }
    public boolean passValida(String pass){

        int contador=0;
        //Indentificamos que tenga una sola mayuscula
        for(int i=0;i<pass.length();i++){
            int valorAscii= pass.charAt(i);
            if(valorAscii>=65 && valorAscii<=90){
                contador++;
            }
            if(contador==2){
                return false;
            }
        }
        if(contador==0){
            return false;
        }
        contador=0;

        //Indentificamos que tenga un número
        for(int i=0;i<pass.length();i++){
            if(esNumero(pass.split("")[i])){
                contador++;
            }
            if(contador==2){
                return false;
            }
        }
        if(contador==0){
            return false;
        }
        contador=0;
        //Indentificamos que tenga un carácter especial
        for(int i=0;i<pass.length();i++){
            int valorAscii= pass.charAt(i);
            if((valorAscii>=33 && valorAscii<=47) || (valorAscii>=58 && valorAscii<=64) || (valorAscii>=91 && valorAscii<=96)){
                contador++;
            }
            if(contador==2){
                return false;
            }
        }
        if(contador==0){
            return false;
        }
        return true;
    }

    public boolean existeCorreo(String email){
        String sql= "select * from usuario where correo= ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,email);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean esNumero(String a){
        //Indentificamos que sea un número
        int valorAscii= a.charAt(0);
        if(valorAscii<48 || valorAscii>57){
            return false;
        }
        return true;
    }
}
