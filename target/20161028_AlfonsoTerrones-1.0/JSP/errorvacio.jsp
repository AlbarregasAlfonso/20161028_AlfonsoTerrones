<%-- 
    Document   : errorvacio
    Created on : 31-oct-2016, 19:15:21
    Author     : AlfonsoTerrones
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
    </head>
    <body>
         <form action="<%=request.getContextPath()%>/JSP/CrearAveFormulario.jsp" method="get">
        <h1 id="error">Error al agregar un ave</h1>
        <% 
        List<String> errores = null;
        errores = new ArrayList();
        errores=(ArrayList)request.getAttribute("errores");
       
            for (String e: errores){
                %><p>El campo "<%=e%>" se encuentra vacio<p>
                <input style="display: none;" type="checkbox" name="camposVacios" checked="checked"  value="<%=e%>"/><%//Guardamos el valor de los campos que estan vacios para ponerlos en rojo posteriormente
            }
%>
                <input type="hidden" name="anilla" value="<%=request.getParameter("anilla")%>"/><!-- Los guardamos en un formulario oculto-->
                <input type="hidden" name="especie" value="<%=request.getParameter("especie")%>"/>
                <input type="hidden" name="lugar" value="<%=request.getParameter("lugar")%>"/>
                <input type="hidden" name="fecha" value="<%=request.getParameter("fecha")%>"/>  
             <input type="submit" value="volver" name="volver"/>
         </form>
    </body>
</html>
