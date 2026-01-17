package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("id");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM EVENT WHERE EVENT_ID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getInt("EVENT_ID"));
                request.setAttribute("name", rs.getString("EVENT_NAME"));
                request.setAttribute("date", rs.getDate("EVENT_DATE"));
                request.setAttribute("organizer", rs.getString("ORGANIZER"));
                request.setAttribute("participant", rs.getString("PARTICIPANT"));
                request.setAttribute("description", rs.getString("DESCRIPTION"));
                request.setAttribute("contact", rs.getString("CONTACT_PERSON"));
            }

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.getRequestDispatcher("edit_event.jsp").forward(request, response);
    }
}
