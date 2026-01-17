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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body  class="align-content-center vh-100">

<div class="container">
    <div class="card p-3">
        <h2  class="text-center">Student Registration</h2>
        <form action="RegisterServlet" method="post">
            <input class="form-control mb-3" type="text" name="name" placeholder="Full Name" required>
            <input class="form-control mb-3" type="text" name="matric" placeholder="Matric Number" required>
            <input class="form-control mb-3" type="email" name="email" placeholder="Email" required>
            <input class="form-control mb-3" type="password" name="password" placeholder="Password" required>
            <input class="form-control mb-3" type="password" name="confirm" placeholder="Confirm Password" required>
            <div class="d-flex">
                <button class="btn btn-primary ms-auto" type="submit">Register</button>
            </div>
        </form>

        <p style="text-align:center; margin-top:15px;">
            Already have an account?
            <a href="login.jsp">Login</a>
        </p>
    </div>
</div>
    <% if (request.getAttribute("success") != null) { %>

    <!-- Success Modal -->
    <div class="modal fade show" id="successModal" tabindex="-1"
         style="display:block; background-color: rgba(0,0,0,0.5);">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Registration Successful</h5>
                </div>
                <div class="modal-body text-center">
                    <p>Your account has been created successfully.</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <a href="login.jsp" class="btn btn-success">Go to Login</a>
                </div>
            </div>
        </div>
    </div>

    <% } %>
    <% if (request.getAttribute("error") != null) { %>

    <!-- Error Modal -->
    <div class="modal fade show" id="errorModal" tabindex="-1" 
         style="display:block; background-color: rgba(0,0,0,0.5);">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Registration Error</h5>
                </div>
                <div class="modal-body text-center">
                    <p><%= request.getAttribute("error") %></p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" 
                            onclick="document.getElementById('errorModal').style.display='none'">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>

    <% } %>
</body>
</html>
