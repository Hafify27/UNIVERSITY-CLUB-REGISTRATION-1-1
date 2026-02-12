<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card" style="max-width:750px; width:100%;">

        <h1>Student Dashboard</h1>
        <p>Welcome, <strong>${sessionScope.studentName}</strong> 👋</p>
        <p>University Club Management System</p>

        <div style="margin-top:25px;">

            <a href="ClubServlet" class="button landing-btn">
                Browse Clubs
            </a>

            <a href="LogoutServlet" class="button landing-btn"
               style="background:linear-gradient(135deg,#ef4444,#dc2626); margin-left:10px;">
                Logout
            </a>

        </div>

        <!-- ===================== -->
        <!-- Approved Clubs Section -->
        <!-- ===================== -->

        <hr style="margin:30px 0; border-color: rgba(255,255,255,0.2);">

        <h3 style="margin-bottom:15px;">My Approved Clubs</h3>

        <c:choose>
            <c:when test="${empty approvedClubs}">
                <p style="opacity:0.9;">
                    You have not joined any approved clubs yet.
                </p>
            </c:when>

            <c:otherwise>
                <ul style="list-style:none; padding:0;">
                    <c:forEach var="club" items="${approvedClubs}">
                        <li style="
                            background: rgba(255,255,255,0.15);
                            padding:12px;
                            margin-bottom:10px;
                            border-radius:12px;">
                            ${club}
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>


        <!-- ===================== -->
        <!-- Upcoming Events Section -->
        <!-- ===================== -->

        <hr style="margin:30px 0; border-color: rgba(255,255,255,0.2);">

        <h3 style="margin-bottom:15px;">Upcoming Events</h3>

        <c:choose>
            <c:when test="${empty upcomingEvents}">
                <p style="opacity:0.9;">
                    No upcoming events available.
                </p>
            </c:when>

            <c:otherwise>
                <c:forEach var="event" items="${upcomingEvents}">
                    <div style="
                        background: rgba(255,255,255,0.15);
                        padding:15px;
                        margin-bottom:15px;
                        border-radius:12px;">

                        <h5 style="margin-bottom:5px;">
                            ${event.eventName}
                        </h5>

                        <p style="margin:5px 0;">
                            <strong>Date:</strong> ${event.eventDate}
                        </p>

                        <p style="margin:5px 0;">
                            <strong>Organizer:</strong> ${event.organizer}
                        </p>

                        <p style="margin-top:8px; opacity:0.9;">
                            ${event.description}
                        </p>

                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </div>

</div>

</body>
</html>
