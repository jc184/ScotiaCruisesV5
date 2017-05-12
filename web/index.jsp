<%-- 
    Document   : index
    Created on : 19-Nov-2016
    Author     : james chalmers
    Version    : 5.0
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Scotia Login Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <!-- <script type="text/javascript" src="scripts/stafflogin.js"></script>  -->
        <!-- <script type="text/javascript" src="scripts/userlogin.js"></script>  -->
        <link rel="stylesheet" type="text/css" href="styles/DWBA.css"/>
    </head>
    <body>
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
            <div class="box"><h2>Login Page</h2>
                <noscript><p>This page is best viewed with JavaScript enabled.<br />
                        You can enabled it in Tools / Options in most browsers</p></noscript><br />
                <script type='text/javascript'>
                    function validateform1() {
                        'use strict';
                        var username = document.stafflogin.loginName.value;
                        var password = document.stafflogin.loginPasswd.value;

                        if (username === null || username === "") {
                            alert("Please enter the admin username");
                            document.stafflogin.loginName.focus();
                            return false;
                        } else if (password === null || password === "") {
                            alert("Please enter the admin password");
                            document.stafflogin.loginPasswd.focus();
                            return false;
                        } else {
                            document.stafflogin.submit();
                        }
                    }
                </script>
                <form name="stafflogin" action="LoginServlet" method="POST"  onsubmit="return validateform1()">
                    <h3>Staff Login with username and password</h3>
                    <p> To login, enter details below:</p>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left"><p>Staff Username:</p></td>
                            <td><input type="text" name="loginName" id="loginName" /></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Staff Password:</p></td>
                            <td><input type="password" name="loginPasswd" id="loginPasswd" /></td>
                        </tr>
                        <tr>
                            <td align="left"><input type="submit" value="stafflogin" name="submit" style="width:75px"  /></td>
                        </tr>
                    </table>
                </form>
                <br />
                <script type='text/javascript'>
                    function validateform2() {
                        'use strict';
                        var name = document.userlogin.loginName.value;
                        var password = document.userlogin.loginPasswd.value;

                        if (name === null || name === "") {
                            alert("Please enter your username");
                            document.userlogin.loginName.focus();
                            return false;
                        } else if (password === null || password === "") {
                            alert("Please enter your password");
                            document.userlogin.loginPasswd.focus();
                            return false;
                        } else {
                            document.userlogin.submit();
                        }
                    }
                </script>
                <form name="userlogin" method="POST" action="LoginServlet" onsubmit="return validateform2()">
                    <h3>Customer Login with login name and login password</h3>
                    <p> To login, enter details below:</p>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td align="left"><p>Login name:</p></td>
                            <td><input type="text" name="loginName" id="loginName"/></td>
                        </tr>
                        <tr>
                            <td align="left"><p>Login password:</p></td>
                            <td><input type="password" name="loginPasswd" id="loginPasswd"/></td>
                        </tr>
                        <tr>
                            <td align="left"><input type="submit" value="userlogin" name="submit" style="width:75px" /><br /></td>
                        </tr>
                    </table>
                </form>
                <br />
                <form name="Form" action="CustomerServlet">
                    <h3>New Customer registration</h3>
                    <p>To register, click on "register" below:</p>
                    <table cellspacing="8" border="0">
                        <tr>
                            <td><input type="submit" value="register" name="submit" style="width:75px" /></td>
                        </tr>
                    </table>
                </form>
            </div>

            <%@include file="/includes/footer.jsp" %>
