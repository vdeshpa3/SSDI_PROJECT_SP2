<%-- 
    Document   : 49_uncc
    Created on : 26 Mar, 2017, 5:09:40 PM
    Author     : Viranchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- Include tag is used to import header page --%>
<%@ include file="header.jsp" %>

<section id="home_page">
    <%-- Img tag is used to import image --%>
    <body>
        <h1>Laser Tag Corps</h1>
        <input type="submit" value="Join" id="signup_button" onClick="Join('Laser Tag Corps')">
    </body>

</section>
    <script>
        function Join(group_name)
        {
            alert("Join request cannot be sent as the group limit has been reached");
            //document.getElementById("signup_button").value = "Request Sent";
        }
        </script>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>

