<%-- 
    Document   : student_dashboard
    Created on : Jan 13, 2026, 10:50:52 AM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <div class="page-header">
        <h2>Student Dashboard</h2>
        <p>Welcome to the University Club Management System</p>
    </div>

    <div class="card" style="text-align:center;">

        <a href="ClubServlet" class="button">
            Browse Clubs
        </a>

        <br><br>

        <a href="LogoutServlet" class="button danger">
            Logout
        </a>

    </div>

</div>

</body>
</html>
