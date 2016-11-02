/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlet;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
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
import javax.sql.DataSource;

/**
 *
 * @author AlfonsoTerrones
 */
@WebServlet(name = "ControladorCrearAve", urlPatterns = {"/ControladorCrearAve"})
public class ControladorCrearAve extends HttpServlet {
javax.sql.DataSource datasource = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        Connection conexion = null;
            java.sql.Statement sentencia = null;
            java.sql.PreparedStatement preparada = null;
            
            List<String> errores = null;
                errores = new ArrayList();
            
             if(request.getParameter("especie").equals("")){//En el caso de que el campo especie este vacio se añade al error
                 errores.add("especie");  
             }
             if(request.getParameter("fecha").equals("")){//En el caso de que el campo fecha este vacio se añade al error
                 errores.add("fecha");       
             }
              if(request.getParameter("lugar").equals("")){//En el caso de que el campo lugar este vacio se añade al error                 
                 errores.add("lugar");
              }
              request.setAttribute("errores", errores);

               if(!errores.isEmpty()){//Si hay errores en el array significa que hay campos vacios por lo que iremos al jsp de campos vacios
                   
                   request.getRequestDispatcher("/JSP/errorvacio.jsp").forward(request, response);  
               }
              
               if(tiene_numeros(request.getParameter("lugar"))){//Si el campo lugar tiene numeros daremos el error de que tiene numeros
                  request.getRequestDispatcher("/JSP/errorNumeros.jsp").forward(request, response);  
                  System.out.println("Estamos asquiiiii"+request.getParameter("lugar"));
               }
               if(tiene_numeros(request.getParameter("especie"))){//Si el campo especie tiene numeros daremos el error de que tiene numeros
                   request.getRequestDispatcher("/JSP/errorNumeros.jsp").forward(request, response);  
               }
              
            
//Si no hay errores pues añadiria el ave en la base de datos
        try (PrintWriter out = response.getWriter()) {
          
            
            String sql = null;
            sql = "insert into aves values ('"+request.getParameter("anilla")+"', '"+request.getParameter("especie")+"', '"+request.getParameter("fecha")+"', '"+request.getParameter("lugar")+"');";

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

            
            } catch (SQLException exc) {
                System.out.println("Error al crear la conexión");
                exc.printStackTrace();
                request.getRequestDispatcher("/JSP/error.jsp").forward(request, response);
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
            request.setAttribute("mensaje", "Se se ha creado el ave.. "+request.getParameter("especie"));
            
            request.getRequestDispatcher("JSP/index.jsp").forward(request, response);

            
        }
    }
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
   
    
    
   public boolean tiene_numeros(String texto){
   String numeros="0123456789";
   
   for(int i=0; i<texto.length(); i++){
      if (numeros.indexOf(texto.charAt(i),0)!=-1){
         return true;
      }
   }
   return false;
}      


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
