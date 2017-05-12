/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>This class is a Booking Bean for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class BookingBean implements Serializable {

    private static final long serialVersionUID = -7254034302454211965L;

    private int bookingID;
    private int customerID;
    private int routeID;
    private Date sdfSailingDate;
    private int noAdults;
    private int noChildren;
    private String otherinfo;
    private double totalCost;
    private boolean paymentReceived;

    /*
     * Constructors:
     */
    public BookingBean(int bookingID, int customerID, int routeID, Date sdfSailingDate, int noAdults, int noChildren, String otherinfo, double totalCost, boolean paymentReceived) {
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.routeID = routeID;
        this.sdfSailingDate = sdfSailingDate;
        this.noAdults = noAdults;
        this.noChildren = noChildren;
        this.otherinfo = otherinfo;
        this.totalCost = totalCost;
        this.paymentReceived = paymentReceived;
    }

    /*
     * Getter methods:
     */
    public int getBookingID() {
        return bookingID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public int getRouteID() {
        return routeID;
    }

    public Date getSailingDate() {
        return sdfSailingDate;
    }

    public int getNoAdults() {
        return noAdults;
    }

    public int getNoChildren() {
        return noChildren;
    }

    public String getOtherinfo() {
        return otherinfo;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public boolean isPaymentReceived() {
        return paymentReceived;
    }


    /*
     * Setter methods:
     */
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setRouteID(int routeID) {
        this.routeID = routeID;
    }

    public void setSailingDate(Date sdfSailingDate) {
        this.sdfSailingDate = sdfSailingDate;
    }

    public void setNoAdults(int noAdults) {
        this.noAdults = noAdults;
    }

    public void setNoChildren(int noChildren) {
        this.noChildren = noChildren;
    }

    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public void setPaymentReceived(boolean paymentReceived) {
        this.paymentReceived = paymentReceived;
    }


    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final BookingBean other = (BookingBean) obj;
        if (this.bookingID != other.bookingID) {
            return false;
        }
        if (this.customerID != other.customerID) {
            return false;
        }
        if (this.routeID != other.routeID) {
            return false;
        }
        if ((this.sdfSailingDate == null) ? (other.sdfSailingDate != null) : !this.sdfSailingDate.equals(other.sdfSailingDate)) {
            return false;
        }
        if (this.noAdults != other.noAdults) {
            return false;
        }
        if (this.noChildren != other.noChildren) {
            return false;
        }
        if ((this.otherinfo == null) ? (other.otherinfo != null) : !this.otherinfo.equals(other.otherinfo)) {
            return false;
        }
        if (this.totalCost != other.totalCost) {
            return false;
        }
        if (this.paymentReceived != other.paymentReceived) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + this.bookingID;
        hash = 41 * hash + this.customerID;
        hash = 41 * hash + this.routeID;
        hash = 41 * hash + (this.sdfSailingDate != null ? this.sdfSailingDate.hashCode() : 0);
        hash = 41 * hash + this.noAdults;
        hash = 41 * hash + this.noChildren;
        hash = 41 * hash + (this.otherinfo != null ? this.otherinfo.hashCode() : 0);
        hash = 41 * hash + (int) (Double.doubleToLongBits(this.totalCost) ^ (Double.doubleToLongBits(this.totalCost) >>> 32));
        hash = 41 * hash + (this.paymentReceived ? 1 : 0);
        return hash;
    }

    @Override
    public String toString() {
        StringBuilder toStringBuilder = new StringBuilder("Booking details:\n");
        toStringBuilder.append("\nbookingID: ");
        toStringBuilder.append(bookingID);
        toStringBuilder.append("\ncustomerID: ");
        toStringBuilder.append(customerID);
        toStringBuilder.append("\nrouteID: ");
        toStringBuilder.append(routeID);
        toStringBuilder.append("\nsailingDate: ");
        toStringBuilder.append(sdfSailingDate);
        toStringBuilder.append("\nnoAdults: ");
        toStringBuilder.append(noAdults);
        toStringBuilder.append("\nnoChildren: ");
        toStringBuilder.append(noChildren);
        toStringBuilder.append("\notherinfo: ");
        toStringBuilder.append(otherinfo);
        toStringBuilder.append("\ntotalCost: ");
        toStringBuilder.append(totalCost);
        toStringBuilder.append("\npaymentReceived: ");
        toStringBuilder.append(paymentReceived);
        return toStringBuilder.toString();
    }
}
