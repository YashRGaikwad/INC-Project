<%-- 
    Document   : booksIssuedStudent
    Created on : May 15, 2021, 12:39:58 AM
    Author     : Yash Gaikwad
--%>


<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }
    int studentID = (Integer)session.getAttribute("userID");
    
    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl(beans.Singleton.getDbURL());
    crs.setUsername(beans.Singleton.getUser());
    crs.setPassword(beans.Singleton.getPass());
    crs.setCommand("select * from issue_books,students, books where issue_books.ISBN = books.ISBN and issue_books.ID = students.USERID and UserID = ?");
    crs.setInt(1, studentID);
    crs.execute();

%>
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
                <li><a href="welcomeStudent.jsp">Books</a></li>
                <li><a href="studentsList.jsp">Students</a></li>
                <li><a href="#">ABCDE</a></li>
                <li><a href="#">ABCDE</a></li>
                <li><a href="#">ABCDE</a></li>

            </ul>
        </div>
        <div>
            <table class="table table-responsive table-bordered" width = 100% border="10px">
                <thead>
                    <tr>
                        <th>Book Name</th>
                        <th>Book ISBN</th>
                        <th>Issue Date</th>
                        <th>Return Book</th>
                    </tr>
                </thead>
                <% while (crs.next()) {
                    int IssueBooksID = crs.getInt("IssueBooksID");
                %>    
                <tr>
                    <td><%=crs.getString("Title")%></td>
                    <td><%=crs.getString("ISBN")%></td>
                    <td><%=crs.getString("Issue_date")%></td>
                    <td><a href="returnBook.jsp?IssueBooksID=<%=IssueBooksID%>">Delete Book</a></td>
                </tr>
                <% }
                %>   

            </table>
        </div>
        
    </body>
</html>
