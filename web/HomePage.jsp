<%-- 
    Document   : HomePage
    Created on : 27-Nov-2010, 09:28:17
    Author     : josefk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/includes/header3.jsp" %>
<%@include file="/includes/leftmenu.jsp" %>
<!-- UNCOMMENT HTML WITH THIS -->
<div class="box">
    <h2>Home Page</h2>
    <noscript><p>This page is best viewed with JavaScript enabled.<br />
            You can enabled it in Tools / Options in most browsers</p></noscript><br />
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa
        qui officia deserunt mollit anim id est laborum.<br/><br/>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa
        qui officia deserunt mollit anim id est laborum.<br/><br/>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa
        qui officia deserunt mollit anim id est laborum. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
        mollit anim id est laborum.</p>
</div>

<!-- UNCOMMENT HTML WITH THIS -->
<div class="footer"><div align="center">
        <form name="Form" action="CustomerServlet">
            <table cellspacing="8" border="0">
                <tr>
                    <td align="left"><p>Register:</p></td>
                    <td><input type="submit" value="register" name="submit" style="width:75px" /></td>
                    <td align="left"><p>Login:</p></td>
                    <td><input type="submit" value="login" name="submit" style="width:75px" /></td>
                </tr>
            </table>
        </form></div></div>

<%@include file="/includes/footer.jsp" %>

