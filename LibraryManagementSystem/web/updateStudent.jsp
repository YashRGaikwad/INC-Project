<%-- 
    Document   : updateStudent
    Created on : May 14, 2021, 10:36:52 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("studentUserID") != null) {
        if (request.getParameter("submit") != null) {

            String name = request.getParameter("name");
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String college = request.getParameter("college");
            String phone = request.getParameter("phone");

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (ClassNotFoundException ex) {
            }

            CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
            crs1.setUrl(beans.Singleton.getDbURL());
            crs1.setUsername(beans.Singleton.getUser());
            crs1.setPassword(beans.Singleton.getPass());

            crs1.setCommand("Update students set Uname=?, Name=?,Email=?,College=?, Phone=? where UserID=?");
            crs1.setString(1, userName);
            crs1.setString(2, name);
            crs1.setString(3, email);
            crs1.setString(4, college);
            crs1.setString(5, phone);
            crs1.setInt(6, (int)(session.getAttribute("studentUserID"))); 
            crs1.execute(); %>
            <script>
    alert("Successfully Updated!");
    window.location= "welcomeStudent.jsp";
</script>
//           response.sendRedirect("welcomeAdmin.jsp");
       <% }

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
        <h1>Update Student</h1>

        <form action="#">
            <fieldset>

                <%                try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                    } catch (ClassNotFoundException ex) {
                    }

                    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
                    crs.setUrl(beans.Singleton.getDbURL());
                    crs.setUsername(beans.Singleton.getUser());
                    crs.setPassword(beans.Singleton.getPass());

                    String isbn = request.getParameter("isbn");
                    //            crs.setCommand("Select * from books where isbn = ?");
                    crs.setCommand("Select * from students where userID = ?");
                    crs.setInt(1, (int)(session.getAttribute("studentUserID")));
                    crs.execute();
                    while (crs.next()) {

                %>

                <legend>Book details</legend>
                <div class="col-sm-4">
                    Name: <input type="text" class="form-control" placeholder="Name" name="name" value="<%=crs.getString("Name")%>" style='margin-bottom: 1em'/><br>
                    UserName: <input type="text" class="form-control" placeholder="UserName" name="userName" value="<%=crs.getString("Uname")%>" style='margin-bottom: 1em'/><br>
                    <!--Password:<input type="password" class="form-control" placeholder="Password" name="password" value="<%=crs.getString("pass")%>" required/><br>-->
                    Email: <input type="text" class="form-control" placeholder="Email" name="email" value="<%=crs.getString("Email")%>" style='margin-bottom: 1em'/><br>
                    College <input type="text" class="form-control" placeholder="College" name="college" value="<%=crs.getString("College")%>" style='margin-bottom: 1em'/><br>
                    Phone: <input type='text' class="form-control" placeholder="Phone" name='phone' value="<%=crs.getString("Phone")%>" style='margin-bottom: 1em'/><br>
                    <% } %>
                    <input type='submit' class="btn btn-info" value='Submit' name="submit">
                </div>
            </fieldset>
        </form><br>
        <div>
            <p>
                <a href="welcomeStudent.jsp"> Back</a>
            </p>

        </div>

    </body>
</html>

<% } else {
        response.sendRedirect("index.jsp");
    }
%>
