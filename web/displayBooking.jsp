<%-- 
    Document   : displayBooking
    Created on : 30-Nov-2010, 18:20:43
    Author     : josefk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.BookingBean" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    //String loginName = request.getParameter("loginName");
    //String loginPasswd = request.getParameter("loginPasswd");
    //session.setAttribute("loginName", loginName);
    //session.setAttribute("loginPasswd", loginPasswd);
%>

<!-- ACKNOWLEDGEMENTS
    Document   : tinytablesorter
    Created on : 23-May-2009, 11:22:18
    Author     : Michael Leigeber
    Credits    : Michael Leigeber, http://www.leigeber.com/2009/03/table-sorter/
    Info       : "This script has been tested in all major browsers and is
                  available free of charge for both personal or commercial
                  projects under the creative commons license.."
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- UNCOMMENT HTML WITH THIS -->
        <link rel="stylesheet" type="text/css" href="styles/DWBA2.css"/>
        <link rel="stylesheet" type="text/css" href="styles/tinytablesorter.css"/>
        <title>All Bookings</title>
    </head>
    <body>
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>View your customer booking(s)</h2>
                <h3>Welcome <%= session.getAttribute("loginName")%></h3>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <p>You can add a new booking, edit or delete your booking by clicking on the buttons shown</p><br />
                <% ArrayList<BookingBean> bookingStore = (ArrayList<BookingBean>) request.getAttribute("bookingStore");%>
                <table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable">
                    <!-- UNCOMMENT HTML WITH THIS -->
                    <thead>
                        <tr>
                            <th><h3>Booking ID</h3></th>
                            <th><h3>Customer ID</h3></th>
                            <th><h3>Route ID</h3></th>
                            <th><h3>Sailing Date</h3></th>
                            <th><h3>No Adults</h3></th>
                            <th><h3>No Children</h3></th>
                            <th><h3>Other Info</h3></th>
                            <th><h3>Total Cost</h3></th>
                            <th><h3>Payment Received</h3></th>
                            <th><h3>Update</h3></th>
                            <th><h3>Delete</h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (BookingBean booking : bookingStore) {%>
                        <tr>
                            <td><%= booking.getBookingID()%></td>
                            <td><%= booking.getCustomerID()%></td>
                            <td><%= booking.getRouteID()%></td>
                            <td><%= booking.getSailingDate()%></td>
                            <td><%= booking.getNoAdults()%></td>
                            <td><%= booking.getNoChildren()%></td>
                            <td><%= booking.getOtherinfo()%></td>
                            <td><%= booking.getTotalCost()%></td>
                            <td><%= booking.isPaymentReceived()%></td>
                            <td><form name="updateBooking" action="BookingServlet">
                                    <input type="hidden" value="<%= booking.getBookingID()%>" name="id" />
                                    <input type="submit" value="change" name="submit" />
                                    <input type="hidden" name="loginName"  value="" /><!--    --></form></td>
                            <td><form name="deleteBooking" action="BookingServlet">
                                    <input type="hidden" value="<%= booking.getBookingID()%>" name="id" />
                                    <input type="submit" value="delete" name="submit" /></form></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <form name="goto" action="CustomerServlet">
                        <input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" />
                        <input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" />
                    </form>
                </table>
                <!-- TINYTABLESORTER JAVASCRIPT GOES HERE -->
                <br /><!-- UNCOMMENT HTML WITH THIS -->
                <script type="text/javascript" src="scripts/tinytablesorter.js"></script>
                <script type="text/javascript">
                    var sorter = new TINY.table.sorter("sorter");
                    sorter.head = "head";
                    sorter.asc = "asc";
                    sorter.desc = "desc";
                    sorter.even = "evenrow";
                    sorter.odd = "oddrow";
                    sorter.evensel = "evenselected";
                    sorter.oddsel = "oddselected";
                    sorter.paginate = true;
                    sorter.currentid = "currentpage";
                    sorter.limitid = "pagelimit";
                    sorter.init("table", 1);
                </script>
                <table cellspacing="6" border="0" id="table" class="" >
                    <!-- UNCOMMENT HTML WITH THIS -->
                    <form name="goto" action="BookingServlet">
                        <tr>
                            <td align="left"><p>Add a new booking:</p></td>
                            <td><input type="submit" value="book" name="submit" style="width:75px" onclick="" /></td>
                        </tr>
                    </form>
                    <tr>
                        <td><p>Back to previous page</p></td>
                        <td><input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" /></td>
                    </tr>
                </table>
            </div>

            <%@include file="/includes/footer.jsp" %>
