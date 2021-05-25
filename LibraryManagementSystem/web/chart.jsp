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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
          <div class="navbar">
            <ul>
                <li><a href="welcomeAdmin.jsp">Books</a></li>
                <li><a href="studentsList.jsp">Students</a></li>
                <li><a href="booksIssuedAdmin.jsp">Issued Books</a></li>
                <li><a href="requestedBooks.jsp">Book Requests</a></li>
                <li><a href="chart.jsp">Statistics</a></li>

            </ul>
        </div>
        <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    </body>
</html>
