<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Club</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="landing-body">

<div class="landing-overlay">

    <div class="landing-card">

        <h1>Edit Club</h1>
        <p>Update club information</p>

        <form action="UpdateClubServlet" method="post">

            <input type="hidden" name="id" value="${id}">

            <input type="text"
                   name="clubName"
                   value="${name}"
                   placeholder="Club Name"
                   class="login-input"
                   required>

            <input type="text"
                   name="advisor"
                   value="${advisor}"
                   placeholder="Advisor Name"
                   class="login-input">

            <textarea name="description"
                      placeholder="Description"
                      class="login-input"
                      rows="3"
                      style="border-radius: 20px;">${description}</textarea>

            <div style="margin-top:20px;">
                <button type="submit" 
                        class="button button-green">
                    Update
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
