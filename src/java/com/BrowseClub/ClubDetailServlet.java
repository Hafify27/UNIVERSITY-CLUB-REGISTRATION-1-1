package com.BrowseClub;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ClubDetailServlet")
public class ClubDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int clubId = Integer.parseInt(request.getParameter("id"));
        Club club = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM clubs WHERE club_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clubId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                club = new Club();
                club.setId(rs.getInt("club_id"));
                club.setName(rs.getString("club_name"));
                club.setDescription(rs.getString("description"));
                club.setAdvisor(rs.getString("advisor"));
            }

            request.setAttribute("club", club);
            request.getRequestDispatcher("club_detail.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
