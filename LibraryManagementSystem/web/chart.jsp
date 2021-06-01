<%-- 
    Document   : chart
    Created on : May 25, 2021, 5:27:56 PM
    Author     : Yash Gaikwad
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if (session.getAttribute("userID") != null) { %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        <%
           try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
           } catch (ClassNotFoundException ex) {
               //Logger.getLogger(Tester.class.getName()).log(Level.SEVERE, null, ex);
           }
           CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();

           crs.setUrl(beans.Singleton.getDbURL());
           crs.setUsername(beans.Singleton.getUser());
           crs.setPassword(beans.Singleton.getPass());
           crs.setCommand("select count(*) as c, college from students group by college");
           crs.execute();
           ArrayList<String> col = new ArrayList<String>();
           ArrayList<Integer> count = new ArrayList<Integer>();
           
          while(crs.next())
          {
//              count.add(crs.getInt("c"));
              col.add(crs.getString("College"));
             count.add(crs.getInt("C"));

              
          }
        %>
//        function drawChart() {
//            var data = google.visualization.arrayToDataTable([
//                ['Task', 'Hours per Day'],
//                ['Work', 11],
//                ['Eat', 2],
//                ['Commute', 2],
//                ['Watch TV', 2],
//                ['Sleep', 7]
//            ]);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Count','Colleges'],
                <% for(int i =0;i<count.size();i++)
                {
                    out.print("['" + col.get(i) + "'," + count.get(i) + "]");
                    if(i<count.size()-1)
                    {
                        out.print(",");
                    }
                }
                %>
            ]);



            var options = {
                title: 'Student Distribution',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
    <body>
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
            <form action="search.jsp" class="form-inline ml-auto" hidden>
                <input type="text" class="form-control mr-sm-2" placeholder="Search" name="searchText">
                <button type="submit" class="btn btn-outline-light">Search</button>
            </form>
            <div class="nav-item">
                <a class="nav-link btn btn-primary text-white" style="margin:10px" type="button" href="logout.jsp">Logout</a>                  
                </div>
        </div>
    </nav>
        <div id="piechart_3d" style="width: 900px; height: 500px; align-content: center"></div>
    </body>
</html>

<% } else {
        response.sendRedirect("index.jsp");
    }
%>
