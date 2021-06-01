<%-- 
    Document   : welcomeAdmin
    Created on : May 7, 2021, 10:59:38 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% if (session.getAttribute("userID")!=null)
{
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
<!--    <style>
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
    </style>-->
    <body>
<!--        <div class="navbar">
            <ul>
                <li><a href="welcomeAdmin.jsp">Books</a></li>
                <li><a href="studentsList.jsp">Students</a></li>
                <li><a href="booksIssuedAdmin.jsp">Issued Books</a></li>
                <li><a href="requestedBooks.jsp">Book Requests</a></li>
                <li><a href="chart.jsp">Statistics</a></li>

            </ul>
        </div>-->

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-info">
        <a href="welcomeAdmin.jsp" class="navbar-brand">Online Library</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse5">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse5">
            <div class="navbar-nav">
                <a href="welcomeAdmin.jsp" class="nav-item nav-link active">Books</a>
                <a href="studentsList.jsp" class="nav-item nav-link">Students</a>
                <a href="booksIssuedAdmin.jsp" class="nav-item nav-link">Issued Books</a>
                <a href="requestedBooks.jsp" class="nav-item nav-link">Book Requests</a>
                <a href="chart.jsp" class="nav-item nav-link">Statistics</a>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="addBooks.jsp">Add Books</a>
                        <a class="dropdown-item" href="addAuthors.jsp">Add Authors</a>
                        <a class="dropdown-item" href="addPublishers.jsp">Add Publishers</a>
                    </div>
            </div>
            <form action="searchAdmin.jsp" class="form-inline ml-auto" hidden>
                <input type="text" class="form-control mr-sm-2" placeholder="Search" name="searchText">
                <button type="submit" class="btn btn-outline-light">Search</button>
            </form>
            <div class="nav-item">
                <a class="nav-link btn btn-primary text-white" style="margin:10px" type="button" href="logout.jsp">Logout</a>                  
                </div>
        </div>
    </nav>

<!--        <div>
            <ul>
                <li><a href="addBooks.jsp">Add Books</a></li>
                <li><a href="addAuthors.jsp">Add Authors</a></li>
                <li><a href="addPublishers.jsp">Add Publishers</a></li>
            </ul>
        </div>-->


        <div class="table-responsive">
            <table class="table table-bordered m-10px" width = 100% border="10px">
                <thead>
                    <tr>
                        <th>Books</th>
                        <th>ISBN</th>
                        <th>Genre</th>
                        <th>Edit</th>
                        <th>Delete</th>
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
                    <td><a href="updateBooks.jsp?isbn=<%=isbn%>">Edit</a></td>
                    <td><a href="deleteBooks.jsp?isbn=<%=isbn%>">Delete</a></td>
                </tr>
                <% }
                %>   

            </table>
        </div>
<% } 
else{
response.sendRedirect("index.jsp");
}

%>


    </body>
</html>
