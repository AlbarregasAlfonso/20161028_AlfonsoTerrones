<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="es.albarregas.modelo.Ave"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resultados</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
</head>
<body>
    <form name="form" action="ControladorEditarBorrar" method="post">
        
      
    <h2 id="titulo">listado de datos</h2>
   
    <table>
             
    <%
        
    
    List<Ave> listado = null;
    listado = new ArrayList();
    listado = (ArrayList<Ave>)request.getAttribute("lista");
    String menu = "radio";
    
    if(request.getParameter("menu").equals("Borrar")){//Si hemos elegido la opcion de Borrar nos mostrara un checkbox y si hemos elegido editar nos mostrara radio button
        menu="checkbox";
    }
 
    if(request.getParameter("menu").equals("Listar")){//en el caso de que sea listado nos mostrara la cabecera
           %>  <tr>
            <td id="titulo">Anilla</td>
            <td id="titulo">Especie</td>
            <td id="titulo">Lugar</td>
            <td id="titulo">Fecha</td>
                
        </tr><%
        }

    for(Ave pajaro : listado){
        
        if(request.getParameter("menu").equals("Listar")){//mostrar campos si hemos pulsado listar
            %><tr>
                <td><%=pajaro.getAnilla()%></td>
                <td><%=pajaro.getEspecie()%></td>
                <td><%=pajaro.getLugar()%></td>
                <td><%=pajaro.getFecha()%></td>
             </tr><%  
        }else{
    %>
   
    <tr>
        <td><input type="<%=menu%>" name="aves" value="<%=pajaro.getAnilla()%>"><%=pajaro.getAnilla()%></td><!--Nos muestra los datos que vamos a editar o borrar-->
        <td><%=pajaro.getEspecie()%></td>
    </tr>
    <%
        }
    }
    %>
    
    </table>
        <br/>
        <p><a href="<%=request.getContextPath()%>/JSP/index.jsp">Volver</a></p>
        <% if(!request.getParameter("menu").equals("Listar")){//Si hemos pulsado listar no nos mostrara el boton   %>
        <input type="submit" name="<%=request.getParameter("menu")%>" value="<%=request.getParameter("menu")%>"/> 
        <%}%>
    </form>
</body>
</html>