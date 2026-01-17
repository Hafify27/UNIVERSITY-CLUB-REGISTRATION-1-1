package com.admin;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ManageClubServlet")
public class ManageClubServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, String>> clubs = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM CLUBS";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Map<String, String> c = new HashMap<>();
                c.put("id", rs.getString("CLUB_ID"));
                c.put("name", rs.getString("CLUB_NAME"));
                c.put("desc", rs.getString("DESCRIPTION"));
                c.put("advisor", rs.getString("ADVISOR"));
                clubs.add(c);
            }

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.setAttribute("clubs", clubs);
        request.getRequestDispatcher("manage_club.jsp").forward(request, response);
    }
}
