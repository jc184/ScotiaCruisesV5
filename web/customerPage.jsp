<%-- 
    Document   : customerPage
    Created on : 27-Nov-2010, 09:12:59
    Author     : josefk
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
    //String customerID = request.getParameter("customerID");
    //String loginName = request.getParameter("loginName");

    //session.setAttribute("customerID", customerID);
    //session.setAttribute("loginName", loginName);
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
        <title>Scotia Cruises</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <script type="text/javascript" src="scripts/datepickercontrol.js"></script>
        <script type="text/javascript" src="scripts/sailingvalidation.js"></script>
        <link type="text/css" rel="stylesheet" href="styles/datepickercontrol.css"/>
        <link type="text/css" rel="stylesheet" href="styles/content.css"/>
        <link rel="stylesheet" type="text/css" href="styles/DWBA3.css"/>
        <!-- UNCOMMENT HTML WITH THIS -->
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <%@include file="/includes/leftmenu.jsp" %>

            <div class="box">
                <h2>Customer Page</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript>
                <h3>Welcome <%= session.getAttribute("loginName")%></h3>
                <p>Here you can decide to add, view or update your bookings,<br/>
                    edit your customer details, or view daily sailings.</p>

                <form name="Form" action="BookingServlet">
                    <table cellspacing="8"  border="0">  
                        <tr>
                            <td align="left" width="210px"><p>Make a new booking: &nbsp;</p></td>
                            <td><input type="submit" name="submit"     value="book" style="width:75px"/></td>
                            <td><input type="hidden" name="loginName"  value="" /></td><!--    -->
                        </tr>
                    </table> 
                </form>
                <form name="custidfilter" action="BookingServlet">
                    <table cellspacing="8"  border="0"> 
                        <tr>
                            <td align="left" width="210px"><p>View booking(s):</p></td>
                            <td><input type="submit" value="show" name="submit" style="width:75px" onclick=""/></td>
                            <td><input type="hidden" name="customerID"  value="<%= session.getAttribute("customerID")%>" /></td>
                        </tr>   
                    </table> 
                </form>
                <form name="form" action="BookingServlet">
                    <table cellspacing="8"  border="0">
                        <!-- UNCOMMENT HTML WITH THIS -->
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
                            <td><input type="text" name="sailingDate" id="sailingDate" value="" datepicker="true" datepicker_format="YYYY-MM-DD"/></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Show daily sailings:</p></td>
                            <td><input type="submit" value="show sailing" name="submit" style="width:100px" onclick="validate(this.form);return false;"/></td>
                            <td><input type="hidden" name="loginName"  value="<%= session.getAttribute("loginName")%>" /></td><!--    -->
                        </tr>
                    </table>
                </form>
                <br />
                <form name="emailfilter" action="CustomerServlet"  autocomplete="off" >
                    <table cellspacing="8"  border="0">
                        <tr>
                            <td width="300" valign="top" colspan="2" ><p>To view your registration details, enter e-mail address:</p></td>
                            <td><input type="text"   value=""            name="emailAddress" size=""/></td>
                            <td><input type="submit" value="enter email" name="submit" style="width:85px" onclick="" /></td>
                        </tr>
                        <br />
                        <!--  -->
                        <tr>
                            <td align="left" width="210px"><p>Return to the home page:</p></td>
                            <td><input type="submit" value="home" name="submit" style="width:75px" /></td>
                        </tr>
                        <tr>
                            <td align="left" width="210px"><p>Back to login:</p></td>
                            <td><input type="submit" value="back"  style="width:75px" /></td>
                        </tr>
                    </table>
                </form>

            </div>
            <%@include file="/includes/footer.jsp" %>
