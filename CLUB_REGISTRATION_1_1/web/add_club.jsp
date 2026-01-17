<%-- 
    Document   : add_club
    Created on : Jan 16, 2026, 12:53:14 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <h4 class="mb-4">Add Club</h4>

            <form action="AddClubServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Club Name</label>
                    <input name="clubName" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Advisor</label>
                    <input name="advisor" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">Save </button>
                <a href="ManageClubServlet" class="btn btn-secondary">Cancel</a>
                
</form>

            </form>

        </div>
    </div>
</div>

</body>
</html>

