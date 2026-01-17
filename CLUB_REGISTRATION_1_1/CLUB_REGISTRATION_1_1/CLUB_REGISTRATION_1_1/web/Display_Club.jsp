<%-- 
    Document   : Display_Club
    Created on : Jan 5, 2026, 12:26:45 PM
    Author     : User
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.BrowseClub.Club" %>

<!DOCTYPE html>
<html>
<head>
    <title>Browse Clubs</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<div class="page-header">
    <h2>Available Clubs</h2>
</div>
 
    <div class="search-box">
    <input 
        type="text" 
        id="searchInput" 
        placeholder="Search club or advisor..."
        onkeyup="filterClubs()"
    >
   
</div>
 
    
<div class="card">
<table>
  <tr>
    <th>Club Name</th>
    <th>Advisor</th>
    <th>Action</th>
  </tr>

<%
  List<Club> clubList = (List<Club>) request.getAttribute("clubList");
  if (clubList != null) {
      for (Club c : clubList) {
%>
  <tr>
    <td><%= c.getName() %></td>
    <td><%= c.getAdvisor() %></td>
    <td>
     <a class="button" href="ClubDetailServlet?id=<%= c.getId() %>">
    View Details
</a>
    
    </td>
  </tr>
<%
      }
  }
%>

</table>
</div> <!-- card -->




<div class="back-btn">
    <a href="StudentDashboardServlet" class="button">
        Back to Dashboard
    </a>
</div>


</div> <!-- container -->
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
