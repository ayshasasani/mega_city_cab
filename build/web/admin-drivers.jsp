<%@ page import="java.util.List" %>
<%@ page import="model.Driver" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Manage Drivers | Admin</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #4285F4; color: white; }
        .btn { padding: 5px 10px; cursor: pointer; }
        .update-btn { background: #34a853; color: white; }
        .delete-btn { background: #ea4335; color: white; }
    </style>
</head>
<body>

    <h2>Manage Drivers</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>License</th>
            <th>Availability</th>
            <th>Actions</th>
        </tr>

        <%
            List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
            if (drivers != null) {
                for (Driver driver : drivers) {
        %>
        <tr>
            <td><%= driver.getDriverId() %></td>
            <td><%= driver.getName() %></td>
            <td><%= driver.getPhone() %></td>
            <td><%= driver.getLicenseNumber() %></td>
            <td><%= driver.getAvailability() %></td>
        </tr>
        <%
                }
            }
        %>

    </table>
</body>
</html>
