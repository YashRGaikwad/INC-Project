<%-- 
    Document   : deleteStudent
    Created on : May 11, 2021, 1:48:26 AM
    Author     : Yash Gaikwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<!DOCTYPE html>


<%

    int studentID = Integer.valueOf(request.getParameter("studentID"));
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException ex) {
    }

    CachedRowSet crs1 = RowSetProvider.newFactory().createCachedRowSet();
    crs1.setUrl(beans.Singleton.getDbURL());
    crs1.setUsername(beans.Singleton.getUser());
    crs1.setPassword(beans.Singleton.getPass());

    crs1.setCommand("Delete from students where userID=?");
    crs1.setInt(1, studentID);
    crs1.execute();
    response.sendRedirect("studentsList.jsp");


%>

