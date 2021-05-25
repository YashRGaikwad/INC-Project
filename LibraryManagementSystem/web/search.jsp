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
//        crs1.setCommand("select * from books");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <form action="#">
                <table class="table table-responsive table-bordered" width = 100% border="10px">
                    <thead>
                        <tr>
                            <th>Books</th>
                            <th>ISBN</th>
                            <th>Genre</th>
                            <th>Issue</th>
                        </tr>
                    </thead>
                    <% while (crs1.next()) {

                            String isbn = crs1.getString("ISBN");
                            //            int booksID = crs.getInt("booksID");

                    %>    
                    <tr>
                        <td><%=crs1.getString("Title")%><p><a href="bookDetails.jsp?isbn=<%=isbn%>">See more...</a></p></td>
                        <td><%=crs1.getString("ISBN")%></td>
                        <td><%=crs1.getString("Genre")%></td>
                        <!--<td><a href="issueBooks.jsp?isbn=<%=isbn%>">Issue</a></td>-->
                        <td><input type="checkbox" name="selectedBooks" value="<%=crs1.getString("ISBN")%>">Issue</td>
                    </tr>
                    <% }
                    %>   

                </table>
                <input type='submit' class="btn btn-info" value='Submit' name="submit">
                <input type="reset" class="btn btn-warning" value="Reset" name="reset">
            </form>
        </div>
    </body>
</html>
