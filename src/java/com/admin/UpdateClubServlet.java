package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateClubServlet")
public class UpdateClubServlet extends HttpServlet {

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

            String sql = "UPDATE CLUBS SET CLUB_NAME=?, DESCRIPTION=?, ADVISOR=? WHERE CLUB_ID=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, request.getParameter("clubName"));
            ps.setString(2, request.getParameter("description"));
            ps.setString(3, request.getParameter("advisor"));
            ps.setInt(4, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

            conn.close();

            response.sendRedirect("ManageClubServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
