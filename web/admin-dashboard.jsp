<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
    String adminUsername = (String) sessionObj.getAttribute("adminUsername");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-styles.css">
</head>
<body>

<div class="dashboard-container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="admin-users.jsp">📋 Manage Users</a></li>
            <li><a href="admin-bookings.jsp">🚖 Manage Bookings</a></li>
            <li><a href="admin-drivers.jsp">👨‍✈️ Manage Drivers</a></li>
            <li><a href="adminLogout">🚪 Logout</a></li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <header>
            <h1>Welcome, <%= adminUsername %>!</h1>
        </header>
        <section class="cards">
            <div class="card">
                <h3>Total Users</h3>
                <p>1,245</p>
            </div>
            <div class="card">
                <h3>Total Bookings</h3>
                <p>342</p>
            </div>
            <div class="card">
                <h3>Available Drivers</h3>
                <p>58</p>
            </div>
            <div class="card">
                <h3>Revenue</h3>
                <p>$12,500</p>
            </div>
        </section>
    </main>
</div>

</body>
</html>
