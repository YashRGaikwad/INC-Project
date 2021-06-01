<%-- 
    Document   : logout
    Created on : Jun 1, 2021, 12:05:00 AM
    Author     : Yash Gaikwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
