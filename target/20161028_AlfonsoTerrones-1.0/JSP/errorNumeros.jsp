<%-- 
    Document   : errorNumeros
    Created on : 31-oct-2016, 19:46:05
    Author     : AlfonsoTerrones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
         <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/estilo.css"/>
    </head>
    <body>
        <form action="<%=request.getContextPath()%>/JSP/CrearAveFormulario.jsp" method="get">

            <input type="hidden" name="anilla"   value="<%=request.getParameter("anilla")%>"/>
            <input type="hidden" name="lugar"   value="<%=request.getParameter("lugar")%>"/>
            <input type="hidden" name="especie"   value="<%=request.getParameter("especie")%>"/>
            <input type="hidden" name="fecha"   value="<%=request.getParameter("fecha")%>"/>
                                                       
                <h1 id="error" >Cadena con números</h1>
         <input type="submit" value="volver" name="volver"/>
        </form>
    </body>
</html>
