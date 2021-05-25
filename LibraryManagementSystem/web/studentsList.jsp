<%-- 
    Document   : studentsList
    Created on : May 11, 2021, 1:19:32 AM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl(beans.Singleton.getDbURL());
    crs.setUsername(beans.Singleton.getUser());
    crs.setPassword(beans.Singleton.getPass());
    crs.setCommand("select * from students");
    crs.execute();

%>

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

        <div>
            <table class="table table-responsive table-bordered" width = 100% border="10px">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>College</th>
                        <th>Phone</th>
                        <!--<th>Edit</th>-->
                        <th>Delete</th>
                    </tr>
                </thead>
                <% while (crs.next()) {

                        int studentID = crs.getInt("UserID");


                %>    
                <tr>
                    <td><%=crs.getString("Name")%></td>
                    <td><%=crs.getString("Email")%></td>
                    <td><%=crs.getString("College")%></td>
                    <td><%=crs.getString("Phone")%></td>
                    <!--<td><a href="updateStudent.jsp?studentID=<%=studentID%>">Edit</a></td>-->
                    <td><a href="deleteStudent.jsp?studentID=<%=studentID%>">Delete</a></td>
                </tr>
                <% }
                %>   
            </table>
        </div>

    </body>
</html>

