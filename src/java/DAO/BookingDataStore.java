/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BookingBean;

/**
 * <p>
 * This class is a Booking Data Store for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class BookingDataStore implements Serializable {

    private static final long serialVersionUID = -8907322672774027642L;

    public void createRecord(BookingBean booking) {

        Connection myConnection = getConnection();

        try {
            try (PreparedStatement create = (PreparedStatement) myConnection.prepareStatement("INSERT INTO booking VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
                create.setInt(1, booking.getBookingID());
                create.setInt(2, booking.getCustomerID());
                create.setInt(3, booking.getRouteID());

                java.util.Date utilDate = booking.getSailingDate();
                java.sql.Date sqlDate;
                sqlDate = new java.sql.Date(utilDate.getTime());
                create.setDate(4, sqlDate);

                create.setInt(5, booking.getNoAdults());
                create.setInt(6, booking.getNoChildren());
                create.setString(7, booking.getOtherinfo());
                create.setDouble(8, booking.getTotalCost());
                create.setBoolean(9, booking.isPaymentReceived());

                create.executeUpdate();
            }

            myConnection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to create record: [" + sqle.getErrorCode() + "]" + sqle.getMessage());
        }
    }

    private Connection getConnection() {//IDENTICAL TO METHOD IN CUSTDATASTORE
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException cnfe) {
            System.err.println("Database driver not found: " + cnfe.getMessage());
        }

        String dbUrl = "jdbc:mysql://localhost:3306/dwba_assessmentV5";
        String dbUser = "root";
        String dbPass = "stcallans";
        Connection connection = null;

        try {
            connection = (Connection) DriverManager.getConnection(dbUrl, dbUser, dbPass);
        } catch (SQLException sqle) {
            System.err.println("Unable to connect to Database: [" + sqle.getErrorCode() + "]" + sqle.getMessage());
        }
        return (connection);
    }

    public BookingBean getRecord(int id) {
        BookingBean bb = null;
        Connection connection = getConnection();
        try {
            try (PreparedStatement get = (PreparedStatement) connection.prepareStatement("SELECT * FROM booking WHERE idBooking=?")) {
                get.setInt(1, id);

                ResultSet results = get.executeQuery();

                while (results.next()) {

                    bb = new BookingBean(
                            results.getInt("idBooking"),
                            results.getInt("idCustomer"),
                            results.getInt("idRoute"),
                            results.getDate("sailing_date"),
                            results.getInt("no_of_adults"),
                            results.getInt("no_of_children"),
                            results.getString("otherinfo"),
                            results.getDouble("total_cost"),
                            results.getBoolean("payment_received"));
                }
            }

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to find Record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
        return (bb);
    }

    public void removeRecord(int id) {

        Connection connection = getConnection();

        try {
            try (PreparedStatement remove = connection.prepareStatement(
                    "DELETE FROM booking WHERE idBooking=?") //1
                    ) {
                remove.setInt(1, id);

                remove.executeUpdate();
            }

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to remove record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
    }

    public void updateRecord(BookingBean booking) {
        Connection connection = getConnection();

        try {
            try (PreparedStatement update = (PreparedStatement) connection.prepareStatement(
                    "UPDATE booking SET "
                    + "idCustomer=?, "
                    + "idRoute=?, "
                    + "sailing_date=?, "
                    + "no_of_adults=?, "
                    + "no_of_children=?, "
                    + "otherinfo=?, "
                    + "total_cost=?, "
                    + "payment_received=?, "
                    + "WHERE idBooking=?")) {
                update.setInt(1, booking.getCustomerID());
                update.setInt(2, booking.getRouteID());
                java.util.Date utilDate = booking.getSailingDate();
                java.sql.Date sqlDate;
                sqlDate = new java.sql.Date(utilDate.getTime());
                update.setDate(3, sqlDate);
                update.setInt(4, booking.getNoAdults());
                update.setInt(5, booking.getNoChildren());
                update.setString(6, booking.getOtherinfo());
                update.setDouble(7, booking.getTotalCost());
                update.setBoolean(8, booking.isPaymentReceived());

                update.setInt(9, booking.getBookingID());

                update.executeUpdate();
            }

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to update record: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
    }

    public List<BookingBean> getAllRecords() {

        Connection connection = getConnection();
        List<BookingBean> allBookings = new ArrayList<>();

        try {
            try (PreparedStatement get = (PreparedStatement) connection.prepareStatement(
                    "SELECT * FROM booking")) {
                ResultSet results = get.executeQuery();

                BookingBean resultBean = null;

                while (results.next()) {

                    resultBean = new BookingBean(
                            results.getInt("idBooking"),
                            results.getInt("idCustomer"),
                            results.getInt("idRoute"),
                            results.getDate("sailing_date"),
                            results.getInt("no_of_adults"),
                            results.getInt("no_of_children"),
                            results.getString("otherinfo"),
                            results.getDouble("total_cost"),
                            results.getBoolean("payment_received"));

                    allBookings.add(resultBean);
                }
            }

            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Unable to get all records: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
        }
        return (allBookings);
    }

//    public Vector<BookingBean> getAllRecords() {
//
//        Connection connection = getConnection();
//        Vector<BookingBean> allBookings = new Vector<BookingBean>();
//
//        try {
//            try (PreparedStatement get = (PreparedStatement) connection.prepareStatement(
//                    "SELECT * FROM booking")) {
//                ResultSet results = get.executeQuery();
//
//                BookingBean resultBean = null;
//
//                while (results.next()) {
//
//                    resultBean = new BookingBean(
//                            results.getInt("idBooking"),
//                            results.getInt("idCustomer"),
//                            results.getInt("idRoute"),
//                            results.getDate("sailing_date"),
//                            results.getInt("no_of_adults"),
//                            results.getInt("no_of_children"),
//                            results.getString("otherinfo"),
//                            results.getDouble("total_cost"),
//                            results.getBoolean("payment_received"));
//
//                    allBookings.addElement(resultBean);
//                }
//            }
//
//            connection.close();
//        } catch (SQLException sqle) {
//            System.err.println("Unable to get all records: [" + sqle.getErrorCode() + "] " + sqle.getMessage());
//        }
//        return (allBookings);
//    }
}
