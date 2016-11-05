package es.albarregas;

import es.albarregas.modelo.Ave;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;

import javax.sql.DataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Acceso", urlPatterns = {"/acceso"})
public class AccesoBD extends HttpServlet {
    DataSource datasource = null;

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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Bases da datos!!");
        out.println("estamos en el acceso a la base de datos");

        Connection conexion = null;
        Statement sentencia = null;
        PreparedStatement preparada = null;
        ResultSet resultado = null;
        Ave ave = null;
        List<Ave> listado = null;
         try {
        conexion = datasource.getConnection();




        } catch (SQLException ex) {
            System.out.println("Error al cargar el Driver");
            ex.printStackTrace();
        }

        //String anilla = request.getParameter("anilla");
        String sql = null;
        String url = null;
       try {


            HttpSession session = null;
            session = request.getSession(true);
                if (!request.getParameter("menu").equals("Crear")) {
                    out.println("estamos aqui");
                    sql = "select * from aves";
                }
                if (url == null) {
                    sentencia = conexion.createStatement();
                    resultado = sentencia.executeQuery(sql);
                    listado = new ArrayList();
                    url = "JSP/ModificarBorrarEliminar.jsp";

                    while (resultado.next()) {

                        ave = new Ave();
                        ave.setAnilla(resultado.getString("anilla"));
                        ave.setEspecie(resultado.getString("especie"));
                        ave.setLugar(resultado.getString("lugar"));
                        ave.setFecha(resultado.getString("fecha"));
                        listado.add(ave);
                    }
// POR QUÉ LLEVAS EL LISTADO A LA PETICIÓN Y A LA SESIÓN
                    request.setAttribute("lista", listado);
                    session.setAttribute("listadoaves", listado);

                }
// si hemos pulsado el boton de editar
// obtenemos los datos de la sesion con request.getSession().getAtributte("listadoaves")
// guardamos en la base de datos los datos de la sesion

// si hemos pulsado en borrar


            //out.println("Bueno pues aqui estamos");
            request.getRequestDispatcher(url).forward(request, response);
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
            try {
                if (resultado != null) {
                    resultado.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
       }
    }
}
