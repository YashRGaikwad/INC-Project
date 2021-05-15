<%-- 
    Document   : updateBooks
    Created on : May 8, 2021, 1:14:31 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     if(request.getParameter("submit") != null)
     {
         
         String isbn = request.getParameter("isbn");
         String title = request.getParameter("title");
         int publisherID = Integer.valueOf(request.getParameter("publisherID"));
         String genre = request.getParameter("genre");
         int authorID = Integer.valueOf(request.getParameter("authorID"));   
        
        
          try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }
        

            CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
            crs1.setUrl(beans.Singleton.getDbURL());
            crs1.setUsername(beans.Singleton.getUser());
            crs1.setPassword(beans.Singleton.getPass());
            
           crs1.setCommand("Update books set title=?, publisherID=?,genre=?,authorID=? where isbn=?");
           crs1.setString(1, title);
           crs1.setInt(2, publisherID);
           crs1.setString(3, genre);
           crs1.setInt(4, authorID);
           crs1.setString(5, isbn);
           crs1.execute();
//           response.sendRedirect("welcomeAdmin.jsp");
     }
     
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
        <h1>Update Books</h1>
        
        <form action="#">
        <fieldset>
            
            <% 

            try {
              Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }
        

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(beans.Singleton.getDbURL());
            crs.setUsername(beans.Singleton.getUser());
            crs.setPassword(beans.Singleton.getPass());
            
            String isbn = request.getParameter("isbn");
//            crs.setCommand("Select * from books where isbn = ?");
            crs.setCommand("Select * from books,publishers,authors where isbn=? and books.publisherID = publishers.publisherID and books.authorID = authors.authorID");
            crs.setString(1, isbn);
            crs.execute();
            
            CachedRowSet crs2 = RowSetProvider.newFactory().createCachedRowSet();
            crs2.setUrl(beans.Singleton.getDbURL());
            crs2.setUsername(beans.Singleton.getUser());
            crs2.setPassword(beans.Singleton.getPass());
            
            crs2.setCommand("Select * from publishers");
            crs2.execute();
            
            while(crs.next())
            {
    
            %>
                
                <legend>Book details</legend>
                <div class="col-sm-4">
                    Book Title: <input type="text" class="form-control" placeholder="Book Title" name="title" value="<%=crs.getString("title")%>" style='margin-bottom: 1em'/><br>
                    ISBN: <input type="number" class="form-control" placeholder="Book ISBN" name="isbn" value="<%=crs.getString("isbn")%>" style='margin-bottom: 1em'/><br>
                    <!--ISBN:<p><%=crs.getString("isbn")%></p>-->
                    PublisherID: <input type="number" class="form-control" placeholder="Book Publisher ID" name="publisherID" value="<%=crs.getInt("publisherID")%>" style='margin-bottom: 1em'/><br>
                    Genre: <input type="text" class="form-control" placeholder="Book Genre" name="genre" value="<%=crs.getString("genre")%>" style='margin-bottom: 1em'/><br>
                    AuthorID: <input type='number' class="form-control" placeholder="Book Author ID" name='authorID' value="<%=crs.getInt("authorID")%>" style='margin-bottom: 1em'/><br>
                    Publisher Name: <select id="publisherName" name="publisherName">
                        <% while(crs2.next())
                        {
                         %>
                        <option value="<%=crs2.getInt("publisherID")%>"><%=crs2.getString("publisherName")%></option>
                        <% }%>
                    </select>
                    Author Name: <select id="authorName" name="authorName">
                        <option value="">Hello</option>
                        <option value="">Hello1</option>
                        <option value="">Hello2</option>
                    </select>
                
            <% } %>
            <input type='submit' class="btn btn-info" value='Submit' name="submit">
            <input type="reset" class="btn btn-warning" value="Reset" name="reset">
            </div>
            </fieldset>
                </form>
                <div>
                    <p>
                        <a href="welcomeAdmin.jsp"> Back</a>
                    </p>
                    
                </div>
          
    </body>
</html>
