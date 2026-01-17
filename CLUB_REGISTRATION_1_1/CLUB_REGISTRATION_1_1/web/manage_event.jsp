<%-- 
    Document   : manage_event
    Created on : Jan 16, 2026, 11:46:57 AM
    Author     : User
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">

<h3 class="mb-4">Manage Events</h3>

<a href="add_event.jsp" class="btn btn-success mb-3">+ Add Event</a>

<table class="table table-bordered table-hover bg-white shadow-sm">
    <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Organizer</th>
        <th>Participant</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach var="e" items="${events}">
        <tr>
            <td>${e.name}</td>
            <td>${e.date}</td>
            <td>${e.organizer}</td>
            <td>${e.participant}</td>
            <td>${e.status}</td>
            <td>
               
    <a href="EditEventServlet?id=${e.id}" class="btn btn-sm btn-primary">
        Edit
    </a>

    <c:choose>
        <c:when test="${e.status == 'PUBLISHED'}">
            <span class="badge bg-success">Published</span>
        </c:when>
        <c:otherwise>
            <a href="PublishEventServlet?id=${e.id}" 
               class="btn btn-sm btn-warning">
               Publish
            </a>
        </c:otherwise>
    </c:choose>

    <a href="DeleteEventServlet?id=${e.id}" 
       class="btn btn-sm btn-danger"
       onclick="return confirm('Delete this event?')">
       Delete
    </a>
</td>

            </td>
        </tr>
    </c:forEach>
</table>

<a href="AdminDashboardServlet" class="btn btn-secondary mt-3">Back</a>

</div>
</body>
</html>
