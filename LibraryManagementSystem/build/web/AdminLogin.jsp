<%-- 
    Document   : AdminLogin
    Created on : May 6, 2021, 7:19:38 PM
    Author     : Yash Gaikwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <form action="checkAdmin">
                        <h1>Admin Login</h1>

                        Username:<input type="text" class="form-control" placeholder="Username" name="username" value="" required/><br>
                        Password:<input type="password" class="form-control" placeholder="Password" name="password" value="" required/><br><br>
                        <input type="submit" value="Login" class="btn btn-info"/>
                    </form>
    </body>
</html>
