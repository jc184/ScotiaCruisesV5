<%-- 
    Document   : scotiavalidation
    Created on : 12-Nov-2010
    Author     : James Chalmers
    Iteration  : 5.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@include file="/includes/header1.jsp" %>

<div class="box"><h3>Sorry, but you entered your details incorrectly.</h3><br />
    <p>Click on the Back button in your browser and re-enter your details.</p><br />
    <p>You must book at least one week in advance.</p><br />
    <table>
        <tr>
            <td>
                <!-- UNCOMMENT HTML WITH THIS -->
                <td><p>Back to previous page</p></td>
                <td><input type="button" value="back" onclick="location.href = document.referrer; return false;" style="width:75px" /></td>
            </td>
        </tr>
    </table>
</div>

<%@include file="/includes/footer.jsp" %>          

