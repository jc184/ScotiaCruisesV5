<%-- 
    Document   : staffPage
    Created on : 27-Nov-2010, 12:07:05
    Author     : josefk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
    //String username = request.getParameter("username");
    //session.setAttribute("username", username);
%>
<!-- ACKNOWLEDGEMENTS
 * DatePickerControl.v.1.1.7
 * By Hugo Ortega_Hernandez - hugorteg _no_spam_ at gmail dot com
 * License: LGPL http://www.gnu.org/licenses/lgpl.html
 * (i.e., use this code as you wish, just keep it free)
 * Provided as is, without any warranty.
 * Feel free to use this code, but don't remove this disclaimer please.
-->
<%
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
%>
<html>
    <head>
        <title>Staff Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script type="text/javascript" src="scripts/sailingvalidation.js"></script>
            <script type="text/javascript" src="scripts/datepickercontrol.js"></script>
            <link type="text/css" rel="stylesheet" href="styles/datepickercontrol.css"/>
            <link type="text/css" rel="stylesheet" href="styles/content.css"/>
            <link type="text/css" rel="stylesheet"  href="styles/DWBA.css"/>
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">

            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>

            <div class="box">
                <form name="Form" action="CustomerServlet">
                    <h2>Staff Page</h2>
                    <noscript><p>This page is best viewed with JavaScript enabled.<br />
                            You can enabled it in Tools / Options in most browsers</p></noscript><br />
                    <h3>Welcome <%= session.getAttribute("loginName") %>.</h3>
                    <p>Here you can decide to view or update bookings, edit customer details, <br />
                        or view daily sailings.</p>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left" width="210px"><p>View all customers: </p></td>
                            <td><input type="submit" value="view all" name="submit" style="width:75px" /></td>
                        </tr>
                        <tr>
                            <td align="left" width="210px"><p>Back to login:</p></td>
                            <td><input type="submit" value="back" style="width:75px" /></td>
                        </tr>
                    </table>
                </form>
                <form name="form" action="BookingServlet">
                    <table cellspacing="8" border="0">  
                        <!-- UNCOMMENT HTML WITH THIS -->
                        <tr>
                            <td align="left"><p><label for="routeID">Cruise No:</label></p></td>
                            <td><select name="routeID" id="routeID" value="">
                                    <option selected></option>
                                    <option>322</option>
                                    <option>323</option>
                                    <option>324</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="sailingDate">Date of Travel (yyyy-mm-dd):</label></p></td>
                            <td><input type="text" name="sailingDate" id="sailingDate" value="" datepicker="true" datepicker_format="YYYY-MM-DD"/></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Show daily sailings:</p></td>
                            <td><input type="submit" value="show sailing" name="submit" style="width:100px" onclick="validate(this.form);return false;"/></td>
                        </tr>
                        <tr>
                            <td align="left"><p>View all current bookings:</p></td>
                            <td><input type="submit" value="show all" name="submit" style="width:75px" /></td>
                        </tr>
                    </table>  
                </form>
            </div>

            <%@include file="/includes/footer.jsp" %>
