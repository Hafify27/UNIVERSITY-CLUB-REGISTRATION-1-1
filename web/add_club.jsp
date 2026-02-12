<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Club</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Add Club</h1>
        <p>Create a new club for the university</p>

        <form action="AddClubServlet" method="post">

            <input type="text" 
                   name="clubName" 
                   placeholder="Club Name"
                   class="login-input"
                   required>

            <textarea name="description"
                      placeholder="Description"
                      class="login-input"
                      rows="3"
                      style="border-radius: 20px;"></textarea>

            <input type="text" 
                   name="advisor" 
                   placeholder="Advisor Name"
                   class="login-input"
                   required>

            <div style="margin-top:20px;">
                <button type="submit" 
                        class="button button-green">
                    Save
                </button>

                <a href="ManageClubServlet" 
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
