<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection cn;
    Statement st;
    
    try{
        //conectar al servidor BD
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplo", 
                    "root", "root");    
        //ejecutar la tarea de INSERTAR
        String sql = "INSERT INTO zona (descripcion) VALUES ('Zona 6')";
        st = cn.createStatement();
        st.executeUpdate(sql);
        out.print("Guardado correctamente");
    }catch(Exception e){
        out.print("error .. " + e.getMessage());
    }
%>