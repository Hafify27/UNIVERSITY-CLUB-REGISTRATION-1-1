package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddClubServlet")
public class AddClubServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* =========================
           1. SECURITY CHECK (ADMIN)
           ========================= */
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        /* =========================
           2. READ FORM DATA
           ========================= */
        String clubName = request.getParameter("clubName");
        String description = request.getParameter("description");
        String advisor = request.getParameter("advisor");

        /* =========================
           3. BASIC VALIDATION
           ========================= */
        if (clubName == null || clubName.trim().isEmpty()) {
            request.setAttribute("error", "Club name is required");
            request.getRequestDispatcher("add_club.jsp").forward(request, response);
            return;
        }

        /* =========================
           4. DATABASE INSERT
           ========================= */
        try {
            // Load Derby driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Connect to database
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            // SQL INSERT
            String sql = "INSERT INTO CLUBS (CLUB_NAME, DESCRIPTION, ADVISOR) "
                       + "VALUES (?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, clubName);
            ps.setString(2, description);
            ps.setString(3, advisor);

            ps.executeUpdate();

            conn.close();

            /* =========================
               5. REDIRECT AFTER SUCCESS
               ========================= */
            response.sendRedirect("ManageClubServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
