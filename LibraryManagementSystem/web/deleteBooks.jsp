<%-- 
    Document   : deleteBooks
    Created on : May 8, 2021, 1:14:44 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    if (session.getAttribute("userID") != null) {

    String isbn = request.getParameter("isbn");
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
    crs1.setUrl(beans.Singleton.getDbURL());
    crs1.setUsername(beans.Singleton.getUser());
    crs1.setPassword(beans.Singleton.getPass());

    crs1.setCommand("Delete from books where isbn=?");
    crs1.setString(1, isbn);
    crs1.execute();
//    response.sendRedirect("welcomeAdmin.jsp");

%>

<script>
    alert("Book Deleted");
    window.location= "welcomeAdmin.jsp";
</script>

<% } else {
        response.sendRedirect("index.jsp");
    }
%>