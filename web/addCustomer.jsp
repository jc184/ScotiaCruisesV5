<%--
    Document   : index.jsp
    Created on : 12-Nov-2010
    Author     : James Chalmers
    Iteration  : 5.0
--%>

<%--@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Scotia Cruises</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <link rel="stylesheet" type="text/css" href="styles/DWBA.css"/>
        <script type="text/javascript" src="scripts/custvalidation.js"></script>
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>

            <div class="box"><h2>New Customer Registration</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <p>Enter your details in the form below and click 'add' to register</p>
                <form name="form" action="CustomerServlet" method="POST">
                    <table cellspacing="8" border="0">
                        <!-- UNCOMMENT TO USE HTML BELOW -->
                        <tr>
                            <td align="left"><p><label for="firstname">Forename:</label></p></td>
                            <td><input type="text" name="firstname" id="firstname" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="surname">Surname:</label></p></td>
                            <td><input type="text" name="surname" id="surname" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="contactNo">Contact No:</label></p></td>
                            <td><input type="text" name="contactNo" id="contactNo" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="emailAddress">Email Address:</label></p></td>
                            <td><input type="text" name="emailAddress" id="emailAddress" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="loginName">Choose login name:</label></p></td>
                            <td><input type="text" name="loginName" id="loginName" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="loginPasswd">Choose login password:</label></p></td>
                            <td><input type="password" name="loginPasswd" id="loginPasswd" value="" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p><label for="countryOrig">Country of Origin (optional):</label></p></td>
                            <td><select name="countryOrig" id="countryOrig">
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
                                </select></td>
                        </tr>
                        <tr>
                            <td><p>Add new Customer</p></td>
                            <td><input type="submit" value="add" name="submit" style="width:75px" onclick="validate(this.form);return false;" /><br /></td>
                            <td><input type="hidden" value="" name="loginName" /></td>
                        </tr>
                        <tr>
                            <td><p>Back to previous page</p></td>
                            <td><input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" /></td>
                        </tr>
                    </table>
                </form></div>

            <%@include file="/includes/footer.jsp" %>
