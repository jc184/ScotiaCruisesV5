<%-- 
    Document   : displaySailing
    Created on : 12-Nov-2010, 14:22:33
    Author     : James Chalmers
    Iteration  : 5.0
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


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- UNCOMMENT HTML WITH THIS -->
        <link rel="stylesheet" type="text/css" href="styles/DWBA2.css"/> 
        <link rel="stylesheet" type="text/css" href="styles/tinytablesorter.css"/>
        <title>Display Sailing</title>
    </head>
    <body>
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>Daily Sailing</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <h3>Welcome <%= session.getAttribute("loginName")%></h3>

                <table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable">

                    <h3>Daily Sailing for Route <%= request.getAttribute("routeID")%> on  <%= request.getAttribute("cal")%>:</h3><!--  --> 
                    <h3>Departure: <%= request.getAttribute("departure")%>am, Return: <%= request.getAttribute("arrival")%>pm</h3>
                    <form name="goto" action="CustomerServlet">
                        <input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" />
                        <input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" />
                    </form>
                </table>
                <!-- TINYTABLESORTER JAVASCRIPT GOES HERE -->
                <br />
                <h3>Route: <%= request.getAttribute("routeString")%> </h3>
                <h3>Total No of passengers for this cruise: <%= request.getAttribute("passengerTotal")%> </h3>
                <h3>Info: <%= request.getAttribute("msg")%> </h3>
                <table cellspacing="6" border="0" id="table" class="" >
                    <!-- UNCOMMENT HTML WITH THIS 
                    <form name="goto" action="BookingServlet">
                        <tr>
                            <td align="left"><p>Add a new booking:</p></td>
                            <td><input type="submit" value="book" name="submit" style="width:75px" onclick="" /></td>
                        </tr>
                    </form>-->
                    <tr>
                        <td><p>Back to previous page</p></td>
                        <td><input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" /></td>
                    </tr>
                </table>
            </div>
            <!-- UNCOMMENT HTML WITH THIS -->
            <%@include file="/includes/footer.jsp" %>
