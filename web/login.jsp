<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Student Login</h1>
        <p>Please login to continue</p>

        <% if (request.getAttribute("error") != null) { %>
            <p style="color:#ff6b6b; font-weight:600;">
                <%= request.getAttribute("error") %>
            </p>
        <% } %>

        <form action="LoginServlet" method="post" style="margin-top:20px;">

            <input type="text" name="matric" placeholder="Matric Number"
                   class="login-input" required>

            <input type="password" name="password" placeholder="Password"
                   class="login-input" required>

            <button type="submit" class="button landing-btn"
                    style="margin-top:15px;">
                Login
            </button>

        </form>

        <p style="margin-top:20px; font-size:14px;">
            Don’t have an account?
            <a href="Register.jsp" style="color:#ffffff; font-weight:600;">
                Register
            </a>
        </p>

    </div>

</div>

</body>
</html>
