/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>This class is a Login Servlet for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers
 * @version 5.0
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = -2258609697807094537L;

    
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    }

//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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
        /**
         * Takes user login details from index login form checks them against
         * entries in the database, and accepts or rejects the login on this
         * basis
         */
        Connection loginConnection = null;
        String dbUrl = "jdbc:mysql://lochoich.co86tkgbwzs5.eu-west-1.rds.amazonaws.com:3306/";
        String dbName = "dwba_assessmentv5";
        
//        String dbUrl = "jdbc:mysql://localhost:3306/";
//        String dbName = "dwba_assessmentV5";
        String driver = "com.mysql.jdbc.Driver";
        String dbUserName = "root";
        String dbPassword = "stcallans";

        //int customerID = 0;
        String loginName = "";
        String loginPasswd = "";
        String loginQuery = "";
        Statement loginStmt = null;
        ResultSet loginRslt = null;
        HttpSession session;
        session = request.getSession(true);

        try {
            Class.forName(driver).newInstance();
            loginConnection = DriverManager.getConnection(dbUrl + dbName, dbUserName, dbPassword);
            if (request.getParameter("loginName") != null && !request.getParameter("loginName").equals("")
                    && request.getParameter("loginPasswd") != null && !request.getParameter("loginPasswd").equals("") 
                  && !request.getParameter("loginName").equals("admin") && !request.getParameter("loginPasswd").equals("admin")) {
                loginName = request.getParameter("loginName");
                loginPasswd = request.getParameter("loginPasswd");
                loginQuery = "select idCustomer, loginName, loginPassword from customer where loginName='" + loginName + "' and loginPassword='" + loginPasswd + "'";
                loginStmt = loginConnection.createStatement();
                loginRslt = loginStmt.executeQuery(loginQuery);
                int count = 0;
                while (loginRslt.next()) {
                    session.setAttribute("loginName", loginRslt.getString(2));
                    session.setAttribute("customerID", loginRslt.getInt(1));
                    count++;
                }
                if (count > 0) {
                    response.sendRedirect("customerPage.jsp");
                } else {
                    response.sendRedirect("loginError.jsp");
                }
            } else if (request.getParameter("loginName").equals("admin") && request.getParameter("loginPasswd").equals("admin")) {
                session.setAttribute("loginName", "admin");
                session.setAttribute("loginPasswd", "admin");
                response.sendRedirect("staffPage.jsp");
            } else {
                response.sendRedirect("loginError.jsp");
            }

            loginConnection.close();
        } catch (IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        
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
