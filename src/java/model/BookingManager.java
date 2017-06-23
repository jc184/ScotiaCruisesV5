/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAO.BookingDataStore;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * <p>This class is a Booking Manager for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class BookingManager implements Serializable {

    private static final long serialVersionUID = -2373840580490289815L;

    BookingDataStore bookingStore;

    public BookingManager() {
        bookingStore = new BookingDataStore();
    }

    public void addBooking(int customerID, int routeID, Date sdfSailingDate, int noAdults, int noChildren, String otherinfo, double totalCost, boolean paymentReceived) {
        // 'Creates a unique ID then creates booking record'.
        for (int newId = 1; newId < Integer.MAX_VALUE; newId++) {
            if (bookingStore.getRecord(newId) == null) {
                BookingBean booking = new BookingBean(newId, customerID, routeID, sdfSailingDate, noAdults, noChildren, otherinfo, totalCost, paymentReceived);
                bookingStore.createRecord(booking);
                return;
            }
        }
    }

    public BookingBean updateBooking(int bookingID, int customerID, int routeID, Date sdfSailingDate, int noAdults, int noChildren, String otherinfo, double totalCost, boolean paymentReceived) {
        BookingBean newBooking = new BookingBean(bookingID, customerID, routeID, sdfSailingDate, noAdults, noChildren, otherinfo, totalCost, paymentReceived);
        bookingStore.removeRecord(bookingID);
        bookingStore.createRecord(newBooking);
        return newBooking;
    }

    public void removeBooking(int id) {
        bookingStore.removeRecord(id);
    }

    public List<BookingBean> getFilteredBookings(int customerID) {
        List<BookingBean> rtnList = new ArrayList<>();
        for (BookingBean booking : bookingStore.getAllRecords()) {
            if (booking.getCustomerID() == customerID) {
                rtnList.add(booking);
            }
        }
        return (rtnList);
    }

//    public Vector<BookingBean> getFilteredBookings(int CustomerID) {
//        Vector<BookingBean> rtnVector = new Vector<BookingBean>();
//        for (BookingBean booking : bookingStore.getAllRecords()) {
//            if (booking.getCustomerID() == CustomerID) {
//                rtnVector.add(booking);
//            }
//        }
//        return (rtnVector);
//    } 
    
    public int getPassengerTotal(int routeID, Date sdfSailingDate) {
        List<BookingBean> rtnList = new ArrayList<>();
        int passengerTotal = 0;
        for (BookingBean booking : bookingStore.getAllRecords()) {
            int bookingTotal = 0;
            if (booking.getRouteID() == routeID && booking.getSailingDate().equals(sdfSailingDate)) {
                bookingTotal = booking.getNoAdults() + booking.getNoChildren();
                rtnList.add(booking);
                for (BookingBean rtnList1 : rtnList) {
                    passengerTotal += bookingTotal;
                    bookingTotal = 0;
                }
            } 
        }
        return (passengerTotal);
    }
    

    public List<BookingBean> getSailing(int routeID, Date sdfSailingDate) {
        List<BookingBean> rtnList = new ArrayList<>();
        for (BookingBean booking : bookingStore.getAllRecords()) {
            if (booking.getRouteID() == routeID && booking.getSailingDate().equals(sdfSailingDate)) {
                rtnList.add(booking);
            }
        }
        return (rtnList);
    }

    public List<BookingBean> getAllBookings() {
        return bookingStore.getAllRecords();
    }

    public BookingBean getBooking(int id) {
        return bookingStore.getRecord(id);
    }

    public int getBookingIdByAdd(int bookingID) {
        bookingID = 0;
        for (BookingBean booking : bookingStore.getAllRecords()) {
            bookingID = booking.getBookingID();
        }
        return bookingID;
    }
}
