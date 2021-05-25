<%-- 
    Document   : welcomeStudent
    Created on : May 7, 2021, 10:59:49 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% if (session.getAttribute("userID") != null) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }

        CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
        crs.setUrl(beans.Singleton.getDbURL());
        crs.setUsername(beans.Singleton.getUser());
        crs.setPassword(beans.Singleton.getPass());
        crs.setCommand("select * from books");
        crs.execute();
        
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
                <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
    </head>
    <style>
        body{
            margin: 0;
            padding: 0;
            background: #ccc;
            font-family: Times New Roman;
        }

        .navbar ul{
            list-style: none;
            background: #663366;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        .navbar li{
            display: inline-block;
        }

        .navbar a{
            text-decoration: none;
            color: #fff;
            width: 100px;
            display: block;
            padding: 25px;
            font-size: 15px;
            font-weight: bold;
            text-align: center;
        }

        .navbar a:hover{
            background: orange;
        }
    </style>
    <body>
        <div class="navbar">
            <ul>
                <li><a href="welcomeStudent.jsp">Books</a></li>
                <li><a href="requestBooks.jsp">Request for Books</a></li>
                <li><a href="booksIssuedStudent.jsp">Issued Books</a></li>
                <form action="search.jsp">
                    <input type="text" placeholder="Search.." name="searchText"/>
                    <button type="submit">Search</button>
                </form>
            </ul>
        </div>
        <div>
            <form action="issueBooks.jsp">
                <table class="table table-responsive table-bordered" width = 100% border="10px">
                    <thead>
                        <tr>
                            <th>Books</th>
                            <th>ISBN</th>
                            <th>Genre</th>
                            <th>Issue</th>
                        </tr>
                    </thead>
                    <% while (crs.next()) {

                            String isbn = crs.getString("ISBN");
                            //            int booksID = crs.getInt("booksID");

                    %>    
                    <tr>
                        <td><%=crs.getString("Title")%><p><a href="bookDetails.jsp?isbn=<%=isbn%>">See more...</a></p></td>
                        <td><%=crs.getString("ISBN")%></td>
                        <td><%=crs.getString("Genre")%></td>
                        <!--<td><a href="issueBooks.jsp?isbn=<%=isbn%>">Issue</a></td>-->
                        <td><input type="checkbox" name="selectedBooks" value="<%=crs.getString("ISBN")%>">Issue</td>
                    </tr>
                    <% }
                    %>   

                </table>
                <input type='submit' class="btn btn-info" value='Submit' name="submit">
                <input type="reset" class="btn btn-warning" value="Reset" name="reset">
            </form>
        </div>
        

        <% } else {
                response.sendRedirect("index.jsp");
            }
        %>


    </body>
</html>
