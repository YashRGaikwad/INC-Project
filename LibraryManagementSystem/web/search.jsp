<%-- 
    Document   : search
    Created on : May 25, 2021, 7:15:09 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     if (session.getAttribute("studentUserID") != null) {
    String searchText = request.getParameter("searchText");
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
    crs1.setUrl(beans.Singleton.getDbURL());
    crs1.setUsername(beans.Singleton.getUser());
    crs1.setPassword(beans.Singleton.getPass());

    crs1.setCommand("select * from books where title like '%" + searchText + "%'");
    crs1.execute();
    
    if(crs1.next())
{
//        crs1.setCommand("select * from books");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
                <li><a href="welcomeStudent.jsp">Books</a></li>
                <li><a href="requestBooks.jsp">Request for Books</a></li>
                <li><a href="booksIssuedStudent.jsp">Issued Books</a></li>
                <form action="search.jsp">
                    <input type="text" placeholder="Search.." name="searchText"/>
                    <button type="submit">Search</button>
                </form>
            </ul>
        </div>-->
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-info">
        <a href="welcomeStudent.jsp" class="navbar-brand">Online Library</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse5">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse5">
            <div class="navbar-nav">
                <a href="welcomeStudent.jsp" class="nav-item nav-link active">Books</a>
                <a href="requestBooks.jsp" class="nav-item nav-link">Request Book</a>
                <a href="booksIssuedStudent.jsp" class="nav-item nav-link">Issued Books</a>
                <a href="updateStudent.jsp" class="nav-item nav-link">Profile</a>
            </div>
            <form action="search.jsp" class="form-inline ml-auto">
                <input type="text" class="form-control mr-sm-2" placeholder="Search" name="searchText">
                <button type="submit" class="btn btn-outline-light">Search</button>
            </form>
            <div class="nav-item">
                <a class="nav-link btn btn-primary text-white" style="margin:10px" type="button" href="logout.jsp">Logout</a>                  
                </div>
        </div>
    </nav>
        <div class="table-responsive">
            <form action="issueBooks.jsp">
                <table class="table table-bordered m-10px" width = 100% border="10px">
                    <thead>
                        <tr>
                            <th>Books</th>
                            <th>ISBN</th>
                            <th>Genre</th>
                            <th>Issue</th>
                        </tr>
                    </thead>
                    <%  crs1.beforeFirst();
                        while (crs1.next()) {

                            String isbn = crs1.getString("ISBN");
                            //            int booksID = crs.getInt("booksID");

                    %>    
                    <tr>
                        <td><%=crs1.getString("Title")%><p><a href="bookDetails.jsp?isbn=<%=isbn%>">See more...</a></p></td>
                        <td><%=crs1.getString("ISBN")%></td>
                        <td><%=crs1.getString("Genre")%></td>
                        <!--<td><a href="issueBooks.jsp?isbn=<%=isbn%>">Issue</a></td>-->
                        <td><input type="checkbox" name="selectedBooks" value="<%=crs1.getString("ISBN")%>"> Issue</td>
                    </tr>
                    <% }
                    %>   

                </table>
                <input type='submit' class="btn btn-info" value='Submit' name="submit">
            </form>
        </div>
    </body>
</html>

<%}
else { %>

<script>
    alert("No books that contains the letters <%=searchText%> !");
    window.location= "welcomeStudent.jsp";
</script>


<% }} else {
        response.sendRedirect("index.jsp");
    }
%>
