<%-- 
    Document   : requestBooks
    Created on : May 14, 2021, 8:28:47 PM
    Author     : Yash Gaikwad
--%>

<%@page import="java.lang.Integer"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("studentUserID") != null) {

        if (request.getParameter("submit") != null) {

            String isbn = request.getParameter("ISBN");
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (ClassNotFoundException ex) {
            }

            CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
            crs1.setUrl(beans.Singleton.getDbURL());
            crs1.setUsername(beans.Singleton.getUser());
            crs1.setPassword(beans.Singleton.getPass());

            int studentID = (Integer) session.getAttribute("studentUserID");

            crs1.setCommand("Insert into book_requests (studentID,title,isbn,genre) values (?,?,?,?)");
            crs1.setInt(1, studentID);
            crs1.setString(2, title);
            crs1.setString(3, isbn);
            crs1.setString(4, genre);
            crs1.execute();
%>
<script>
    alert("Request has been SUCCESSFULLY placed!");
    window.location = "welcomeStudent.jsp";
</script>
//           response.sendRedirect("welcomeAdmin.jsp");
<% }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Request for Books</h1>

        <form action="#">
            <fieldset>

                <legend>Book details</legend>
                <div class="col-sm-4">
                    Book Title: <input type="text" class="form-control" placeholder="Book Title" name="title" value="" style='margin-bottom: 1em' required/><br>   
                    ISBN: <input type="text" class="form-control" placeholder="Book Title" name="ISBN" value="" style='margin-bottom: 1em' required/><br>   
                    Genre: <input type="text" class="form-control" placeholder="Book Title" name="genre" value="" style='margin-bottom: 1em' required/><br>   
                    <input type='submit' class="btn btn-info" name="submit">
                </div>
            </fieldset>
        </form><br>
        <div>
            <p>
                <a href="welcomeStudent.jsp"> Back</a>
            </p>

        </div>

    </body>
</html>

<% } else {
        response.sendRedirect("index.jsp");
    }
%>
