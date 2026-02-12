<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay" style="flex-direction:column; padding:40px;">

    <!-- Glass Navbar -->
    <div class="landing-card mb-4" style="width:100%; max-width:1100px; padding:20px 30px;">
        <div class="d-flex justify-content-between align-items-center">
            <h4 class="m-0">Admin Panel</h4>
            <div>
                <span class="me-3">
                    Welcome, ${sessionScope.studentName}
                </span>
                <a href="LogoutServlet" 
                   class="button landing-btn"
                   style="background: linear-gradient(135deg,#ef4444,#dc2626);">
                    Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="landing-card" style="max-width:1100px; width:100%;">

        <h2 class="mb-4">Dashboard Overview</h2>

        <div class="row g-4">

            <!-- Stats Section -->
            <div class="col-md-8">
                <div class="row g-3">

                    <div class="col-md-6">
                        <div class="p-4 rounded-4 text-center"
                             style="background:rgba(255,255,255,0.15);">
                            <h6>Total Applications</h6>
                            <h2 class="fw-bold">${total}</h2>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="p-4 rounded-4 text-center"
                             style="background:rgba(255,193,7,0.25);">
                            <h6>Pending</h6>
                            <h2 class="fw-bold">${pending}</h2>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="p-4 rounded-4 text-center"
                             style="background:rgba(34,197,94,0.25);">
                            <h6>Approved</h6>
                            <h2 class="fw-bold">${approved}</h2>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="p-4 rounded-4 text-center"
                             style="background:rgba(239,68,68,0.25);">
                            <h6>Rejected</h6>
                            <h2 class="fw-bold">${rejected}</h2>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Actions Section -->
            <div class="col-md-4">
                <div class="p-4 rounded-4"
                     style="background:rgba(255,255,255,0.15);">

                    <h5 class="mb-4 text-center">Actions</h5>

                    <div class="d-grid gap-3">

                        <a href="ManageApplicationsServlet" 
                           class="button landing-btn text-center">
                            Manage Applications
                        </a>

                        <a href="ManageEventServlet" 
                           class="button landing-btn button-green text-center">
                            Manage Events
                        </a>

                        <a href="ManageClubServlet" 
                           class="button landing-btn text-center">
                            Manage Clubs
                        </a>

                    </div>

                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>
