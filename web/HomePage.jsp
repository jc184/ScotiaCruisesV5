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
    <p>Welcome to Scotia Wildlife & Island Cruises.<br/><br/>
        We offer daily cruises to the Small Isles of Rum, Eigg and Muck from Morar, 
        just 10 minutes from Mallaig train station, on our three vessels: 'Puffin', 
        'Guillemot' and 'Cormorant'. Three Routes are available: Morar to Rum return, 
        Morar to Muck return, and Morar to Eigg return. The vessels circumnavigate 
        the islands in question and make stops to enable passengers to explore each 
        of the enticing Small Isles at their leisure.<br/><br/>
        Enjoy on board facilities and dine in unforgettable surroundings in our 
        dining saloons, or weather permitting, on deck or on our viewing platforms.
        Here you can experience Scottish Wildlife at first hand, including elusive dolphins.
        Take shelter down below when it is raining and enjoy much needed refreshments 
        from our cosy bars.
        Each vessel has a crew of four: Skipper, Bosun, Wildlife Guide and Chef, and
        has room for 12 passengers each.</p>
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

