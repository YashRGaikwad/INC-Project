/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Yash Gaikwad
 */
public class checkAdmin extends HttpServlet {

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
            
            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(beans.Singleton.getDbURL());
            crs.setUsername(beans.Singleton.getUser());
            crs.setPassword(beans.Singleton.getPass());
            crs.setCommand("select userid, uname, pass from users where Uname like ? and pass like ?");
            
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet validate</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Yash " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
                
                String user = request.getParameter("username");
                String password = request.getParameter("password");
                out.println("<p>"+user+"</p>");
                out.println("<p>"+password+"</p>");


                String s = new String(password);
                byte[] bytesOfMessage = s.getBytes("UTF-8");
                MessageDigest md = MessageDigest.getInstance("MD5");
                byte[] thedigest = md.digest(bytesOfMessage);
                BASE64Encoder encoder = new BASE64Encoder();
                String hashcode = encoder.encode(thedigest);
                System.out.println(encoder.encode(thedigest));
                out.println("<p>"+encoder.encode(thedigest)+"</p>");

                crs.setString(1, user);
                crs.setString(2, encoder.encode(thedigest));
                crs.execute();
                HttpSession session = request.getSession();
                
                 while (crs.next()) {
                    if (user.equals(crs.getString("uname")) && hashcode.equals(crs.getString("pass"))) {
                        out.println("<p>Login Success</p>");
                        session.setAttribute("userID", crs.getInt("UserID"));
                        response.sendRedirect("welcomeAdmin.jsp");
                    }
                }
                 
                out.println("<p>Login Failed</p>");
                //out.println(crs.getString("password"));
                out.println("<a href='index.jsp'>Return to login</a>");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(checkAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }
        }   catch (SQLException ex) {
            Logger.getLogger(checkAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void init() throws ServletException {
        try {
          Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
