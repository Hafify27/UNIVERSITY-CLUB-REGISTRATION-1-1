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
<style>
    body {
        padding-top: 70px; /* height of navbar */
    }
    
    .stat-card {
        height: 160px;
        width: 160px;
    }
</style>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm mb-3">
        <div class="container-fluid">
            <span class="navbar-brand fw-bold">
                Admin Panel
            </span>

            <div class="ms-auto d-flex align-items-center">
                <span class="text-white me-3">
                    Welcome, ${sessionScope.studentName}
                </span>
                <a href="LogoutServlet" class="btn btn-outline-light btn-sm">
                    Logout
                </a>
            </div>
        </div>
    </nav>
    <div class="container py-5">
        <div class="d-flex gap-3 justify-content-center">
            <div class="d-flex row row-cols-2 g-3">
                <div class="cols">
                    <div class=" card text-center shadow-sm">
                        <div class="card-body">
                            <h6 class="text-muted">Total Applications</h6>
                            <h3 class="fw-bold">${total}</h3>
                        </div>
                    </div>
                </div>
                <div class="cols">
                    <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Pending</h6>
                        <h3 class="fw-bold text-warning">${pending}</h3>
                    </div>
                </div>
                </div>
                <div class="cols">
                    <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Approved</h6>
                        <h3 class="fw-bold text-success">${approved}</h3>
                    </div>
                </div>
                </div>
                <div class="cols">
                    <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Rejected</h6>
                        <h3 class="fw-bold text-danger">${rejected}</h3>
                    </div>
                </div>
                </div>
            </div>
            <div class="">
                <div class="card shadow-sm">
                    <div class="card-body d-flex vstack">
                        <h5 class="mb-3 text-center">Actions</h5>
                        <a href="ManageApplicationsServlet" class="btn btn-primary mb-3">
                            Manage Applications
                        </a>
                        <a href="ManageEventServlet" class="btn btn-success mb-3">
                            Manage Events
                        </a>

                        <a href="ManageClubServlet" class="btn btn-success mb-3">
                            Manage Clubs
                        </a>
                    </div>
                </div>
            </div>
        </div>
       
    </div>

</body>
</html>
