<%-- 
    Document   : index
    Created on : May 6, 2021, 7:19:10 PM
    Author     : Yash Gaikwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 id="hello">Welcome to our Online Library Management System</h1>
        <form name="StudentLogin" action="StudentLogin.jsp">
            <input type="submit" value="Student Login" />
        </form>
        
        <form name="AdminLogin" action="AdminLogin.jsp">
            <input type="submit" value="Admin Login" />
        </form>
    </body>
</html>
