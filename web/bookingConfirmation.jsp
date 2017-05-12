<%-- 
    Document   : scotiabookingconfirmation
    Created on : 12-Nov-2010, 12:36:06
    Author     : James Chalmers
    Iteration  : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    String customerID = request.getParameter("customerID");
    String routeID = request.getParameter("routeID");
    String sailingDate = request.getParameter("sailingDate");
    String noAdults = request.getParameter("noAdults");
    String noChildren = request.getParameter("noChildren");
    String otherInfo = request.getParameter("otherinfo");
    //String loginName = request.getParameter("loginName");
    //String loginPasswd = request.getParameter("loginPasswd");

    session.setAttribute("customerID", customerID);
    session.setAttribute("routeID", routeID);
    session.setAttribute("sailingDate", sailingDate);
    session.setAttribute("noAdults", noAdults);
    session.setAttribute("noChildren", noChildren);
    session.setAttribute("otherinfo", otherInfo);
    //session.setAttribute("loginName", loginName);
    //session.setAttribute("loginPasswd", loginPasswd);
%>

<%@include file="/includes/header1.jsp" %>

<div class="box"><h2>Booking Confirmation</h2><br />
    <div id="printconfirmslip">
        <h3>Thankyou. Your Booking has been made</h3>
        <p>Your booking details are as follows:</p>
        <p>Booking number is: <%= request.getAttribute("bookingID")%></p>
        <p>Customer registration number is: <%= session.getAttribute("customerID")%></p>
        <p>Cruise Route No: <%= session.getAttribute("routeID")%></p>
        <p>Sailing Date: <%= session.getAttribute("sailingDate")%></p>
        <p>No of Adults: <%= session.getAttribute("noAdults")%></p>
        <p>No of Children: <%= session.getAttribute("noChildren")%></p>
        <p>Total Cost is: £<%= request.getAttribute("totalCost")%> <input type=button value="Buy Ticket" onclick="" /></p>
        <p>Other Information: <%= session.getAttribute("otherinfo")%></p><br />

        <table cellspacing="6" border="0" id="table" class="" >
            <tr>
                <td align="left"><p>Print confirmation slip:</p></td>
                <td><input type="reset" value="print" name="submit" style="width:75px" onclick="window.print()" /></td>
            </tr>
            <!--    <tr>
        
                    <td align="left"><p>Back to previous page:</p></td>
                    <td><input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" /></td>
        
                </tr>
            -->
        </table>
        <!--  <table cellspacing="6" border="0" id="table" class="" >
              <tr>
                   <form name="custidfilter" action="CustomerServlet">
                          <td align="left" ><p>View booking(s):</p></td>
                          <td><input type="submit" value="show" name="submit" style="width:75px" onclick=""/></td>
                          <td><input type="hidden" name="customerID"  value="" /></td>
                   </form>
              </tr>
          </table>-->
    </div>
</div>

<%@include file="/includes/footer.jsp" %>          

