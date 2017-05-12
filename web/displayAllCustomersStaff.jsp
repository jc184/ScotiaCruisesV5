<%-- 
    Document   : displayAllCustomersStaff
    Created on : 30-Nov-2010, 16:22:18
    Author     : josefk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CustomerBean" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- ACKNOWLEDGEMENTS
    Document   : tinytablesorter
    Created on : 23-May-2009, 11:22:18
    Author     : Michael Leigeber
    Credits    : Michael Leigeber, http://www.leigeber.com/2009/03/table-sorter/
    Info       : "This script has been tested in all major browsers and is
                  available free of charge for both personal or commercial
                  projects under the creative commons license."
-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/DWBA2.css"/>
        <link rel="stylesheet" type="text/css" href="styles/tinytablesorter.css"/>
        <title>All Customers</title>
    </head>
    <body>
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>View all Customers</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <h3>Welcome <%= session.getAttribute("loginName")%></h3>
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
                </table><br />

                <div id="controls">
                    <table cellspacing="8" border="0">
                        <tr>
                            <td valign="top" colspan="2">
                                <div id="perpage">
                                    <select onchange="sorter.size(this.value)">
                                        <option value="5">5</option>
                                        <option value="10" selected="selected">10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    <span>Entries Per Page</span>
                                </div>
                                <div id="navigation">
                                    <img src="images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1, true)" />
                                    <img src="images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
                                    <img src="images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
                                    <img src="images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1, true)" />
                                </div>
                                <div id="text">Displaying Page <span id="currentpage"></span> of <span id="pagelimit"></span></div>
                            </td>
                        </tr>
                    </table>
                </div><br /><!-- UNCOMMENT HTML WITH THIS -->
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
                    <form name="addnew" action="CustomerServlet">
                        <tr>
                            <td align="left"><p>Add a new customer:</p></td>
                            <td><input type="submit" value="add new" name="submit" style="width:75px" onclick="" /></td>
                        </tr>
                    </form>

                    <form name="goto" method="post" action="staffPage.jsp">
                        <tr>
                            <td align="left"><p>Return to staff page:</p></td>
                            <td><input type="submit" value="back" name="submit" style="width:75px" />
                                <input type="hidden" name="loginName" value="<%=session.getAttribute("loginName")%>" />
                                <input type="hidden" name="loginPasswd" value="<%=session.getAttribute("loginPasswd")%>" /></td>
                        </tr>
                    </form>
                </table>
            </div>
            <div class="box">
                <table cellspacing="8" border="0">
                    <tr>
                        <td width="600" valign="top" colspan="2">
                            <p>To view individual details, enter e-mail address below:</p><br />
                            <form name="emailfilter" action="CustomerServlet">
                                <input type="text"  value="" name="filter" size=""/>
                                <input type="submit" value="email address" name="submit" style="width:100px" />
                            </form><br />
                        </td>
                    </tr>
                </table>
            </div>

            <%@include file="/includes/footer.jsp" %>

