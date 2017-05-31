<%-- 
    Document   : loginError
    Created on : 19-Nov-2010, 16:09:08
    Author     : josefk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/includes/header1.jsp" %>

<div class="box">
    <h1>Scotia Island & Wildlife Cruises</h1><br />
    <h3>Your choice of cruise is fully booked</h3>
    <h3>Please choose another date and try again</h3><br />
    <table cellspacing="8" border="0">
        <td><p>Back to previous page</p></td>
        <td><input type="button" value="back" onclick="location.href = document.referrer; return false;"" style="width:75px" /></td>
    </table>
</div>

<%@include file="/includes/footer.jsp" %>

