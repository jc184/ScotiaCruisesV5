<%-- 
    Document   : scotiadeleteconfirmation
    Created on : 17-Nov-2010, 15:32:19
    Author     : josefk
    Version    : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/includes/header1.jsp" %>

<div class="box">
    <h1>Scotia Island & Wildlife Cruises</h1><br />
    <h3>The details have been deleted.</h3><br />
    <p>Click on 'back' to return to the previous page.</p><br />

    <table cellspacing="8" border="0">
        <form name="confirmation" action="CustomerServlet">
            <input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" />
            <!--  <input type="submit" value="show all" name="submit" style="width:100px" />ALIGNS EVERYTHING WITHIN DIV -->
        </form><br />
    </table>
</div>

<%@include file="/includes/footer.jsp" %>
