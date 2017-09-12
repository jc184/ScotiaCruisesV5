<%-- 
    Document   : displayCustomer
    Created on : 12-Nov-2010
    Author     : josefk
    Version    : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CustomerBean" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            //String customerID = request.getParameter("customerID");
            String firstname = request.getParameter("firstname");
            String surname = request.getParameter("surname");
            String contactNo = request.getParameter("contactNo");
            String emailAddress = request.getParameter("emailAddress");
            //String loginName = request.getParameter("loginName");
            String loginPasswd = request.getParameter("loginPasswd");

            //session.setAttribute("customerID", customerID);
            session.setAttribute("firstname", firstname);
            session.setAttribute("surname", surname);
            session.setAttribute("contactNo", contactNo);
            session.setAttribute("emailAddress", emailAddress);
            //session.setAttribute("loginName", loginName);
            session.setAttribute("loginPasswd", loginPasswd);
%>

<!-- ACKNOWLEDGEMENTS
    Document   : tinytablesorter
    Created on : 23-May-2009, 11:22:18
    Author     : Michael Leigeber
    Credits    : Michael Leigeber, http://www.leigeber.com/2009/03/table-sorter/
    Info       : "This script has been tested in all major browsers and is
                  available free of charge for both personal or commercial
                  projects under the creative commons license."
-->
<%
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/DWBA2.css"/>
        <link rel="stylesheet" type="text/css" href="styles/tinytablesorter.css"/>
        <title>Individual Customers</title>
    </head>
    <body>
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>Your Registration details</h2>

                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <p>You can edit or delete your registration by clicking on the buttons shown</p><br />
                <% ArrayList<CustomerBean> customerStore = (ArrayList<CustomerBean>) request.getAttribute("customerStore");%>
                <table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable">
                    <thead>
                        <tr>
                            <th><h3>Customer ID</h3></th>
                            <th><h3>Forename</h3></th>
                            <th><h3>Surname</h3></th>
                            <th><h3>Contact No</h3></th>
                            <th><h3>Email Address</h3></th>
                            <th><h3>Login Name</h3></th>
                            <th><h3>Login Password</h3></th>
                            <th><h3>Country of Origin</h3></th>
                            <th><h3>Update</h3></th>
                            <th><h3>Delete</h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CustomerBean customer : customerStore) {%>
                        <tr>
                            <td><%= customer.getCustomerID()%></td>
                            <td><%= customer.getFirstname()%></td>
                            <td><%= customer.getSurname()%></td>
                            <td><%= customer.getContactNo()%></td>
                            <td><%= customer.getEmailAddress()%></td>
                            <td><%= customer.getLoginName()%></td>
                            <td><%= customer.getLoginPasswd()%></td>
                            <td><%= customer.getCountryOrig()%></td>
                            <td><form name="updateCustomer" action="CustomerServlet">
                                    <input type="hidden" value="<%= customer.getCustomerID()%>" name="id" />
                                    <input type="submit" value="update" name="submit" /></form></td>
                            <td><form name="deleteCustomer" action="CustomerServlet">
                                    <input type="hidden" value="<%= customer.getCustomerID()%>" name="id" />
                                    <input type="submit" value="delete" name="submit" /></form></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <form name="gotoregconfirm" action="scotiaregconfirmation.jsp">
                    <tr>
                        <td>
                            <!-- UNCOMMENT HTML WITH THIS -->
                            <input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" />
                            <input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" />
                            <input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" />
                        </td>
                    </tr>    
                </form>

                <br />
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
                    sorter.init("table",1);
                </script>
            </div>

            <%@include file="/includes/footer.jsp" %>
