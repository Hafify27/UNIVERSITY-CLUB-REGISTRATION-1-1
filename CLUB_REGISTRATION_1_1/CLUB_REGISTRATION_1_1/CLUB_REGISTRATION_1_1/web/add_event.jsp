<%-- 
    Document   : add_event
    Created on : Jan 16, 2026, 11:47:56 AM
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">

            <h4 class="mb-4">Add New Event</h4>

            <form action="AddEventServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Event Name</label>
                    <input name="eventName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Event Date</label>
                    <input type="date" name="eventDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Organizer</label>
                    <input name="organizer" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Participant</label>
                    <input name="participant" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Contact Person</label>
                    <input name="contact" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">Save Event</button>
                <a href="ManageEventServlet" class="btn btn-secondary">Cancel</a>

            </form>

        </div>
    </div>
</div>

</body>
</html>

