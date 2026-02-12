<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Edit Event</h1>
        <p>Update event information</p>

        <form action="UpdateEventServlet" method="post">

            <input type="hidden" name="id" value="${id}">

            <input type="text"
                   name="eventName"
                   value="${name}"
                   placeholder="Event Name"
                   class="login-input"
                   required>

            <input type="date"
                   name="eventDate"
                   value="${date}"
                   class="login-input"
                   required>

            <input type="text"
                   name="organizer"
                   value="${organizer}"
                   placeholder="Organizer"
                   class="login-input">

            <input type="text"
                   name="participant"
                   value="${participant}"
                   placeholder="Participant"
                   class="login-input">

            <textarea name="description"
                      placeholder="Description"
                      class="login-input"
                      rows="3"
                      style="border-radius: 20px;">${description}</textarea>

            <input type="text"
                   name="contact"
                   value="${contact}"
                   placeholder="Contact Person"
                   class="login-input">

            <div style="margin-top:20px;">
                <button type="submit" 
                        class="button button-green">
                    Update
                </button>

                <a href="ManageEventServlet" 
                   class="button">
                   Cancel
                </a>
            </div>

        </form>

        <div class="back-btn">
            <a href="AdminDashboardServlet" class="button">
                Back to Dashboard
            </a>
        </div>

    </div>

</div>

</body>
</html>
