package com.login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Always show login page on GET
        request.getRequestDispatcher("login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String matric = request.getParameter("matric");
        String password = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CLUBS", "app", "app"
            );

            String sql = "SELECT * FROM STUDENT WHERE MATRIC=? AND PASSWORD=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matric);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
             HttpSession session = request.getSession();

session.setAttribute("user", matric);
session.setAttribute("role", rs.getString("ROLE")); // THIS LINE
session.setAttribute("studentName", rs.getString("NAME"));

String role = rs.getString("ROLE");

if ("ADMIN".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() +  "/AdminDashboardServlet");
} else {
    response.sendRedirect(request.getContextPath() + "/StudentDashboardServlet");
}

            } else {
                request.setAttribute("error", "Invalid matric or password");
                request.getRequestDispatcher("login.jsp")
                       .forward(request, response);
            }

            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
