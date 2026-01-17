package com.BrowseClub;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ApplyClubServlet")
public class ApplyClubServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String matric = (String) session.getAttribute("user");
        int clubId = Integer.parseInt(request.getParameter("clubId"));

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "INSERT INTO CLUB_APPLICATION (STUDENT_MATRIC, CLUB_ID, STATUS) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matric);
            ps.setInt(2, clubId);
            ps.setString(3, "PENDING");

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("StudentDashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
