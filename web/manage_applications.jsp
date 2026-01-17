<%-- 
    Document   : manage_applications
    Created on : Jan 13, 2026, 1:20:13 PM
    Author     : User
--%>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="page-header header-flex">
    <h2>Club Applications</h2>

    <a href="AdminDashboardServlet" class="button">
        Main Page
    </a>
</div>

    <div class="card">
        <table>
            <tr>
                <th>Student Name</th>
                <th>Club</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<Map<String,String>> apps =
                    (List<Map<String,String>>) request.getAttribute("applications");

                if (apps != null) {
                    for (Map<String,String> a : apps) {
            %>
            <tr>
                <td><%= a.get("student") %></td>
                <td><%= a.get("club") %></td>
                <td><%= a.get("status") %></td>
                <td>
                    <% if ("PENDING".equals(a.get("status"))) { %>
                        <a class="button small success"
                           href="UpdateStatusServlet?id=<%=a.get("id")%>&status=APPROVED">
                           Approve
                        </a>

                        <a class="button small danger"
                           href="UpdateStatusServlet?id=<%=a.get("id")%>&status=REJECTED">
                           Reject
                        </a>
                    <% } else { %>
                        
                    <% } %>
                </td>
            </tr>
            <% } } %>

        </table>
    </div>
</div>

</body>
</html>
