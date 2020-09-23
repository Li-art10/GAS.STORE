<%@page import="modelo.cliente"%>
<%
    int id = Integer.parseInt(request.getParameter("txtid"));
    String nombres = request.getParameter("txtnombre");
    String apellidos = request.getParameter("txtapellidos");
    String dni = request.getParameter("txtdni");
    String direccion = request.getParameter("txtdireccion");
    String telefono = request.getParameter("txttelefono");
    String pboton = request.getParameter("boton");
        
    if(pboton.equals("Grabar"))
    {    
        cliente ocliente = new cliente();
        out.print(ocliente.insertar(id, nombres, apellidos, dni, direccion, telefono));
    }
    /// aqui agregarias otras acciones
%>