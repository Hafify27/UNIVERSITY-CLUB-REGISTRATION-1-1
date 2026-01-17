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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="align-content-center vh-100">
    <div class="container">
        <div class="card" style="max-width:500px; margin:auto;">
            <div class="p-3">
               <h1 class="text-center">Student Login</h1>
            <% if (request.getAttribute("error") != null) { %>
                <p style="color:red;"><%= request.getAttribute("error") %></p>
            <% } %>
            <form action="LoginServlet" method="post">
                <input class="form-control mb-2" type="text" name="matric" placeholder="Matric" required>
                <input class="form-control mb-2" type="password" name="password" placeholder="Password" required>
                <div class="d-flex">
                <button class="btn btn-primary ms-auto" type="submit">Login</button>
                </div>
            </form>
            <p style="margin-top:15px;">
                Don’t have an account?
                <a href="Register.jsp">Register</a>
            </p> 
            </div>
        </div>
    </div>
</body>
</html>
