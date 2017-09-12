<%-- 
    Document   : customerExists
    Created on : 08-July-2017, 16:09:08
    Author     : james
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/includes/header1.jsp" %>

<div class="box">
    <h1>Scotia Island & Wildlife Cruises</h1><br />
    <h3>A user with those details already exists</h3><br />
    <p>Please login with your username and password</p><br />
    <form name="Form" action="CustomerServlet">
            <table cellspacing="8" border="0">
                <tr>
                    <td align="left"><p>Login:</p></td>
                    <td><input type="submit" value="login" name="submit" style="width:75px" /></td>
                </tr>
            </table>
        </form>
</div>

<%@include file="/includes/footer.jsp" %>

