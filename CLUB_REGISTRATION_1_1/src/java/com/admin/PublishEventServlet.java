package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PublishEventServlet")
public class PublishEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Admin security check
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 1️⃣ Get event ID
        String id = request.getParameter("id");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            // 2️⃣ Update status to PUBLISHED
            String sql = "UPDATE EVENT SET STATUS='PUBLISHED' WHERE EVENT_ID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            conn.close();

            // 3️⃣ Go back to manage event page
            response.sendRedirect("ManageEventServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
