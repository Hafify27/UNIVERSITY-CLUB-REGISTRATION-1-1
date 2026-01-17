package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String organizer = request.getParameter("organizer");
        String participant = request.getParameter("participant");
        String description = request.getParameter("description");
        String contact = request.getParameter("contact");

        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");

           
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

          
            String sql = "INSERT INTO EVENT "
                       + "(EVENT_NAME, EVENT_DATE, ORGANIZER, PARTICIPANT, DESCRIPTION, CONTACT_PERSON, STATUS) "
                       + "VALUES (?, ?, ?, ?, ?, ?, 'DRAFT')";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, eventName);
            ps.setDate(2, Date.valueOf(eventDate)); 
            ps.setString(3, organizer);
            ps.setString(4, participant);
            ps.setString(5, description);
            ps.setString(6, contact);

            ps.executeUpdate();

            conn.close();

            
            response.sendRedirect("ManageEventServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
