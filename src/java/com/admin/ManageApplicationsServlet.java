package com.admin;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ManageApplicationsServlet")
public class ManageApplicationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 ADMIN protection
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Map<String, String>> applications = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql =
                "SELECT a.ID, s.NAME, c.CLUB_NAME, a.STATUS " +
                "FROM CLUB_APPLICATION a " +
                "LEFT JOIN STUDENT s ON a.STUDENT_MATRIC = s.MATRIC " +
                "Left JOIN CLUBS c ON a.CLUB_ID = c.CLUB_ID";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("ID"));
                row.put("student", rs.getString("NAME"));
                row.put("club", rs.getString("CLUB_NAME"));
                row.put("status", rs.getString("STATUS"));
                applications.add(row);
            }

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        // ✅ SET DATA
        request.setAttribute("applications", applications);

        // ✅ ONE forward, AT THE END
        request.getRequestDispatcher("/manage_applications.jsp")
               .forward(request, response);
    }
}
