<%@ page import="java.util.List" %>
<%@ page import="com.BrowseClub.Club" %>

<!DOCTYPE html>
<html>
<head>
    <title>Browse Clubs</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

<div class="landing-card" style="max-width:1000px; width:100%;">

    <h1>Available Clubs</h1>
    <p>Explore and join your favorite clubs</p>

    <!-- Search -->
    <div class="search-box">
        <input 
            type="text" 
            id="searchInput" 
            placeholder="Search club or advisor..."
            onkeyup="filterClubs()"
        >
    </div>

    <!-- Table -->
    <div class="card" style="margin-top:20px; background:rgba(255,255,255,0.1);">

    <table>
        <thead>
            <tr>
                <th>Club Name</th>
                <th>Advisor</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
        <%
            List<Club> clubList = (List<Club>) request.getAttribute("clubList");
            if (clubList != null) {
                for (Club c : clubList) {
        %>
            <tr>
                <td><%= c.getName() %></td>
                <td><%= c.getAdvisor() %></td>
                <td>
                    <a class="button"
                       href="ClubDetailServlet?id=<%= c.getId() %>">
                        View Details
                    </a>
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>

    </table>

    </div>

    <!-- Back Button -->
    <div style="margin-top:25px;">
        <a href="StudentDashboardServlet" class="button landing-btn">
            Back to Dashboard
        </a>
    </div>

</div>

</div>

<script>
function filterClubs() {
    const input = document.getElementById("searchInput");
    const filter = input.value.toLowerCase();
    const rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        const clubName = row.cells[0].innerText.toLowerCase();
        const advisor = row.cells[1].innerText.toLowerCase();

        if (clubName.includes(filter) || advisor.includes(filter)) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}
</script>

</body>
</html>
