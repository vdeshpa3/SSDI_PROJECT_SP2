<%-- 
    Document   : RegisterResult
    Created on : 26 Mar, 2017, 1:10:20 PM
    Author     : Viranchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegisterResult</title>
    </head>
    <body>
        <h1><%= request.getAttribute("Result") %></h1>
        <p> click <a href ="home.jsp">here</a> to go to Home
        </p>
    </body>
</html>
