<%-- 
    Document   : scotiaregconfirmation
    Created on : 12-Nov-2010
    Author     : James Chalmers
    Iteration  : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CustomerBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@include file="/includes/header1.jsp" %>

<%
            String customerID = request.getParameter("customerID");
            String firstname = request.getParameter("firstname");
            String surname = request.getParameter("surname");
            String contactNo = request.getParameter("contactNo");
            String emailAddress = request.getParameter("emailAddress");
            String loginName = request.getParameter("loginName");
            String loginPasswd = request.getParameter("loginPasswd");

            session.setAttribute("customerID", customerID);
            session.setAttribute("firstname", firstname);
            session.setAttribute("surname", surname);
            session.setAttribute("contactNo", contactNo);
            session.setAttribute("emailAddress", emailAddress);
            session.setAttribute("loginName", loginName);
            session.setAttribute("loginPasswd", loginPasswd);
%>

<div class="box"><h2>Registration Confirmation</h2><br /><!-- ***ADDS THE REG TWICE IF PRESS REFRESH BUTTON*** -->
    <h3>Thankyou. Your details have been registered</h3>
    <p>Your registration details are as follows:</p>
    <p>Customer registration number is <%= request.getAttribute("customerID")%></p>
    <p>Name: <%= session.getAttribute("firstname")%> <%= session.getAttribute("surname")%></p>
    <p>Contact number is <%= session.getAttribute("contactNo")%></p>
    <p>Email address <%= session.getAttribute("emailAddress")%></p>
    <p>Username is <%= session.getAttribute("loginName")%></p>
    <p>Password is <%= session.getAttribute("loginPasswd")%></p><br />
   <!--  <p>Country of origin is <%= session.getAttribute("countryOrig")%></p><br />comment out -->
    <!-- UNCOMMENT TO USE HTML BELOW -->
    <form name="gotobooking" action="BookingServlet" method="POST">
        <input type="submit" name="submit"      value="book"  style="width:75px"/><!-- UNCOMMENT TO USE HTML BELOW -->
        <input type="reset"  name="submit"      value="print" style="width:75px" onclick="window.print()" />
        <input type="hidden" name="customerID"  value="<%=session.getAttribute("customerID")%>"  /><!--  -->
        <input type="hidden" name="firstname"   value="<%=session.getAttribute("firstname")%>"   /><!--  -->
        <input type="hidden" name="surname"     value="<%=session.getAttribute("surname")%>"     /><!--  -->
        <input type="hidden" name="loginName"   value="<%=session.getAttribute("loginName")%>"   /><!--  -->
        <input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" /><!--  -->
    </form>
    <table cellspacing="8" border="0">
        <tr>
            <td width="600" valign="top" colspan="2">
                <p>To view your registration details, enter e-mail address below:</p><br />
                <form name="emailfilter" action="CustomerServlet" autocomplete="off" >
                    <input type="text"   value=""            name="emailAddress" size=""/>
                    <input type="submit" value="enter email" name="submit" style="width:75px" />
                </form><br />
            </td>
        </tr>
        <tr>
            <!--<td>
                 UNCOMMENT HTML WITH THIS
                <input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" />
            </td> -->
        </tr>
    </table>
</div>
<%@include file="/includes/footer.jsp" %>                      

