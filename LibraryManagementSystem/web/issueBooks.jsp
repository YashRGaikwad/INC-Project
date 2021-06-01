<%-- 
    Document   : issueBooks
    Created on : May 14, 2021, 12:54:56 AM
    Author     : Yash Gaikwad
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("studentUserID") != null) {
    String[] issuedBooks = request.getParameterValues("selectedBooks");

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl(beans.Singleton.getDbURL());
    crs.setUsername(beans.Singleton.getUser());
    crs.setPassword(beans.Singleton.getPass());

    int studentID = (Integer) session.getAttribute("studentUserID");
    long millis = System.currentTimeMillis();

    if (issuedBooks != null) {
        for (int i = 0; i < issuedBooks.length; i++) {
            crs.setCommand("Insert into issue_books (ISBN,ID, issue_date) values (?,?,?)");
            crs.setString(1, issuedBooks[i]);
            crs.setInt(2, studentID);
            crs.setDate(3, new Date(millis));
            crs.execute();
        } %>
//      response.sendRedirect("welcomeStudent.jsp");
<script>
    alert("<%=issuedBooks.length%> book/s have been SUCCESSFULLY issued !");
    window.location = "welcomeStudent.jsp";
</script>

<% } else { %>
//        response.sendRedirect("welcomeStudent.jsp");
<script>
    alert("Sorry ! You could not issue the book/s");
    window.location = "welcomeStudent.jsp";
</script>
    <% }
 } else {
        response.sendRedirect("index.jsp");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    </body>
</html>
