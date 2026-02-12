package com.login;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StudentDashboardServlet")
public class StudentDashboardServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/CLUBS";
    private static final String DB_USER = "app";
    private static final String DB_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || !"STUDENT".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String matric = (String) session.getAttribute("user");

        List<String> approvedClubs = new ArrayList<>();
        List<Event> upcomingEvents = new ArrayList<>();

        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            // ===============================
            // 1️⃣ Approved Clubs
            // ===============================
            String clubSql = "SELECT c.CLUB_NAME " +
                             "FROM APP.CLUB_APPLICATION a " +
                             "JOIN APP.CLUBS c ON a.CLUB_ID = c.CLUB_ID " +
                             "WHERE a.STUDENT_MATRIC = ? AND a.STATUS = 'APPROVED'";

            PreparedStatement ps1 = conn.prepareStatement(clubSql);
            ps1.setString(1, matric);
            ResultSet rs1 = ps1.executeQuery();

            while (rs1.next()) {
                approvedClubs.add(rs1.getString("CLUB_NAME"));
            }

            rs1.close();
            ps1.close();

            // ===============================
            // 2️⃣ Upcoming Events
            // ===============================
            String eventSql = "SELECT * FROM APP.EVENT " +
                              "WHERE EVENT_DATE >= CURRENT_DATE " +
                              "AND STATUS = 'PUBLISHED' " +
                              "ORDER BY EVENT_DATE ASC";

            PreparedStatement ps2 = conn.prepareStatement(eventSql);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {
                Event e = new Event();
                e.setEventName(rs2.getString("EVENT_NAME"));
                e.setEventDate(rs2.getDate("EVENT_DATE"));
                e.setOrganizer(rs2.getString("ORGANIZER"));
                e.setDescription(rs2.getString("DESCRIPTION"));
                upcomingEvents.add(e);
            }

            rs2.close();
            ps2.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("approvedClubs", approvedClubs);
        request.setAttribute("upcomingEvents", upcomingEvents);

        request.getRequestDispatcher("student_dashboard.jsp")
               .forward(request, response);
    }
}
