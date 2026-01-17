package com.BrowseClub;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String matric = request.getParameter("matric");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        // Password check
        if (!password.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/CLUBS", "app", "app");

            PreparedStatement checkStmt =
                    conn.prepareStatement("SELECT 1 FROM STUDENT WHERE MATRIC = ?");
            checkStmt.setString(1, matric);

            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "Matric number already registered");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO STUDENT (NAME, MATRIC, EMAIL, PASSWORD, ROLE) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, matric);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, "STUDENT");
            ps.executeUpdate();

            ps.close();
            checkStmt.close();
            conn.close();

            request.setAttribute("success", true);
            request.getRequestDispatcher("Register.jsp").forward(request, response);

        } catch (SQLIntegrityConstraintViolationException e) {
            request.setAttribute("error", "Matric number already registered");
            request.getRequestDispatcher("Register.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }
}
