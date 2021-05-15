package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.sql.rowset.RowSetProvider;
import javax.sql.rowset.CachedRowSet;

public final class addBooks_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Update Books</h1>\n");
      out.write("        \n");
      out.write("        <form action=\"#\">\n");
      out.write("        <fieldset>\n");
      out.write("            \n");
      out.write("            ");
 

            try {
              Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
        }
            
      out.write("\n");
      out.write("            \n");
      out.write("                <legend>Book details</legend>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    Book Title: <input type=\"text\" class=\"form-control\" placeholder=\"Book Title\" name=\"title\" value=\"\" style='margin-bottom: 1em'/><br>\n");
      out.write("                    ISBN: <input type=\"number\" class=\"form-control\" placeholder=\"Book ISBN\" name=\"isbn\" value=\"\" style='margin-bottom: 1em'/><br>\n");
      out.write("                    Publisher Name: <input type=\"number\" class=\"form-control\" placeholder=\"Book Publisher Name\" name=\"publisherName\" value=\"\" style='margin-bottom: 1em'/><br>\n");
      out.write("                    Genre: <input type=\"text\" class=\"form-control\" placeholder=\"Book Genre\" name=\"genre\" value=\"\" style='margin-bottom: 1em'/><br>\n");
      out.write("                    Author Name: <input type='number' class=\"form-control\" placeholder=\"Book Author Name\" name='authorName' value=\"\" style='margin-bottom: 1em'/><br>\n");
      out.write("            <input type='submit' class=\"btn btn-info\" value='Submit' name=\"submit\">\n");
      out.write("            <input type=\"reset\" class=\"btn btn-warning\" value=\"Reset\" name=\"reset\">\n");
      out.write("            </div>\n");
      out.write("            </fieldset>\n");
      out.write("                </form>\n");
      out.write("                <div>\n");
      out.write("                    <p>\n");
      out.write("                        <a href=\"welcomeAdmin.jsp\"> Back</a>\n");
      out.write("                    </p>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("          \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
