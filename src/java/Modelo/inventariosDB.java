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
import java.sql.Timestamp;

/**
 *
 * @author edwar
 */
public class inventariosDB {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    //operaciones crud
    public List listar(){
        String sql="select * from productos INNER JOIN usuarios on productos.idUsuario = usuarios.idUsuario";
        List<inventarios>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                inventarios in=new inventarios();
                in.setIdProductos(rs.getInt(1));
                in.setNombreProductos(rs.getString(2));
                in.setCantiadProductos(rs.getInt(3));
                in.setEstatusProductos(rs.getString(4));
                //in.setIdUsuario(rs.getInt(5));
                in.setNombre(rs.getString(7));
                lista.add(in);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    public List listarsalidas(){
        String sql="SELECT * FROM productos "
               + "INNER JOIN usuarios ON productos.idUsuario = usuarios.idUsuario "
               + "WHERE productos.estatusProductos = 'Activo'";
        List<inventarios>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                inventarios in=new inventarios();
                in.setIdProductos(rs.getInt(1));
                in.setNombreProductos(rs.getString(2));
                in.setCantiadProductos(rs.getInt(3));
                in.setEstatusProductos(rs.getString(4));
                //in.setIdUsuario(rs.getInt(5));
                in.setNombre(rs.getString(7));
                lista.add(in);
            }
        } catch (Exception e) {
        }
        return lista;
    }
     public List listarhistorial(){
        String sql="select * FROM historico INNER JOIN usuarios ON historico.idUsuario = usuarios.idUsuario INNER JOIN productos ON historico.idProductos = productos.idProductos";
        List<Movimiento>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Movimiento in=new Movimiento();
                in.setIdHistorico(rs.getInt(1));
                in.setTipodemovimiento(rs.getString(2));
                in.setIdUsuario(rs.getInt(3));
                in.setIdProductos(rs.getInt(4));
                in.setCantidad(rs.getInt(5));
                in.setFecha(rs.getTimestamp(6));
                in.setNombre(rs.getString("nombre"));
                in.setNombreProductos(rs.getString("nombreProductos"));
                
                lista.add(in);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    public int agregar(inventarios in){
        String sql="insert into productos(idProductos, nombreProductos, cantidadProductos, estatusProductos, idUsuario)values(?,?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, in.getIdProductos());
            ps.setString(2, in.getNombreProductos());
            ps.setInt(3, in.getCantiadProductos());
            ps.setString(4, in.getEstatusProductos());
            ps.setInt(5, in.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public int registrarMovimiento(Movimiento movimiento) {
        String sql = "INSERT INTO historico (tipodemovimiento, idUsuario, idProductos, cantidad) VALUES (?, ?, ?, ?)";
        try{
             con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, movimiento.getTipodemovimiento());
            ps.setInt(2, movimiento.getIdUsuario());
            ps.setInt(3, movimiento.getIdProductos());
            ps.setInt(4, movimiento.getCantidad());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
    public inventarios listarId(int id){
        inventarios in=new inventarios();
        String sql="select * from productos where idProductos="+id;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                in.setIdProductos(rs.getInt(1));
                in.setNombreProductos(rs.getString(2));
                in.setCantiadProductos(rs.getInt(3));
                in.setEstatusProductos(rs.getString(4));
                in.setIdUsuario(rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return in;
    }
    public int entradas(inventarios in){
        String sql="update productos set nombreProductos=?, cantidadProductos=?, estatusProductos=?, idUsuario=? where idProductos=? ";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            
            ps.setString(1, in.getNombreProductos());
            ps.setInt(2, in.getCantiadProductos());
            ps.setString(3, in.getEstatusProductos());
            ps.setInt(4, in.getIdUsuario());
            ps.setInt(5, in.getIdProductos());
            ps.executeUpdate();
        } catch (Exception e) { 
                e.printStackTrace();
            }finally {
            try {
                if (ps != null) ps.close(); 
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
   
        return r;
    }
    public int salidas(inventarios in){
        String sql="update productos set idProductos=?, nombreProductos=?, cantidadProductos=?, estatusProductos=?, idUsuario=? where idProductos=? ";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, in.getIdProductos());
            ps.setString(2, in.getNombreProductos());
            ps.setInt(3, in.getCantiadProductos());
            ps.setString(4, in.getEstatusProductos());
            ps.setInt(5, in.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public int baja(inventarios in){
        String sql="update productos set idProductos=?, nombreProductos=?, cantidadProductos=?, estatusProductos=?, idUsuario=? where idProductos=? ";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, in.getIdProductos());
            ps.setString(2, in.getNombreProductos());
            ps.setInt(3, in.getCantiadProductos());
            ps.setString(4, in.getEstatusProductos());
            ps.setInt(5, in.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
    
}
