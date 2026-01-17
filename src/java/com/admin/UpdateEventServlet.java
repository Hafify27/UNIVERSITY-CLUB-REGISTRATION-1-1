package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateEventServlet")
public class UpdateEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "UPDATE EVENT SET EVENT_NAME=?, EVENT_DATE=?, ORGANIZER=?, PARTICIPANT=?, "
                       + "DESCRIPTION=?, CONTACT_PERSON=? WHERE EVENT_ID=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getParameter("eventName"));
            ps.setDate(2, Date.valueOf(request.getParameter("eventDate")));
            ps.setString(3, request.getParameter("organizer"));
            ps.setString(4, request.getParameter("participant"));
            ps.setString(5, request.getParameter("description"));
            ps.setString(6, request.getParameter("contact"));
            ps.setInt(7, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("ManageEventServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
