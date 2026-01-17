package com.admin;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ManageEventServlet")
public class ManageEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, String>> events = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM EVENT ORDER BY EVENT_DATE DESC";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Map<String, String> e = new HashMap<>();
                e.put("id", rs.getString("EVENT_ID"));
                e.put("name", rs.getString("EVENT_NAME"));
                e.put("date", rs.getString("EVENT_DATE"));
                e.put("organizer", rs.getString("ORGANIZER"));
                e.put("participant", rs.getString("PARTICIPANT"));
                e.put("status", rs.getString("STATUS"));
                events.add(e);
            }

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.setAttribute("events", events);
        request.getRequestDispatcher("manage_event.jsp").forward(request, response);
    }
}
