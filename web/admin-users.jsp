<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
     <link rel="stylesheet" href="admin-styles.css">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .dashboard-container {
            display: flex;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
            margin-left: 250px; /* Same width as sidebar */
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            background-color: white;
            border-collapse: collapse;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Delete Button */
        .delete-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .delete-btn:hover {
            background-color: darkred;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 200px;
                padding: 15px;
            }

            table {
                font-size: 14px;
            }

            .delete-btn {
                padding: 6px 10px;
            }
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <%@ include file="admin-sidebar.jsp" %>

    <main class="main-content">
        <h1>Manage Users</h1>

        <table>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <% if (users != null && !users.isEmpty()) { 
                for (User user : users) { %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><%= user.getRole() %></td>
                        <td>
                            <form method="post" action="manageUsers">
                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } 
            } else { %>
                <tr>
                    <td colspan="6" style="text-align: center; color: red;">No users found.</td>
                </tr>
            <% } %>
        </table>
    </main>
</div>

</body>
</html>
