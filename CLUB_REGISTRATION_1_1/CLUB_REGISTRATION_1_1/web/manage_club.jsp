<%-- 
    Document   : manage_club
    Created on : Jan 16, 2026, 12:52:47 PM
    Author     : User
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Clubs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container py-5">

<h3 class="mb-4">Manage Clubs</h3>

<a href="add_club.jsp" class="btn btn-success mb-3">+ Add Club</a>

<table class="table table-bordered bg-white shadow-sm">
    <tr>
        <th>Club Name</th>
        <th>Description</th>
        <th>Advisor</th>
        <th>Action</th>
    </tr>

    <c:forEach var="c" items="${clubs}">
        <tr>
            <td>${c.name}</td>
            <td>${c.desc}</td>
            <td>${c.advisor}</td>
            <td>
                <a href="EditClubServlet?id=${c.id}" class="btn btn-sm btn-primary">Edit</a>
                <a href="DeleteClubServlet?id=${c.id}"
                   onclick="return confirm('Delete this club?')"
                   class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="AdminDashboardServlet" class="btn btn-secondary mt-3">Back</a>

</div>
</body>
</html>
