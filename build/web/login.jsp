<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            margin-top: 50px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .logo {
            display: block;
            margin: 0 auto 15px;
            width: 100px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="logo.png" alt="Mega City Cab Logo" class="logo">
        <h2 class="text-center">Welcome Back</h2>
        <p class="text-center text-muted">Login to continue</p>

        <!-- Display Error Message (if any) -->
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger text-center"><%= errorMessage %></div>
        <% } %>

        <!-- Login Form -->
        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
            <div class="mb-3">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>

        <!-- Forgot Password & Register Links -->
        <p class="text-center mt-3">
            <a href="forgot-password.jsp">Forgot Password?</a> | 
            <a href="register.jsp">Sign Up</a>
        </p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
