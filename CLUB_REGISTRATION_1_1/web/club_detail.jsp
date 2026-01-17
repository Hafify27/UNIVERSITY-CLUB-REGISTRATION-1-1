<%-- 
    Document   : club_details
    Created on : Jan 5, 2026, 3:10:09 PM
    Author     : User
--%>
<%@ page import="com.BrowseClub.Club" %>

<!DOCTYPE html>
<html>
<head>
    <title>Club Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <div class="page-header">
        <h2>Club Details</h2>
    </div>

    <div class="card">
        <%
            Club club = (Club) request.getAttribute("club");
            if (club != null) {
        %>
            <p><strong>Club Name:</strong> <%= club.getName() %></p>
            <p><strong>Advisor:</strong> <%= club.getAdvisor() %></p>
            <p><strong>Description:</strong> <%= club.getDescription() %></p>
        <%
            } else {
        %>
            <p>Club not found.</p>
        <%
            }
        %>

        <br>
     
    <a href="ClubServlet" class="button">Back to Clubs</a>

    <form action="ApplyClubServlet" method="post" style="display:inline;">
        <input type="hidden" name="clubId" value="<%= club.getId() %>">
        <button type="submit" class="button">
            Apply Club
        </button>
    </form>
</div>
    
    </div>

</div>

</body>
</html>
