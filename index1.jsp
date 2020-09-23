
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/ejemplo";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "root";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from cliente");
            //Creamo la Tabla:     
        %>
        <div class="container" action="controlador_CUDPOO.jsp">  
            <a class=" btn btn-success btn-block btn-lg w-10" href="CUD.html" >Registro Cliente</a> 
            <p>
                
            </p>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" autocomplete="off" placeholder="Buscar""/>                            
            </div>
        </div>  

        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <table class="table table-bordered"  id="tablaDatos">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th class="text-center">DNI</th>
                        <h class="text-center">Direccion</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getInt("idcliente")%></td>
                        <td><%= rs.getString("nombres")%></td>
                        <td><%= rs.getString("apellidos")%></td>
                        <td class="text-center"><%= rs.getString("dni")%></td>
                        <td class="text-center"><%= rs.getString("direccion")%></td>
                        <td class="text-center"><%= rs.getString("telefono")%></td>
                        <td class="text-center">

                            <!-- <input type="hidden" value="<//%= rs.getInt("idcliente")%>" id="Editar"/>
                            <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                            <a href="Editar.jsp?id=<%= rs.getInt("idcliente")%>" class="btn btn-primary">Editar</a>
                            <a href="Delete.jsp?id=<%= rs.getInt("idcliente")%>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%}%>
            </table>
        </div>        
   
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>