<%-- 
    Document   : addPublishers
    Created on : May 10, 2021, 9:28:34 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (session.getAttribute("userID") != null) {
        if (request.getParameter("submit") != null) {

            String publisherName = request.getParameter("publisherName");

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (ClassNotFoundException ex) {
            }

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(beans.Singleton.getDbURL());
            crs.setUsername(beans.Singleton.getUser());
            crs.setPassword(beans.Singleton.getPass());

            crs.setCommand("Insert into publishers (publishername) values (?)");
            crs.setString(1, publisherName);
            crs.execute(); %>
<script>
    alert("Publisher has been SUCCESSFULLY added !");
    window.location = "welcomeAdmin.jsp";
</script>
//           response.sendRedirect("welcomeAdmin.jsp");
<%}

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Add Publishers</h1>

        <form action="#">
            <fieldset>            
                <legend>Book details</legend>
                <div class="col-sm-4">
                    Publisher Name: <input type="text" class="form-control" placeholder="Book Publisher Name" name="publisherName" value="" style='margin-bottom: 1em' required/><br>
                    <input type='submit' class="btn btn-info" value='Submit' name="submit">
                </div>
            </fieldset>
        </form><br>
        <div>
            <p>
                <a href="welcomeAdmin.jsp">Back</a>
            </p>

        </div>

    </body>
</html>


<% } else {
        response.sendRedirect("index.jsp");
    }
%>
