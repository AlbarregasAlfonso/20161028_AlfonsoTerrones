<%-- 
    Document   : BorrarAve
    Created on : 26-oct-2016, 18:28:36
    Author     : AlfonsoTerrones
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="es.albarregas.modelo.Ave"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import=" javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
    </head>
    
    <body>
        <form action="UpdateDelete">
         
        <h1 id="titulo">¿Estas seguro que desea borrar las siguientes aves? </h1>
        
        <%
        String [] avesaborrar = request.getParameterValues("aves");//Le pasamos las aves que queremos borrar a un bucle

        for(String s:avesaborrar){
            out.println(s);
             %><input style="display: none;" type="checkbox" name="avesABorrar" checked="checked" value="<%=s%>"/><br/><%=s%><%//marcamos las que queremos borrar en un formulario oculto
        }
        %>

       <br/>
         <input type="submit" name="borrar" value="Borrar"/> 
       </form>
    </body>
</html>
