<%-- 
    Document   : returnBook
    Created on : May 19, 2021, 2:31:22 AM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("studentUserID") != null) {
    int IssueBooksID = Integer.valueOf(request.getParameter("IssueBooksID"));
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
    crs1.setUrl(beans.Singleton.getDbURL());
    crs1.setUsername(beans.Singleton.getUser());
    crs1.setPassword(beans.Singleton.getPass());

    crs1.setCommand("Delete from Issue_Books  where IssueBooksID=?");
    crs1.setInt(1, IssueBooksID);
    crs1.execute();
//    response.sendRedirect("booksIssuedStudent.jsp");

%>

<script>
    alert("Book Returned");
    window.location= "booksIssuedStudent.jsp";
</script>

<% } else {
        response.sendRedirect("index.jsp");
    }
%>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="alert alert-success">
            <strong>Success!</strong> This alert box could indicate a successful or positive action.
        </div>
    </body>
</html>-->
