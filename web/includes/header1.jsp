<%-- 
    Document   : header1
    Created on : 27-Nov-2010, 09:33:16
    Author     : josefk
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
%>
<html>
    <head>
        <title>Scotia Cruises</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <link rel="stylesheet" type="text/css" href="styles/DWBA.css"/>
        <script type="text/javascript" src="scripts/custvalidation.js"></script>
        <!-- UNCOMMENT HTML WITH THIS -->
    </head>
    <body>
        <!-- UNCOMMENT HTML WITH THIS -->
        <div class="outer">
            <div class="header"><h1>Scotia Island & Wildlife Cruises</h1></div>
