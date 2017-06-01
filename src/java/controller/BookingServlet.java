/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookingBean;
import model.BookingManager;
import model.RouteEnum;

/**
 *
 * <p>
 * This class is a Booking Servlet for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers
 * @version 5.0
 */
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = -3454453301341406861L;

    BookingManager bookingManager;

    @Override
    public void init() throws ServletException {
        bookingManager = new BookingManager();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        String url = "/index.jsp";
        int routeID = 0;
        Date sdfSailingDate = null;
        int passengerTotal = 0;
        int bookingTotal = 0;

        String submit = request.getParameter("submit");
        if (submit != null && submit.length() > 0) {
            if (submit.equals("add booking")) {

                int customerID = Integer.parseInt(request.getParameter("customerID").trim());
                routeID = Integer.parseInt(request.getParameter("routeID").trim());
                String sailingDate = request.getParameter("sailingDate").trim();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                sdfSailingDate = formatter.parse(sailingDate);
                int noAdults = Integer.parseInt(request.getParameter("noAdults").trim());
                int noChildren = Integer.parseInt(request.getParameter("noChildren").trim());
                String otherinfo = request.getParameter("otherinfo").trim();
                double totalCost = 0.0;
                boolean paymentReceived = false;
                Date today = new Date();
                Date nextWeek = new Date(today.getTime() + (1000 * 60 * 60 * 24 * 7));

                passengerTotal = bookingManager.getPassengerTotal(routeID, sdfSailingDate);
                bookingTotal = noAdults + noChildren;
                if (passengerTotal + bookingTotal < 12) {
                    if (sailingDate.equals("")) {
                        url = "/scotiavalidation.jsp";
                    } else if (sdfSailingDate.before(nextWeek)) {
                        url = "/scotiadatevalidation.jsp";
                    } else {
                        if (routeID == 322) {
                            totalCost = (noAdults * RouteEnum.ROUTE322.getAdultFare()) + (noChildren * RouteEnum.ROUTE322.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        } else if (routeID == 323) {
                            totalCost = (noAdults * RouteEnum.ROUTE323.getAdultFare()) + (noChildren * RouteEnum.ROUTE323.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        } else if (routeID == 324) {
                            totalCost = (noAdults * RouteEnum.ROUTE324.getAdultFare()) + (noChildren * RouteEnum.ROUTE324.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        }
                        bookingManager.addBooking(customerID, routeID, sdfSailingDate, noAdults, noChildren, otherinfo, totalCost, paymentReceived);
                        int bookingID = 0;
                        bookingID = bookingManager.getBookingIdByAdd(bookingID);
                        request.setAttribute("bookingID", bookingID);
                        url = "/bookingConfirmation.jsp";
                    }
                } else {
                    url = "/fullyBookedInfo.jsp";
                }

            } else if (submit.equals("book")) {
                url = "/addBooking.jsp";

            } else if (submit.equals("make booking")) {
                url = "/addBookingStaff.jsp";

            } else if (submit.equals("home")) {
                url = "/HomePage.jsp";

            } else if (submit.equals("show")) {
                int customerID = 0;
                try {
                    customerID = Integer.parseInt(request.getParameter("customerID"));
                } catch (NumberFormatException nfe) {
                    System.out.println("Error: " + nfe.getMessage());
                    url = "/scotiavalidation.jsp";
                }
                if (customerID == 0) {
                    url = "/scotiavalidation.jsp";
                } else {
                    request.setAttribute("bookingStore", bookingManager.getFilteredBookings(customerID));
                    url = "/displayBooking.jsp";
                }

            } else if (submit.equals("customer ID")) {
                int customerID = 0;
                try {
                    customerID = Integer.parseInt(request.getParameter("customerID"));
                } catch (NumberFormatException nfe) {
                    System.out.println("Error: " + nfe.getMessage());
                    url = "/scotiavalidation.jsp";
                }
                if (customerID == 0) {
                    url = "/scotiavalidation.jsp";
                } else {
                    request.setAttribute("bookingStore", bookingManager.getFilteredBookings(customerID));
                    url = "/displayAllBookings.jsp";
                }

            } else if (submit.equals("show sailing")) {
                routeID = 0;
                try {
                    routeID = Integer.parseInt(request.getParameter("routeID").trim());
                } catch (NumberFormatException nfe) {
                    System.out.println("Error: " + nfe.getMessage());
                    url = "/scotiavalidation.jsp";
                }
                String sailingDate = request.getParameter("sailingDate").trim();
                System.out.println(sailingDate);//FOR DEBUGGING
                if (sailingDate.isEmpty() || sailingDate.equals("")) {
                    url = "/scotiavalidation.jsp";
                } else {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    sdfSailingDate = formatter.parse(sailingDate);
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(sdfSailingDate);
                    cal.getTime();

                    request.setAttribute("bookingStore", bookingManager.getSailing(routeID, sdfSailingDate));
                    request.setAttribute("routeID", routeID);
                    request.setAttribute("sdfSailingDate", sdfSailingDate);
                    request.setAttribute("cal", formatter.format(cal.getTime()));
                    if (routeID == 322) {
                        String routeString = RouteEnum.ROUTE322.getRoute();
                        request.setAttribute("routeString", routeString);
                        LocalTime departure = RouteEnum.ROUTE322.getDepart();
                        LocalTime arrival = RouteEnum.ROUTE322.getArrive();
                        request.setAttribute("departure", departure);
                        request.setAttribute("arrival", arrival);
                    } else if (routeID == 323) {
                        String routeString = RouteEnum.ROUTE323.getRoute();
                        request.setAttribute("routeString", routeString);
                        LocalTime departure = RouteEnum.ROUTE323.getDepart();
                        LocalTime arrival = RouteEnum.ROUTE323.getArrive();
                        request.setAttribute("departure", departure);
                        request.setAttribute("arrival", arrival);
                    } else if (routeID == 324) {
                        String routeString = RouteEnum.ROUTE324.getRoute();
                        request.setAttribute("routeString", routeString);
                        LocalTime departure = RouteEnum.ROUTE324.getDepart();
                        LocalTime arrival = RouteEnum.ROUTE324.getArrive();
                        request.setAttribute("departure", departure);
                        request.setAttribute("arrival", arrival);
                    }
                    String msg;
                    passengerTotal = bookingManager.getPassengerTotal(routeID, sdfSailingDate);
                    if (passengerTotal >= 12) {
                        msg = "The cruise is fully booked. Please choose another date.";
                        request.setAttribute("msg", msg);
                    }
                    request.setAttribute("passengerTotal", passengerTotal);
                    if (request.getSession(false).getAttribute("loginName").equals("admin") && request.getSession(false).getAttribute("loginPasswd").equals("admin")) {
                        url = "/displaySailingStaff.jsp";
                    } else {
                        url = "/displaySailing.jsp";
                    }
                }

            } else if (submit.equals("show all")) {
                String filter = request.getParameter("filter");
                if (filter == null || filter.length() < 1) {
                    request.setAttribute("bookingStore", bookingManager.getAllBookings());
                } else { //DON'T NEED CODE HERE
                    //request.setAttribute("bookingStore", bookingManager.getFilteredBookings(filter));//NOT YET IMPLEMENTED
                }
                url = "/displayAllBookings.jsp";

            } else if (submit.equals("change")) {
                int id = Integer.parseInt(request.getParameter("id"));
                BookingBean booking = bookingManager.getBooking(id);
                request.setAttribute("booking", booking);
                url = "/updateBooking.jsp";

            } else if (submit.equals("update")) {
                int bookingID = Integer.parseInt(request.getParameter("bookingID").trim());
                int customerID = Integer.parseInt(request.getParameter("customerID").trim());
                routeID = Integer.parseInt(request.getParameter("routeID").trim());
                String sailingDate = request.getParameter("sailingDate").trim();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                sdfSailingDate = formatter.parse(sailingDate);
                int noAdults = Integer.parseInt(request.getParameter("noAdults").trim());
                int noChildren = Integer.parseInt(request.getParameter("noChildren").trim());
                String otherinfo = request.getParameter("otherinfo");
                double totalCost = Double.parseDouble(request.getParameter("totalCost").trim());
                boolean paymentReceived = Boolean.parseBoolean(request.getParameter("paymentReceived"));
                Date today = new Date();
                Date nextWeek = new Date(today.getTime() + (1000 * 60 * 60 * 24 * 7));

                passengerTotal = bookingManager.getPassengerTotal(routeID, sdfSailingDate);
                bookingTotal = noAdults + noChildren;
                if (passengerTotal + bookingTotal < 12) {
                    if (sailingDate.equals("")) {
                        url = "/scotiavalidation.jsp";
                    } else if (sdfSailingDate.before(nextWeek)) {
                        url = "/scotiadatevalidation.jsp";
                    } else {
                        if (routeID == 322) {
                            totalCost = (noAdults * RouteEnum.ROUTE322.getAdultFare()) + (noChildren * RouteEnum.ROUTE322.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        } else if (routeID == 323) {
                            totalCost = (noAdults * RouteEnum.ROUTE323.getAdultFare()) + (noChildren * RouteEnum.ROUTE323.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        } else if (routeID == 324) {
                            totalCost = (noAdults * RouteEnum.ROUTE324.getAdultFare()) + (noChildren * RouteEnum.ROUTE324.getChildFare());
                            request.setAttribute("totalCost", totalCost);
                        }
                        bookingManager.updateBooking(bookingID, customerID, routeID, sdfSailingDate, noAdults, noChildren, otherinfo, totalCost, paymentReceived);
                        request.setAttribute("bookingStore", bookingManager.getAllBookings());
                        request.setAttribute("bookingID", bookingID);

                        url = "/bookingConfirmation.jsp";
                    }
                } else {
                    url = "/fullyBookedInfo.jsp";
                }

            } else if (submit.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                bookingManager.removeBooking(id);
                request.setAttribute("bookingStore", bookingManager.getAllBookings());
                url = "/deleteConfirmation.jsp";

            }
            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher(url);

            dispatcher.forward(request, response);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
