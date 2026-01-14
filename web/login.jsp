<%-- 
    Document   : login
    Created on : Jan 13, 2026, 10:33:12 AM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <div class="card" style="max-width:500px; margin:auto;">

        <h2>Student Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>

        <form action="LoginServlet" method="post">

            <input type="text" name="matric" placeholder="Matric Number" required>
            <input type="password" name="password" placeholder="Password" required>

            <button type="submit" class="button">Login</button>

        </form>

        <p style="margin-top:15px;">
            Don’t have an account?
            <a href="Register.jsp">Register</a>
        </p>

    </div>
</div>

</body>
</html>
