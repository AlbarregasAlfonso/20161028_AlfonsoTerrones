/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlet;

import es.albarregas.modelo.Ave;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author AlfonsoTerrones
 */
@WebServlet(name = "UpdateDelete", urlPatterns = {"/UpdateDelete"})
public class UpdateDelete extends HttpServlet {
javax.sql.DataSource datasource = null;


@Override
    public void init(ServletConfig config)throws ServletException{
        try{
            Context contextoinicial = new InitialContext();
            datasource = (DataSource)contextoinicial.lookup("java:comp/env/jdbc/pool");
            // faltaria poner conexion = datasource.getConnection();
        }catch(NamingException ex){
            System.out.println("Problemas en el acceso a la BD... ");
            ex.printStackTrace();
        }
    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             Connection conexion = null;
            java.sql.Statement sentencia = null;
            java.sql.PreparedStatement preparada = null;

        if(request.getParameter("borrar") != null){

             String [] avesaborrar = request.getParameterValues("avesABorrar");//recogemos las aves que queremos borrar
// SERIA CONVENIENTE CONSTRUIR LA CLAUSULA WHERE
            for(String s:avesaborrar){//Hacemos un bucle oara borrar cada uno de los datos seleccionados
                String sql = null;
                sql = "delete from aves where anilla='"+s+"';";

            try {
                conexion = datasource.getConnection();
            } catch(SQLException ex){
                System.out.println("Error al cargar el driver");
                ex.printStackTrace();
            }

            try{

                sentencia = conexion.createStatement();
                sentencia.executeUpdate(sql);
                sentencia.close();

            } catch (SQLException ex) {


                ex.printStackTrace();
            }

            }

            request.setAttribute("mensaje", "Se ha borrado algunos datos de su base de datos");
            request.getRequestDispatcher("JSP/index.jsp").forward(request, response);

        }else{//En este caso habremos pulsado editar
// SERIA CONVENIENTE UNA SENTENCIA PREPARADA
            String sql = null;
            sql = "update aves set especie='"+request.getParameter("especie")+"' , lugar='"+request.getParameter("lugar")+"' , fecha='"+request.getParameter("fecha")+"' where anilla='"+request.getParameter("anilla")+"';";

            try {
                conexion = datasource.getConnection();
            } catch(SQLException ex){
                System.out.println("Error al cargar el driver");
                ex.printStackTrace();
            }

            try{

            sentencia = conexion.createStatement();
            sentencia.executeUpdate(sql);
            sentencia.close();

            } catch (SQLException ex) {

                System.out.println("Error al crear la conexión");
                ex.printStackTrace();
            } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if (preparada != null) {
                    preparada.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

       }
            request.setAttribute("mensaje", "Se ha modificado la especie "+request.getParameter("especie"));
            request.getRequestDispatcher("JSP/index.jsp").forward(request, response);
    }//else

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);


    }

      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);


    }

}
