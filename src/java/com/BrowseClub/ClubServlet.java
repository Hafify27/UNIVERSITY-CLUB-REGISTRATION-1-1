package com.BrowseClub;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ClubServlet")
public class ClubServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Club> clubs = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM clubs";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Club c = new Club();
                c.setId(rs.getInt("club_id"));
                c.setName(rs.getString("club_name"));
                c.setDescription(rs.getString("description"));
                c.setAdvisor(rs.getString("advisor"));
                clubs.add(c);
            }

            System.out.println("Clubs found: " + clubs.size());

            request.setAttribute("clubList", clubs);
            request.getRequestDispatcher("Display_Club.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
