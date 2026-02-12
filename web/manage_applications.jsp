<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Applications</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

<div class="landing-card" style="max-width:1100px; width:100%;">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="m-0">Club Applications</h1>
            <p class="mb-0">Manage student applications</p>
        </div>

        <a href="AdminDashboardServlet" 
           class="button landing-btn">
            Main Page
        </a>
    </div>

    <!-- Table -->
    <div style="background:rgba(255,255,255,0.1); padding:20px; border-radius:20px;">

        <table>
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Club</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

            <%
                List<Map<String,String>> apps =
                    (List<Map<String,String>>) request.getAttribute("applications");

                if (apps != null) {
                    for (Map<String,String> a : apps) {
            %>

                <tr>
                    <td><%= a.get("student") %></td>
                    <td><%= a.get("club") %></td>
                    <td>
                        <% if ("PENDING".equals(a.get("status"))) { %>
                            <span style="color:#facc15;">PENDING</span>
                        <% } else if ("APPROVED".equals(a.get("status"))) { %>
                            <span style="color:#22c55e;">APPROVED</span>
                        <% } else { %>
                            <span style="color:#ef4444;">REJECTED</span>
                        <% } %>
                    </td>

                    <td>
                        <% if ("PENDING".equals(a.get("status"))) { %>

                            <a class="button landing-btn button-green"
                               href="UpdateStatusServlet?id=<%=a.get("id")%>&status=APPROVED">
                               Approve
                            </a>

                            <a class="button landing-btn"
                               style="background:linear-gradient(135deg,#ef4444,#dc2626);"
                               href="UpdateStatusServlet?id=<%=a.get("id")%>&status=REJECTED">
                               Reject
                            </a>

                        <% } %>
                    </td>
                </tr>

            <% } } %>

            </tbody>
        </table>

    </div>

</div>

</div>

</body>
</html>
