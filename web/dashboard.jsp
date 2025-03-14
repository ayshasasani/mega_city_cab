<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Global body styling */
        body {
            background-color: #f0f2f5;
            font-family: 'Arial', sans-serif;
        }

        /* Container styling */
        .container {
            margin-top: 100px;
            text-align: center;
        }

        .container h2 {
            color: #2c3e50;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .container p {
            color: #7f8c8d;
            font-size: 20px;
            margin-bottom: 40px;
        }

        /* Button styling */
        .btn {
            font-size: 18px;
            padding: 12px 24px;
            border-radius: 50px;
            margin: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .btn-primary:hover {
            background-color: #1c598a;
            border-color: #1c598a;
            transform: scale(1.05);
        }

        .btn-secondary {
            background-color: #95a5a6;
            border-color: #95a5a6;
        }

        .btn-secondary:hover {
            background-color: #7f8c8d;
            border-color: #7f8c8d;
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b;
            transform: scale(1.05);
        }

        /* Card section styling */
        .card {
            background-color: #fff;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-body {
            padding: 40px;
        }

        .card-title {
            font-size: 28px;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card-text {
            font-size: 16px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome to Mega City Cab</h2>
        <p>Your rides, your way!</p>

        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Quick Access</h5>
                        <p class="card-text">Book your next ride, view your booking history, or log out from here.</p>
                        <a href="booking.jsp" class="btn btn-primary">Book a Ride</a>
                        <a href="booking-history.jsp" class="btn btn-secondary">View Booking History</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Your Profile</h5>
                        <p class="card-text">Manage your profile details, view your previous rides, and more.</p>
                        <a href="profile.jsp" class="btn btn-primary">Go to Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Sign out of your account securely.</p>
                        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
