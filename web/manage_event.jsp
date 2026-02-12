<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

<div class="landing-card" style="max-width:1200px; width:100%;">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="m-0">Manage Events</h1>
            <p class="mb-0">Create and control university events</p>
        </div>

        <a href="add_event.jsp" 
           class="button landing-btn button-green">
           + Add Event
        </a>
    </div>

    <!-- Table Wrapper -->
    <div style="background:rgba(255,255,255,0.1); padding:20px; border-radius:20px;">

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Organizer</th>
                    <th>Participant</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

            <c:forEach var="e" items="${events}">
                <tr>
                    <td>${e.name}</td>
                    <td>${e.date}</td>
                    <td>${e.organizer}</td>
                    <td>${e.participant}</td>

                    <td>
                        <c:choose>
                            <c:when test="${e.status == 'PUBLISHED'}">
                                <span style="color:#22c55e;">PUBLISHED</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color:#facc15;">DRAFT</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>

                        <a href="EditEventServlet?id=${e.id}" 
                           class="button landing-btn">
                            Edit
                        </a>

                        <c:if test="${e.status != 'PUBLISHED'}">
                            <a href="PublishEventServlet?id=${e.id}" 
                               class="button landing-btn"
                               style="background:linear-gradient(135deg,#facc15,#eab308);">
                               Publish
                            </a>
                        </c:if>

                        <a href="DeleteEventServlet?id=${e.id}" 
                           class="button landing-btn"
                           style="background:linear-gradient(135deg,#ef4444,#dc2626);"
                           onclick="return confirm('Delete this event?')">
                           Delete
                        </a>

                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>

    <!-- Back Button -->
    <div class="mt-4">
        <a href="AdminDashboardServlet" 
           class="button landing-btn">
            Back to Dashboard
        </a>
    </div>

</div>

</div>

</body>
</html>
