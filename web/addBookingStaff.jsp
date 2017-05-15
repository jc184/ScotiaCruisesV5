<%-- 
    Document   : addBookingStaff
    Created on : 30-Nov-2010, 13:57:25
    Author     : josefk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String customerID = request.getParameter("customerID");
            String firstname = request.getParameter("firstname");
            String surname = request.getParameter("surname");
            String loginName = request.getParameter("loginName");
            String loginPasswd = request.getParameter("loginPasswd");

            session.setAttribute("customerID", customerID);
            session.setAttribute("firstname", firstname);
            session.setAttribute("surname", surname);
            session.setAttribute("loginName", loginName);
            session.setAttribute("loginPasswd", loginPasswd);
%>

<!-- ACKNOWLEDGEMENTS
 * DatePickerControl.v.1.1.7
 * By Hugo Ortega_Hernandez - hugorteg _no_spam_ at gmail dot com
 * License: LGPL http://www.gnu.org/licenses/lgpl.html
 * (i.e., use this code as you wish, just keep it free)
 * Provided as is, without any warranty.
 * Feel free to use this code, but don't remove this disclaimer please.
-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Booking</title>
        <!-- JAVASCRIPT STOPPED WORKING -->
        <script type="text/javascript" src="scripts/datepickercontrol.js"></script>
        <script type="text/javascript" src="scripts/bookingvalidation.js"></script>
        <link type="text/css" rel="stylesheet" href="styles/datepickercontrol.css">
        <link type="text/css" rel="stylesheet" href="styles/content.css">
        <link rel="stylesheet" type="text/css" href="styles/DWBA.css"/>
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>Make a Cruise Booking</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <h3>Welcome.</h3>
                <p>Enter your details in the form below and click 'add booking' to make a booking.</p>
                <form name="addBookingForm" action="BookingServlet" method="POST">
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left"><p><label for="customerID">Customer No:</label></p></td>
                            <td><input type="text" name="customerID" id="customerID" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="routeID">Cruise No:</label></p></td>
                            <td><select name="routeID" id="routeID" value="">
                                    <option selected></option>
                                    <option>322</option>
                                    <option>323</option>
                                    <option>324</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="sailingDate">Date of Travel (yyyy-mm-dd):</label></p></td>
                            <td><input type="text" name="sailingDate" id="sailingDate" value="" datepicker="true" datepicker_format="YYYY-MM-DD"/>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="noAdults">No of Adults:</label></p></td>
                            <td><input type="text" name="noAdults" id="noAdults" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="noChildren">No of Children:</label></p></td>
                            <td><input type="text" name="noChildren" id="noChildren" value="" />
                        </tr>
                        <tr>
                            <td align="left"><p><label for="otherinfo">Other Information: eg. disabilities<br /></label></p></td>
                            <td><input type="text" name="otherinfo" id="otherinfo" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="totalCost">Total Cost:<br /></label></p></td>
                            <td><input type="text" name="totalCost" id="totalCost" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="paymentReceived">Payment Received:<br /></label></p></td>
                            <td><input type="text" name="paymentReceived" id="paymentReceived" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Note:</p></td>
                            <td><p>The maximum number of Adults and Children is 12</p></td>
                        </tr>
                        <tr>
                            <td><br /><p>Add a booking</p><input type="submit" value="add booking" name="submit" style="width:100px" onclick="validate(this.form);return false;" /></td>
                            <td><br /><p>View ALL bookings</p><input type="submit" value="show all" name="submit" style="width:100px" /></td>
                            <td><br /><input type="hidden" name="customerID" value="<%=session.getAttribute("customerID")%>" /></td>
                            <td><br /><input type="hidden" name="firstname" value="<%=session.getAttribute("firstname")%>" /></td>
                            <td><br /><input type="hidden" name="surname" value="<%=session.getAttribute("surname")%>" /></td>
                            <td><br /><input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" /></td>
                            <td><br /><input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" /></td>
                        </tr>
                    </table>
                </form></div>

            <%@include file="/includes/footer.jsp" %>

