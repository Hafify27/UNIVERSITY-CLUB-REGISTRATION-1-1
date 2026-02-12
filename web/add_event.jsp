<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Event</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

<div class="landing-card" style="max-width:700px; width:100%; text-align:left;">

    <h1>Add New Event</h1>
    <p>Create a new university event</p>

    <form action="AddEventServlet" method="post" style="margin-top:25px;">

        <div style="margin-bottom:15px;">
            <label>Event Name</label>
            <input name="eventName" class="login-input" required>
        </div>

        <div style="margin-bottom:15px;">
            <label>Event Date</label>
            <input type="date" name="eventDate" class="login-input" required>
        </div>

        <div style="margin-bottom:15px;">
            <label>Organizer</label>
            <input name="organizer" class="login-input" required>
        </div>

        <div style="margin-bottom:15px;">
            <label>Participant</label>
            <input name="participant" class="login-input">
        </div>

        <div style="margin-bottom:15px;">
            <label>Description</label>
            <textarea name="description" 
                      class="login-input" 
                      rows="3"
                      style="border-radius:15px;"></textarea>
        </div>

        <div style="margin-bottom:25px;">
            <label>Contact Person</label>
            <input name="contact" class="login-input" required>
        </div>

        <div>
            <button type="submit" 
                    class="button landing-btn button-green">
                Save Event
            </button>

            <a href="ManageEventServlet" 
               class="button landing-btn"
               style="margin-left:10px;">
                Cancel
            </a>
        </div>

    </form>

</div>

</div>

</body>
</html>
