/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * EXPERIMENTAL, NOT BEING USED.
 *
 * @author james
 */
public class SailingBean implements Serializable {

    private static final long serialVersionUID = 5891863184106201767L;

    private int SailingID;
    private List<BookingBean> bookingList = new ArrayList<>();
    private int routeID;
    private Date sailingDate;
    private int passengerCount;

    public SailingBean(int routeID, Date sailingDate) {
        bookingList = new ArrayList<>();
        this.routeID = routeID;
        this.sailingDate = sailingDate;
        passengerCount = 0;
    }

    public int getSailingID() {
        return SailingID;
    }

    public void setSailingID(int SailingID) {
        this.SailingID = SailingID;
    }

    public List<BookingBean> getBookingList() {
        return bookingList;
    }

    public void setBookingList(List<BookingBean> bookingList) {
        this.bookingList = bookingList;
    }

    public int getRoute() {
        return routeID;
    }

    public void setRoute(int route) {
        this.routeID = route;
    }

    public Date getSailingDate() {
        return sailingDate;
    }

    public void setSailingDate(Date sailingDate) {
        this.sailingDate = sailingDate;
    }

    public int getPassengerCount() {
        return passengerCount;
    }

    public void setPassengerCount(int passengerCount) {
        this.passengerCount = passengerCount;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + this.SailingID;
        hash = 79 * hash + Objects.hashCode(this.bookingList);
        hash = 79 * hash + Objects.hashCode(this.routeID);
        hash = 79 * hash + Objects.hashCode(this.sailingDate);
        hash = 79 * hash + this.passengerCount;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final SailingBean other = (SailingBean) obj;
        if (this.SailingID != other.SailingID) {
            return false;
        }
        if (this.passengerCount != other.passengerCount) {
            return false;
        }
        if (!Objects.equals(this.bookingList, other.bookingList)) {
            return false;
        }
        if (this.routeID != other.routeID) {
            return false;
        }
        if (!Objects.equals(this.sailingDate, other.sailingDate)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "SailingBean{" + "SailingID=" + SailingID + ", bookingList=" + bookingList + ", route=" + routeID + ", sailingDate=" + sailingDate + ", passengerCount=" + passengerCount + '}';
    }

}
