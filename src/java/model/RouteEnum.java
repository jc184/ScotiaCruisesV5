/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.time.LocalTime;

/**
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public enum RouteEnum implements Serializable {
    
    ROUTE322("Morar to Rum return", 20.0, 8.0, LocalTime.of(10, 00), LocalTime.of(19, 15)),
    ROUTE323("Morar to Muck return", 25.0, 12.0, LocalTime.of(9, 00), LocalTime.of(18, 45)),
    ROUTE324("Morar to Eigg return", 16.0, 6.0, LocalTime.of(11, 00), LocalTime.of(17, 45));

    String Route;
    double adultFare;
    double childFare;
    LocalTime depart;
    LocalTime arrive;

    public String getRoute() {
        return Route;
    }

    public double getAdultFare() {
        return adultFare;
    }

    public double getChildFare() {
        return childFare;
    }

    public LocalTime getDepart() {
        return depart;
    }

    public LocalTime getArrive() {
        return arrive;
    }

    private RouteEnum(String Route, double adultFare, double childFare, LocalTime depart, LocalTime arrive) {
        this.Route = Route;
        this.adultFare = adultFare;
        this.childFare = childFare;
        this.depart = depart;
        this.arrive = arrive;
    }
    
}
