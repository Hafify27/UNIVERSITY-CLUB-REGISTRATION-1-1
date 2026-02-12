<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Student Registration</h1>
        <p>Create your account to join clubs</p>

        <% if (request.getAttribute("success") != null) { %>
            <p style="color:#4ade80; font-weight:600;">
                Registration successful! You may now login.
            </p>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <p style="color:#ff6b6b; font-weight:600;">
                <%= request.getAttribute("error") %>
            </p>
        <% } %>

        <form action="RegisterServlet" method="post" style="margin-top:20px;">

            <input type="text" name="name" placeholder="Full Name"
                   class="login-input" required>

            <input type="text" name="matric" placeholder="Matric Number"
                   class="login-input" required>

            <input type="email" name="email" placeholder="Email"
                   class="login-input" required>

            <input type="password" name="password" placeholder="Password"
                   class="login-input" required>

            <input type="password" name="confirm" placeholder="Confirm Password"
                   class="login-input" required>

            <button type="submit" class="button landing-btn"
                    style="margin-top:15px;">
                Register
            </button>

        </form>

        <p style="margin-top:20px; font-size:14px;">
            Already have an account?
            <a href="login.jsp" style="color:#ffffff; font-weight:600;">
                Login
            </a>
        </p>

    </div>

</div>

</body>
</html>
