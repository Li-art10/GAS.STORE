<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection cn;
    Statement st;
    PreparedStatement ps;
    
    try{
        //conectar al servidor BD
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplo", 
                    "root", "root");    
        //ejecutar la tarea de INSERTAR
        int id = Integer.parseInt(request.getParameter("txtid")); 
        String nombre = request.getParameter("txtnombre");
        String apellidos = request.getParameter("txtapellidos");        
        String dni = request.getParameter("txtdni");
        String direccion = request.getParameter("txtdireccion");
        String telefono = request.getParameter("txttelefono");         
        String pboton = request.getParameter("boton");
        out.print("seleccionas " + pboton);
        if(pboton.equals("GrabarSta"))
        {    
            out.print("ingreso al state");
             String sql = "INSERT INTO cliente (idcliente,nombres,apellidos,dni,direccion,telefono) VALUES ('" + id + "','" + nombre + "','" + apellidos + "','" + dni + "','" + direccion+ "','" + telefono + "')";
            st = cn.createStatement();
            st.executeUpdate(sql);
            out.print("statement");
        }
        if(pboton.equals("GrabarPre"))
        {
            out.print("ingreso al preparedstate");
            String sql = "INSERT INTO cliente VALUES (?)";
            ps = cn.prepareStatement(sql);
            
            ps.executeUpdate();
            out.print("preparedstatement");
        }    
        out.print("Guardado correctamente");
    }catch(Exception e){
        out.print("error .. " + e.getMessage());
    }
%>