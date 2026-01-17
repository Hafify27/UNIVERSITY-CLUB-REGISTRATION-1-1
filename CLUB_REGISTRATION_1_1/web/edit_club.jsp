<%-- 
    Document   : edit_club
    Created on : Jan 16, 2026, 1:03:12 PM
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

            <h4 class="mb-4">Edit Club</h4>

            <form action="UpdateClubServlet" method="post">

                <input type="hidden" name="id" value="${id}">

                <div class="mb-3">
                    <label>Club Name</label>
                    <input name="clubName" class="form-control" value="${name}" required>
                </div>

                <div class="mb-3">
                    <label>Advisor</label>
                    <input name="Advisor" class="form-control" value="${advisor}">
                </div>

                <div class="mb-3">
                    <label>Description</label>
                    <textarea name="description" class="form-control">${description}</textarea>
                </div>

                <button type="submit" class="btn btn-success">Update</button>
                <a href="ManageClubServlet" class="btn btn-secondary">Cancel</a>

            </form>

        </div>
    </div>
</div>

</body>
</html>
