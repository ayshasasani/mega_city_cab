<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
    // Check if user is logged in
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Set session timeout (optional)
    session.setMaxInactiveInterval(1800); // 30 minutes

    // Retrieve booking list from request attribute
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 28px;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .booking-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .booking-table th,
        .booking-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .booking-table th {
            background-color: #2980b9;
            color: white;
            font-weight: bold;
        }

        .booking-table td {
            font-size: 16px;
            color: #555;
        }

        .booking-table tr:hover {
            background-color: #f1f1f1;
        }

        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }

        .status-completed {
            color: #2ecc71;
            font-weight: bold;
        }

        .status-cancelled {
            color: #e74c3c;
            font-weight: bold;
        }

        .btn {
            padding: 8px 16px;
            font-size: 16px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn.cancel-btn {
            background-color: #e74c3c;
        }

        .btn.cancel-btn:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        .btn.view-details-btn {
            background-color: #2980b9;
        }

        .btn.view-details-btn:hover {
            background-color: #1c598a;
            transform: scale(1.05);
        }

        .no-bookings {
            text-align: center;
            font-size: 18px;
            color: #7f8c8d;
            margin-top: 20px;
        }

        .no-bookings a {
            color: #2980b9;
            text-decoration: none;
        }

        .no-bookings a:hover {
            text-decoration: underline;
        }

        .btn-book {
            margin-top: 20px;
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #2980b9;
            color: white;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .btn-book:hover {
            background-color: #1c598a;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Booking History</h2>

        <% if (bookings != null && !bookings.isEmpty()) { %>
            <table class="booking-table">
                <thead>
                    <tr>
                        <th>Pickup</th>
                        <th>Drop-off</th>
                        <th>Cab Type</th>
                        <th>Ride Type</th>
                        <th>Scheduled Time</th>
                        <th>Fare</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Booking booking : bookings) { %>
                        <tr>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getDropoffLocation() %></td>
                            <td><%= booking.getCabType() %></td>
                            <td><%= booking.getRideType() %></td>
                            <td><%= dateFormat.format(booking.getScheduledTime()) %></td>
                            <td>$<%= String.format("%.2f", booking.getFare()) %></td>
                            <td class="status-<%= booking.getStatus().toLowerCase() %>"><%= booking.getStatus() %></td>
                            <td>
                                <% if ("Pending".equals(booking.getStatus())) { %>
                                    <button class="btn cancel-btn" data-id="<%= booking.getBookingId() %>">Cancel</button>
                                <% } %>
                                <button class="btn view-details-btn" data-id="<%= booking.getBookingId() %>">View</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="no-bookings">No bookings found. <a href="booking.jsp">Book a ride now!</a></p>
        <% } %>
        
        <a href="booking.jsp" class="btn btn-book">Book a Ride</a>
    </div>

    <script>
        $(document).ready(function() {
            $(".cancel-btn").click(function() {
                let bookingId = $(this).data("id");

                if (confirm("Are you sure you want to cancel this ride?")) {
                    $.ajax({
                        url: "booking",
                        type: "POST", // HTML forms do not support DELETE, so using POST with a _method parameter
                        data: { bookingId: bookingId, _method: "DELETE" },
                        success: function(response) {
                            if (response.trim() === "success") {
                                alert("Booking cancelled successfully.");
                                location.reload();
                            } else {
                                alert("Failed to cancel booking. Please try again.");
                            }
                        },
                        error: function(xhr, status, error) {
                            alert("Error: " + error);
                        }
                    });
                }
            });

            $(".view-details-btn").click(function() {
                let bookingId = $(this).data("id");
                window.location.href = "booking-details.jsp?bookingId=" + bookingId;
            });
        });
    </script>

</body>
</html>
