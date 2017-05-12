<%-- 
    Document   : updateBooking
    Created on : 17-Nov-2010, 16:55:44
    Author     : josefk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.BookingBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    //String customerID = request.getParameter("customerID");
    //String firstname = request.getParameter("firstname");
    //String surname = request.getParameter("surname");
    //String loginPasswd = request.getParameter("loginPasswd");

    //session.setAttribute("customerID", customerID);
    //session.setAttribute("firstname", firstname);
    //session.setAttribute("surname", surname);
    //session.setAttribute("loginPasswd", loginPasswd);
%>
<html>
    <!-- ACKNOWLEDGEMENTS
    * DatePickerControl.v.1.1.7
    * By Hugo Ortega_Hernandez - hugorteg _no_spam_ at gmail dot com
    * License: LGPL http://www.gnu.org/licenses/lgpl.html
    * (i.e., use this code as you wish, just keep it free)
    * Provided as is, without any warranty.
    * Feel free to use this code, but don't remove this disclaimer please.
    -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Booking Page</title>
        <!--  -->
        <script type="text/javascript" src="scripts/datepickercontrol.js"></script>
        <script type="text/javascript" src="scripts/bookingvalidation.js"></script>
        <link type="text/css" rel="stylesheet" href="styles/datepickercontrol.css">
        <link type="text/css" rel="stylesheet" href="styles/content.css">
        <link type="text/css" rel="stylesheet" href="styles/DWBA.css"/>
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">

            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>

            <div class="box"><h2>Booking update page</h2>

                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <h3>Welcome <%= session.getAttribute("loginName")%></h3>
                <p>Enter your details in the form below and click 'update' to update your booking.</p>
                <form name="updateBookingForm" action="BookingServlet" method="POST">
                    <% BookingBean booking = (BookingBean) request.getAttribute("booking");%>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left"><p>Booking ID:</p></td>
                            <td><p name="bookingID" id="bookingID"><%= booking.getBookingID()%></p></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="customerID">Customer No:</label></p></td>
                            <td><p name="customerID" id="customerID"><%= booking.getCustomerID()%></p></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="routeID">Cruise No:</label></p></td>
                            <td><select name="routeID" id="routeID" value="<%= booking.getRouteID()%>">
                                    <option selected><%= booking.getRouteID()%></option>
                                    <option>322</option>
                                    <option>323</option>
                                    <option>324</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="sailingDate">Date of Travel (yyyy-mm-dd):</label></p></td>
                            <td><input type="text" name="sailingDate" id="sailingDate" value="<%= booking.getSailingDate()%>" datepicker="true" datepicker_format="YYYY-MM-DD"/>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="noAdults">No of Adults:</label></p></td>
                            <td><input type="text" name="noAdults" id="noAdults" value="<%= booking.getNoAdults()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="noChildren">No of Children:</label></p></td>
                            <td><input type="text" name="noChildren" id="noChildren" value="<%= booking.getNoChildren()%>" />
                        </tr>
                        <tr>
                            <td align="left"><p><label for="otherinfo">Other Information:<br />eg. disabilities</label></p></td>
                            <td><input type="text" name="otherinfo" id="otherinfo" value="<%= booking.getOtherinfo()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Total Cost:</p></td>
                            <td><p name="totalCost" id="totalCost"><%= booking.getTotalCost()%></p></td><!-- MAKE READ ONLY. SHOULD WORK -->
                        </tr>
                        <tr>
                            <td align="left"><p>Note:</p></td>
                            <td><p>The maximum number of Adults and Children is 30</p></td>
                        </tr>
                        <tr>
                            <td><br /><input type="hidden" name="bookingID" value="<%= booking.getBookingID()%>" /></td>
                            <td><br /><input type="submit" name="submit" value="update" style="width:75px" onclick="validate(this.form);return false;" /></td>
                            <!--  <td><br /><input type="submit" name="submit" value="show all"style="width:100px" /></td> -->
                            <td><br /><input type="hidden" name="customerID" value="<%= booking.getCustomerID()%>" /></td>
                            <td><br /><input type="hidden" name="firstname" value="<%=session.getAttribute("firstname")%>" /></td>
                            <td><br /><input type="hidden" name="surname" value="<%=session.getAttribute("surname")%>" /></td>
                            <td><br /><input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" /></td>
                            <td><br /><input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" /></td>
                        </tr>
                        <tr>
                            <td>
                                <!-- UNCOMMENT HTML WITH THIS -->
                                <input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" />
                            </td>
                        </tr>
                    </table>
                </form></div>

            <%@include file="/includes/footer.jsp" %>




