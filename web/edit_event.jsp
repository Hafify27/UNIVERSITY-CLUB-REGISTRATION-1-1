<%-- 
    Document   : edit_event
    Created on : Jan 16, 2026, 12:12:33 PM
    Author     : User
--%>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">

            <h4 class="mb-4">Edit Event</h4>

            <form action="UpdateEventServlet" method="post">

                <input type="hidden" name="id" value="${id}">

                <div class="mb-3">
                    <label>Event Name</label>
                    <input name="eventName" class="form-control" value="${name}" required>
                </div>

                <div class="mb-3">
                    <label>Event Date</label>
                    <input type="date" name="eventDate" class="form-control" value="${date}" required>
                </div>

                <div class="mb-3">
                    <label>Organizer</label>
                    <input name="organizer" class="form-control" value="${organizer}">
                </div>

                <div class="mb-3">
                    <label>Participant</label>
                    <input name="participant" class="form-control" value="${participant}">
                </div>

                <div class="mb-3">
                    <label>Description</label>
                    <textarea name="description" class="form-control">${description}</textarea>
                </div>

                <div class="mb-3">
                    <label>Contact Person</label>
                    <input name="contact" class="form-control" value="${contact}">
                </div>

                <button type="submit" class="btn btn-success">Update</button>
                <a href="ManageEventServlet" class="btn btn-secondary">Cancel</a>

            </form>

        </div>
    </div>
</div>

</body>
</html>
