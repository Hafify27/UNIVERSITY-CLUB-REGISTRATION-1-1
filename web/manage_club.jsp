<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Clubs</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Manage Clubs</h1>
        <p>Admin Panel - Club Management</p>

        <!-- Add Club Button -->
        <div style="margin-bottom:20px;">
            <a href="add_club.jsp" class="button button-green">
                + Add Club
            </a>
        </div>

        <!-- Table -->
        <table>
            <thead>
                <tr>
                    <th>Club Name</th>
                    <th>Description</th>
                    <th>Advisor</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="c" items="${clubs}">
                    <tr>
                        <td>${c.name}</td>
                        <td>${c.desc}</td>
                        <td>
                            ${c.advisor}
                            <div style="margin-top:10px;">
                                <a href="EditClubServlet?id=${c.id}" 
                                   class="button">
                                   Edit
                                </a>

                                <a href="DeleteClubServlet?id=${c.id}"
                                   onclick="return confirm('Delete this club?')"
                                   class="button"
                                   style="background: linear-gradient(135deg, #ef4444, #dc2626);">
                                   Delete
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Back Button -->
        <div class="back-btn">
            <a href="AdminDashboardServlet" class="button">
                Back
            </a>
        </div>

    </div>

</div>

</body>
</html>
