<%-- 
    Document   : Register
    Created on : Jan 13, 2026, 10:24:18 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <div class="card">
        <h2>Student Registration</h2>

        <form action="RegisterServlet" method="post">

            <input type="text" name="name" placeholder="Full Name" required>

            <input type="text" name="matric" placeholder="Matric Number" required>

            <input type="email" name="email" placeholder="Email" required>

            <input type="password" name="password" placeholder="Password" required>

            <input type="password" name="confirm" placeholder="Confirm Password" required>

            <button type="submit" class="button">Register</button>
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <p style="text-align:center; margin-top:15px;">
            Already have an account?
            <a href="login.jsp">Login</a>
        </p>
    </div>

</div>

</body>
</html>
