/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CustomerBean;

/**
 * <p>This class is a Customer Data Store for the Scotia Cruises Web Application</p>
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class CustomerDataStore implements Serializable {

    private static final long serialVersionUID = 7922010499695099912L;

    public void createRecord(CustomerBean customer) {

        Connection connection = DBConnectionInfo.getConnection();

        try {
            PreparedStatement create = (PreparedStatement) connection.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            create.setInt(1, customer.getCustomerID());
            create.setString(2, customer.getFirstname());
            create.setString(3, customer.getSurname());
            create.setString(4, customer.getContactNo());
            create.setString(5, customer.getEmailAddress());
            create.setString(6, customer.getLoginName());
            create.setString(7, customer.getLoginPasswd());
            create.setString(8, customer.getCountryOrig());

            create.executeUpdate();

            create.close();

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to create record: [" + sqle.getErrorCode() + "]" + sqle.getMessage());
        }
    }

//    private Connection getConnection() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//
//        } catch (ClassNotFoundException cnfe) {
//            System.err.println("Database driver not found: " + cnfe.getMessage());
//        }
//
//        String dbUrl = "jdbc:mysql://localhost:3306/dwba_assessmentV5";
//        String dbUser = "root";
//        String dbPass = "stcallans";
//        Connection connection = null;
//
//        try {
//            connection = (Connection) DriverManager.getConnection(dbUrl, dbUser, dbPass);
//        } catch (SQLException sqle) {
//            System.err.println("Unable to connect to Database: [" + sqle.getErrorCode() + "]" + sqle.getMessage());
//        }
//        return (connection);
//    }

    public CustomerBean getRecord(int id) {
        CustomerBean customerBean = null;
        Connection connection = DBConnectionInfo.getConnection();
        try {
            PreparedStatement get = (PreparedStatement) connection.prepareStatement("SELECT * FROM customer WHERE idCustomer=?");

            get.setInt(1, id);

            ResultSet results = get.executeQuery();

            while (results.next()) {
                customerBean = new CustomerBean(
                        results.getInt("idCustomer"),
                        results.getString("firstname"),
                        results.getString("surname"),
                        results.getString("contact_no"),
                        results.getString("emailaddress"),
                        results.getString("loginname"),
                        results.getString("loginpassword"),
                        results.getString("country_of_origin"));
            }

            get.close();

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to find Record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
        return (customerBean);
    }

    public void updateRecord(CustomerBean customer) {
        Connection connection = DBConnectionInfo.getConnection();

        try {
            PreparedStatement update = (PreparedStatement) connection.prepareStatement(
                    "UPDATE customer SET "
                    + "firstname=?, "
                    + "surname=?, "
                    + "contact_no=?, "
                    + "emailaddress=?, "
                    + "loginname=?, "
                    + "loginpassword=?, "
                    + "country_of_origin=? "
                    + "WHERE idCustomer=?");
            update.setInt(1, customer.getCustomerID());
            update.setString(2, customer.getFirstname());
            update.setString(3, customer.getSurname());
            update.setString(4, customer.getContactNo());
            update.setString(5, customer.getEmailAddress());
            update.setString(6, customer.getLoginName());
            update.setString(7, customer.getLoginPasswd());
            update.setString(8, customer.getCountryOrig());

            update.executeUpdate();

            update.close();

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to update record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
    }

    public void removeRecord(int id) {

        Connection connection = DBConnectionInfo.getConnection();

        try {
            PreparedStatement remove = connection.prepareStatement(
                    "DELETE FROM customer WHERE idCustomer=?");	//1

            remove.setInt(1, id);

            remove.executeUpdate();

            remove.close();

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to remove record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
    }

    public List<CustomerBean> getAllRecords() {

        Connection connection = DBConnectionInfo.getConnection();
        List<CustomerBean> allCustomers = new ArrayList<>();

        try {
            PreparedStatement get = (PreparedStatement) connection.prepareStatement(
                    "SELECT * FROM customer");

            ResultSet results = get.executeQuery();
            CustomerBean resultBean = null;
            while (results.next()) {
                resultBean = new CustomerBean(
                        results.getInt("idCustomer"),
                        results.getString("firstname"),
                        results.getString("surname"),
                        results.getString("contact_no"),
                        results.getString("emailaddress"),
                        results.getString("loginname"),
                        results.getString("loginpassword"),
                        results.getString("country_of_origin"));

                allCustomers.add(resultBean);
            }

            get.close();
            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to get all records: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
        return (allCustomers);
    }
    

}

