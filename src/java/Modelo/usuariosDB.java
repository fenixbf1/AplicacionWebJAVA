/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author edwar
 */
public class usuariosDB {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public usuarios validar(String user, String pass, int idus){
        usuarios us=new usuarios();
        String sql="select * from usuarios INNER JOIN rol ON usuarios.idRol = rol.idRol where correo=? and contrasena=?";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            
            rs=ps.executeQuery();
            while (rs.next()) {
                us.setCorreo(rs.getString("correo"));
                us.setContrasena(rs.getString("contrasena"));
                us.setIdUsuario(rs.getInt("idUsuario"));
                us.setTipoRol(rs.getString("tipoRol"));
                us.setNombre(rs.getString("nombre"));
                
            }
        } catch (Exception e) {
        }return us;
    }
    
   
    
}