<%-- 
    Document   : EditarAve
    Created on : 26-oct-2016, 16:17:32
    Author     : AlfonsoTerrones
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="es.albarregas.modelo.Ave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Ave> listado = new ArrayList();
    listado = (List<Ave>) request.getSession().getAttribute("listadoaves");//pasaremos al array Listado el listado de aves para ver cual hemos seleccionado
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar ave</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
    </head>
    <body>
        <form action="UpdateDelete" method="post">
        <h1>Editar un ave</h1>

        <%  //request.setAttribute("opcion",request.getParameter("menu"));
            for(Ave pajaro : listado){ 
            if(request.getParameter("aves").equals(pajaro.getAnilla())){ //Aqui elegiremos el Ave que queremos que nos muestre
        %>

        <table id="centro">
    <tr>
        <td><p>Anilla</p></td>
        <td><p>Especie</p></td>
        <td><p>Lugar</p></td>
        <td><p>Fecha</p></td>    
        
    </tr>
        <tr><%
            ///////////////////////////////Formulario controlando que si es null deberia de mostrar la caja de texto en blanco
           if(pajaro.getAnilla()==null){
        %><td><input type="text" name="anilla"    value=""/></td><%
       }else{%>
        <td><input type="text" name="anilla" value="<%=pajaro.getAnilla()%>"/></td>
       <% }if(pajaro.getEspecie()==null){
           %> <td><input type="text" name="especie" value="" /></td><%
       }else{%>
        <td><input type="text" name="especie" style="<%=pajaro.getEspecie()%>" value="<%=pajaro.getEspecie()%>"/></td>
        <% }if(pajaro.getLugar()==null){
           %> <td><input type="text" name="lugar"  style="<%=pajaro.getLugar()%>" value=""/></td><%
       }else{%>
        <td><input type="text" name="lugar" value="<%=pajaro.getLugar()%>"/></td>
        <%} if(pajaro.getFecha()==null){
           %> <td><input type="text" name="fecha" value=""/></td><%
       }else{%>
         <td><input type="text" name="fecha" value="<%=pajaro.getFecha()%>"/></td>
        <td><input type="submit" name="aves" value="Editar"/></td> 
        </tr>    
</table>
        <% }
        }
    }%>

        </form>
    </body>
</html>
