<%-- 
    Document   : CrearAveFormulario
    Created on : 26-oct-2016, 9:57:42
    Author     : AlfonsoTerrones
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Ave</title>
         <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
    </head>
    <body>
        <form action="<%=request.getContextPath()%>/ControladorCrearAve" >

        <h1 id="titulo" >Vamos a agregar un ave a nuestra base de datos </h1>
      
        <% 
           String estiloLugar ="";
           String estiloEspecie ="";
           String estiloFecha ="";

        if(request.getParameterValues("camposVacios")!=null){//aqui entraremos cuando no hayamos introducido algun campo
           
           String [] camposVacios = request.getParameterValues("camposVacios");//Aqui metemos los campos que estan vacios para luego marcarlos en rojo
    
            for(String e:camposVacios){
         
               if(e.equals("lugar")){
                   estiloLugar="background-color:red;";
               }
               if(e.equals("fecha")){
                   estiloFecha="background-color:red;";
               }
               if(e.equals("especie")){
                   estiloEspecie="background-color:red;";
               }
           }
        }
           
           
           
           
           
           //Mstraremos el formulario teniendo en cuenta que si hay algun campo que sea null mostraremos el campo en blanco
%><table id="centro">
    <tr>
        <td><p>Anilla</p></td>
        <td><p>Especie</p></td>
        <td><p>Lugar</p></td>
        <td><p>Fecha</p></td>    
        <td><input type="submit" value="Agregar" name="menu"/></td> 
    </tr>
        <tr><%
           if(request.getParameter("anilla")==null){
        %><td><input type="text" name="anilla"  type="Text"  value=""/></td><%
       }else{%>
        <td><input type="text" name="anilla"  type="Text" value="<%=request.getParameter("anilla")%>"/></td>
       <% }if(request.getParameter("especie")==null){
           %> <td><input type="text" name="especie"  type="Text" style="<%=estiloEspecie%>" value="" /></td><%
       }else{%>
        <td><input type="text" name="especie" style="<%=estiloEspecie%>" value="<%=request.getParameter("especie")%>"/></td>
        <% }if(request.getParameter("lugar")==null){
           %> <td><input type="text" name="lugar"  style="<%=estiloLugar%>" style="<%=estiloLugar%>" value=""/></td><%
       }else{%>
        <td><input type="text" name="lugar" style="<%=estiloLugar%>" value="<%=request.getParameter("lugar")%>"/></td>
        <%} if(request.getParameter("fecha")==null){
           %> <td><input type="text" name="fecha" style="<%=estiloFecha%>" type="Text" value=""/></td><%
       }else{%>
        <td><input type="text" name="fecha" style="<%=estiloFecha%>" value="<%=request.getParameter("fecha")%>"/></td> 
        </tr>    
</table>
        <%}%>
            <a href="<%=request.getContextPath()%>/JSP/index.jsp">Volver</a>
        </form>
    </body>
</html>
