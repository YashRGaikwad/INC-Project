/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Yash Gaikwad
 */
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");

            CachedRowSet crs2 = RowSetProvider.newFactory().createCachedRowSet();
            crs2.setUrl(beans.Singleton.getDbURL());
            crs2.setUsername(beans.Singleton.getUser());
            crs2.setPassword(beans.Singleton.getPass());
            crs2.setCommand("insert into students (uname, name, email,college, pass, phone) values (?,?,?,?,?,?)");
            crs2.setConcurrency(ResultSet.CONCUR_UPDATABLE);

            CachedRowSet crs3 = RowSetProvider.newFactory().createCachedRowSet();
            crs3.setUrl(beans.Singleton.getDbURL());
            crs3.setUsername(beans.Singleton.getUser());
            crs3.setPassword(beans.Singleton.getPass());
            crs3.setCommand("select * from students");

            try (PrintWriter out = response.getWriter()) {
                String password = request.getParameter("pass");

                String s = new String(password);
                byte[] bytesOfMessage = s.getBytes("UTF-8");
                MessageDigest md = MessageDigest.getInstance("MD5");
                byte[] thedigest = md.digest(bytesOfMessage);
                BASE64Encoder encoder = new BASE64Encoder();
                String hashcode = encoder.encode(thedigest);

                /* TODO output your page here. You may use following sample code. */
                crs3.execute();
                //int newsize = crs3.size();
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet register</title>");
                out.println("</head>");
                out.println("<body>");
                boolean flag = true;
                while (crs3.next()) {
                    if (crs3.getString("uname").equals(request.getParameter("uname"))) {
                        out.println("<p>Registration Failed! Username already exists. </p>");
                        out.println("<a href='signUp.html'>Try again</a><br>");
                        out.println("<a href='welcomeStudent.html'>Return to login</a>");
                        flag = false;
                        break;
                    }
                }
                if (flag == true) {
                    crs2.setString(1, request.getParameter("uname"));
                    crs2.setString(2, request.getParameter("name"));
                    crs2.setString(3, request.getParameter("email"));
                    crs2.setString(4, request.getParameter("college"));
                    crs2.setString(5, hashcode);
                    crs2.setString(6, request.getParameter("phone"));
                    crs2.execute();
                    out.println("<p>Registration Success! Login <a href='StudentLogin.jsp'>now</a></p>");
                }
                out.println("</body>");
                out.println("</html>");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void init() throws ServletException {
        try {
           Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
