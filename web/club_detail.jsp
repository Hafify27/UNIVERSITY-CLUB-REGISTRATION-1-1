<%@ page import="com.BrowseClub.Club" %>

<!DOCTYPE html>
<html>
<head>
    <title>Club Details</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

<div class="landing-card" style="max-width:700px; width:100%;">

    <h1>Club Details</h1>
    <p>Explore more about this club</p>

    <%
        Club club = (Club) request.getAttribute("club");
        if (club != null) {
    %>

        <div style="text-align:left; margin-top:25px;">

            <p><strong>Club Name:</strong><br>
                <span style="opacity:0.9;"><%= club.getName() %></span>
            </p>

            <p><strong>Advisor:</strong><br>
                <span style="opacity:0.9;"><%= club.getAdvisor() %></span>
            </p>

            <p><strong>Description:</strong><br>
                <span style="opacity:0.9;"><%= club.getDescription() %></span>
            </p>

        </div>

        <div style="margin-top:30px;">

            <a href="ClubServlet" class="button landing-btn">
                Back to Clubs
            </a>

            <form action="ApplyClubServlet" method="post" 
                  style="display:inline;">
                <input type="hidden" name="clubId" 
                       value="<%= club.getId() %>">
                <button type="submit" 
                        class="button landing-btn button-green"
                        style="margin-left:10px;">
                    Apply Club
                </button>
            </form>

        </div>

    <%
        } else {
    %>
        <p style="margin-top:20px;">Club not found.</p>
        <a href="ClubServlet" class="button landing-btn">
            Back to Clubs
        </a>
    <%
        }
    %>

</div>

</div>

</body>
</html>
