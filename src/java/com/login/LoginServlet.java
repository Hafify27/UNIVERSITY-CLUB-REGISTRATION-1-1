package com.login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

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

            String sql = "SELECT * FROM STUDENT WHERE matric=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matric);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // LOGIN SUCCESS
                HttpSession session = request.getSession();
                
                session.setAttribute("user", matric);
            session.setAttribute("studentName", rs.getString("name"));
              session.setAttribute("studentMatric", matric);

                response.sendRedirect("StudentDashboardServlet");
            } else {
                // LOGIN FAILED
                request.setAttribute("error", "Invalid Matric Number or Password");
                request.getRequestDispatcher("login.jsp")
                       .forward(request, response);
            }

            conn.close();

        } catch (Exception e) {
    e.printStackTrace();
    request.setAttribute("error", "System error. Please try again.");
    request.getRequestDispatcher("login.jsp").forward(request, response);

}

    }
}
