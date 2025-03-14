<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Manage Bookings | Admin</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #f4b400; color: white; }
        select, button { padding: 5px 10px; cursor: pointer; }
        .update-btn { background: #34a853; color: white; border: none; }
        .delete-btn { background: #ea4335; color: white; border: none; }
    </style>
</head>
<body>

    <h2>Manage Bookings</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Pickup</th>
            <th>Dropoff</th>
            <th>Cab Type</th>
            <th>Fare</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null) {
                for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getBookingId() %></td>
            <td><%= booking.getUserId() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDropoffLocation() %></td>
            <td><%= booking.getCabType() %></td>
            <td>$<%= booking.getFare() %></td>
            <td>
                <form method="post" action="manage-bookings">
                    <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                    <select name="status">
                        <option value="Pending" <%= booking.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                        <option value="Completed" <%= booking.getStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
                        <option value="Cancelled" <%= booking.getStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                    </select>
                    <button type="submit" name="action" value="update" class="update-btn">Update</button>
                </form>
            </td>
            <td>
                <form method="post" action="manage-bookings">
                    <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                    <button type="submit" name="action" value="delete" class="delete-btn" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>

    </table>
</body>
</html>
