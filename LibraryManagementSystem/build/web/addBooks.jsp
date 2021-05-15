<%-- 
    Document   : addBooks
    Created on : May 10, 2021, 9:27:16 PM
    Author     : Yash Gaikwad
--%>

<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Add Books</h1>
        
        <form action="#">
        <fieldset>
            
                <legend>Book details</legend>
                <div class="col-sm-4">
                    Book Title: <input type="text" class="form-control" placeholder="Book Title" name="title" value="" style='margin-bottom: 1em'/><br>
                    ISBN: <input type="number" class="form-control" placeholder="Book ISBN" name="isbn" value="" style='margin-bottom: 1em'/><br>
                    Publisher Name: <input type="text" class="form-control" placeholder="Book Publisher Name" name="publisherName" value="" style='margin-bottom: 1em'/><br>
                    Genre: <input type="text" class="form-control" placeholder="Book Genre" name="genre" value="" style='margin-bottom: 1em'/><br>
                    Author Name: <input type='text' class="form-control" placeholder="Book Author Name" name='authorName' value="" style='margin-bottom: 1em'/><br>
            <input type='submit' class="btn btn-info" value='Submit' name="submit">
            <input type="reset" class="btn btn-warning" value="Reset" name="reset">
            </div>
            </fieldset>
                </form>
                <div>
                    <p>
                        <a href="#"> Back</a>
                    </p>
                    
                </div>
          
    </body>
</html>
