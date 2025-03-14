<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Booking Confirmed</h2>
    <p>Your ride has been successfully booked.</p>
    <p>Booking ID: <%= request.getAttribute("bookingId") %></p>
    <p>Pickup: <%= request.getAttribute("pickupLocation") %></p>
    <p>Drop-off: <%= request.getAttribute("dropoffLocation") %></p>
    <p>Cab Type: <%= request.getAttribute("cabType") %></p>
    <p>Schedule: <%= request.getAttribute("scheduleTime") %></p>
    <p>Fare: $<%= request.getAttribute("fare") %></p>
    <a href="booking-history.jsp">View Your Bookings</a>
</body>
</html>
