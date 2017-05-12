<%-- 
    Document   : updateCustomer
    Created on : 16-Nov-2010, 17:57:39
    Author     : James Chalmers
    Iteration  : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CustomerBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title>Scotia Update Registration Page</title>
        <link rel="stylesheet" type="text/css" href="styles/DWBA.css"/>
        <script type="text/javascript" src="scripts/custvalidation.js"></script>
    </head>
    <body>
        <!-- UNCOMMENT TO USE HTML BELOW -->
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>Update Registration page</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <p>Enter your details in the form below and click 'edit' to update</p>

                <form name="updateCustomerForm" action="CustomerServlet">
                    <% CustomerBean customer = (CustomerBean) request.getAttribute("customer");%>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left"><p>ID:</p></td>
                            <td><p><%= customer.getCustomerID()%></p></td>
                        </tr>
                        <tr>
                            <td align="left"><p<label for="firstname">Forename:</label></p></td>
                            <td><input type="text" name="firstname" id="firstname" value="<%= customer.getFirstname()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p<label for="surname">Surname:</label></p></td>
                            <td><input type="text" name="surname" id="surname" value="<%= customer.getSurname()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p<label for="contactNo">Contact No:</label></p></td>
                            <td><input type="text" name="contactNo" id="contactNo" value="<%= customer.getContactNo()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p<label for="emailAddress">Email Address:</label></p></td>
                            <td><input type="text" name="emailAddress" id="emailAddress" value="<%= customer.getEmailAddress()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p<label for="loginName">Login name:</label></p></td>
                            <td><input type="text" name="loginName" id="loginName" value="<%= customer.getLoginName()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="loginPasswd">Login password:</label></p></td>
                            <td><input type="password" name="loginPasswd" id="loginPasswd" value="<%= customer.getLoginPasswd()%>" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="countryOrig">Country of Origin (optional):</label></p></td>
                            <td><select name="countryOrig" id="countryOrig" value="<%= customer.getCountryOrig()%>">
                                    <option selected></option>
                                    <option>UK</option>
                                    <option>France</option>
                                    <option>Germany</option>
                                    <option>Spain</option>
                                    <option>Italy</option>
                                    <option>Rep of Ireland</option>
                                    <option>USA</option>
                                    <option>Canada</option>
                                    <option>Australia</option>
                                    <option>New Zealand</option>
                                    <option>Other European</option>
                                    <option>Other Rest of World</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="customerID" value="<%= customer.getCustomerID()%>" />
                                <input type="submit" value="edit" name="submit" style="width:75px" onclick="validate(this.form);return false;" />
                        </tr>
                        <tr>
                            <td>
                                <input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" />
                            </td>
                        </tr>
                    </table>
                </form></div>

            <%@include file="/includes/footer.jsp" %>
