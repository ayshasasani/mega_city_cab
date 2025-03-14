<aside class="sidebar">
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="admin-dashboard.jsp">? Dashboard</a></li>
        <li><a href="manageUsers">? Manage Users</a></li>
        <li><a href="manageBookings">? Manage Bookings</a></li>
        <li><a href="adminLogout">? Logout</a></li>
    </ul>
</aside>

<style>
    /* Sidebar Styling */
    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #2C3E50;
        color: white;
        position: fixed;
        left: 0;
        top: 0;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
    }

    .sidebar h2 {
        text-align: center;
        font-size: 22px;
        margin-bottom: 20px;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        margin: 15px 0;
    }

    .sidebar ul li a {
        text-decoration: none;
        color: white;
        font-size: 18px;
        display: flex;
        align-items: center;
        padding: 10px;
        transition: background 0.3s;
        border-radius: 5px;
    }

    .sidebar ul li a:hover {
        background: #1A252F;
    }

    /* Adjusting Main Content */
    .main-content {
        margin-left: 250px; /* Matches sidebar width */
        padding: 20px;
    }

    /* Responsive Fix */
    @media (max-width: 768px) {
        .sidebar {
            width: 200px;
        }
        .main-content {
            margin-left: 200px;
        }
    }
</style>
