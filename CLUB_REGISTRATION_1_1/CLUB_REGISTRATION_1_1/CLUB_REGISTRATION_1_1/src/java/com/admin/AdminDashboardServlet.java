package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔐 Admin-only access
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            request.setAttribute("total",
                getCount(conn, "SELECT COUNT(*) FROM CLUB_APPLICATION"));

            request.setAttribute("pending",
                getCount(conn, "SELECT COUNT(*) FROM CLUB_APPLICATION WHERE STATUS='PENDING'"));

            request.setAttribute("approved",
                getCount(conn, "SELECT COUNT(*) FROM CLUB_APPLICATION WHERE STATUS='APPROVED'"));

            request.setAttribute("rejected",
                getCount(conn, "SELECT COUNT(*) FROM CLUB_APPLICATION WHERE STATUS='REJECTED'"));

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.getRequestDispatcher("admin_dashboard.jsp")
               .forward(request, response);
    }

    private int getCount(Connection conn, String sql) throws SQLException {
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        return rs.getInt(1);
    }
}
