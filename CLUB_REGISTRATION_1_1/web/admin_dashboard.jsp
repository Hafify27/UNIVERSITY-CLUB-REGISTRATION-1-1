<%-- 
    Document   : admin_dashboard
    Created on : Jan 15, 2026, 9:02:57 AM
    Author     : User
--%>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <!-- Header -->
    <div class="mb-4 text-center">
        <h2 class="fw-bold">Admin Dashboard</h2>
        <p class="text-muted">Welcome, ${sessionScope.studentName}</p>
    </div>

    <!-- Statistics Cards -->
    <div class="row g-3 mb-4">

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Total Applications</h6>
                    <h3 class="fw-bold">${total}</h3>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Pending</h6>
                    <h3 class="fw-bold text-warning">${pending}</h3>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Approved</h6>
                    <h3 class="fw-bold text-success">${approved}</h3>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Rejected</h6>
                    <h3 class="fw-bold text-danger">${rejected}</h3>
                </div>
            </div>
        </div>

    </div>

    <!-- Action Buttons -->
    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="mb-3">Admin Actions</h5>

            <a href="ManageApplicationsServlet" class="btn btn-primary me-2">
                Manage Applications
            </a>
            
            <a href="ManageEventServlet" class="btn btn-success me-2">
    Manage Events
</a>

                <a href="ManageClubServlet" class="btn btn-success me-2">
   Manage Clubs
</a>

            <a href="LogoutServlet" class="btn btn-outline-danger">
                Logout
            </a>
        </div>
    </div>

</div>

</body>
</html>
