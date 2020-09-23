

package modelo;

import datos.CADO;

public class cliente {
 public String insertar(int id, String nombres, String apellidos, String dni, String direccion, String telefono)
    {
        String sql = "INSERT INTO cliente (idcliente,nombres,apellidos,dni,direccion,telefono) VALUES ('" + id + "','" + nombres + "','" + apellidos + "','" + dni + "','" + direccion+ "','" + telefono + "')";
        CADO ocado = new CADO();
        ocado.ejecutar(sql);        
        return "Cliente insertado correctamente ";
    }
    public String actualizar(int id, String nombres, String apellidos, String dni, String direccion, String telefono)
    {
        String sql = "UPDATE cliente SET nombres = '" + nombres 
                + "',apellidos='"+apellidos+"',dni='"+dni+"',direccion='"+direccion+"',telefono='"+telefono+"' WHERE idcliente = " + id ;
        CADO ocado = new CADO();
        ocado.ejecutar(sql);        
        return "Cliente actualizado correctamente ";
    }
    public String eliminar(int id)
    {
        String sql = "DELETE FROM cliente WHERE idcliente = " + id ;
        CADO ocado = new CADO();
        ocado.ejecutar(sql);        
        return "Cliente eliminado";
    }
   
}
