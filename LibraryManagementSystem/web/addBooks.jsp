<%-- 
    Document   : addBooks
    Created on : May 10, 2021, 9:27:16 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (session.getAttribute("userID") != null) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }

        if (request.getParameter("submit") != null) {

            String isbn = request.getParameter("isbn");
            String title = request.getParameter("title");
            int publisherID = Integer.valueOf(request.getParameter("publisherName"));
            String genre = request.getParameter("genre");
            int authorID = Integer.valueOf(request.getParameter("authorName"));

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(beans.Singleton.getDbURL());
            crs.setUsername(beans.Singleton.getUser());
            crs.setPassword(beans.Singleton.getPass());

            crs.setCommand("Insert into Books (isbn,title,publisherID,genre,authorID) values (?,?,?,?,?)");
            crs.setString(1, isbn);
            crs.setString(2, title);
            crs.setInt(3, publisherID);
            crs.setString(4, genre);
            crs.setInt(5, authorID);
            crs.execute(); %>
<script>
    alert("Book has been SUCCESSFULLY added !");
    window.location = "welcomeAdmin.jsp";
</script>
//          response.sendRedirect("welcomeAdmin.jsp");
<%}

    CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
    crs1.setUrl(beans.Singleton.getDbURL());
    crs1.setUsername(beans.Singleton.getUser());
    crs1.setPassword(beans.Singleton.getPass());

    crs1.setCommand("Select * from authors");
    crs1.execute();

    CachedRowSet crs2 = RowSetProvider.newFactory().createCachedRowSet();
    crs2.setUrl(beans.Singleton.getDbURL());
    crs2.setUsername(beans.Singleton.getUser());
    crs2.setPassword(beans.Singleton.getPass());

    crs2.setCommand("Select * from publishers");
    crs2.execute();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Add Books</h1>

        <form action="#">
            <fieldset>

                <legend>Book details</legend>
                <div class="col-sm-4">
                    Book Title: <input type="text" class="form-control" placeholder="Book Title" name="title" value="" style='margin-bottom: 1em' required/><br>
                    ISBN: <input type="number" class="form-control" placeholder="Book ISBN" name="isbn" value="" style='margin-bottom: 1em' required/><br>
                    Publisher Name: <select id="publisherName" name="publisherName">
                        <% while (crs2.next()) {
                        %>
                        <option value="<%=crs2.getInt("publisherID")%>"><%=crs2.getString("publisherName")%></option>
                        <% }%>
                    </select><br><br>
                    <!--Publisher Name: <input type="text" class="form-control" placeholder="Book Publisher Name" name="publisherName" value="" style='margin-bottom: 1em' required/><br>-->
                    Genre: <input type="text" class="form-control" placeholder="Book Genre" name="genre" value="" style='margin-bottom: 1em' required/><br>
                    <!--Author Name: <input type='text' class="form-control" placeholder="Book Author Name" name='authorName' value="" style='margin-bottom: 1em' required/><br>-->
                    Author Name: <select id="authorName" name="authorName">
                        <% while (crs1.next()) {
                        %>
                        <option value="<%=crs1.getInt("authorID")%>"><%=crs1.getString("firstName")%> <%=crs1.getString("lastName")%></option>
                        <% }%>
                    </select><br><br>
                    <input type='submit' class="btn btn-info" value='Submit' name="submit">
                </div>
            </fieldset>
        </form><br>
        <div>
            <p>
                <a href="welcomeAdmin.jsp"> Back</a>
            </p>

        </div>

    </body>
</html>


<% } else {
        response.sendRedirect("index.jsp");
    }
%>

