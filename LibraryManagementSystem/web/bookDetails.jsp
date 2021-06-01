<%-- 
    Document   : bookDetails
    Created on : May 9, 2021, 1:21:20 AM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userID") != null || session.getAttribute("studentUserID") != null ) {     
         String isbn = request.getParameter("isbn");        
          try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }
        

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(beans.Singleton.getDbURL());
            crs.setUsername(beans.Singleton.getUser());
            crs.setPassword(beans.Singleton.getPass());
            
           crs.setCommand("Select * from books,publishers,authors where isbn=? and books.publisherID = publishers.publisherID and books.authorID = authors.authorID");
           crs.setString(1, isbn);
           crs.execute();
     
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% while(crs.next()) { %>
        BookID:<%=crs.getInt("BooksID")%><br>
        Name:<%=crs.getString("title")%><br>
        ISBN:<%=crs.getString("isbn")%><br>
        Author Name:<%=crs.getString("firstname")%> <%=crs.getString("lastname")%><br>
        Genre:<%=crs.getString("genre")%><br>
        Publisher Name:<%=crs.getString("publishername")%><br>           
        <%}%>
    </body>
</html>
<% } else {
        response.sendRedirect("index.jsp");
    }
%>
