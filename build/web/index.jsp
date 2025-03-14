<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Your Trusted Ride</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f8ff;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            background-color: #003366;
            padding: 15px;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .nav-link:hover {
            color: #ffcc00 !important;
        }

        /* Hero Section */
        .hero {
            background: url('https://images.pexels.com/photos/590059/pexels-photo-590059.jpeg') center/cover no-repeat;
            height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: whitesmoke;
            position: relative;
            border-bottom: 4px solid #ffcc00;
        }
        .hero-overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(50, 100, 179, 0.7);
        }
        .hero-content {
            z-index: 1;
        }
        .hero h1 {
            font-size: 4rem;
            font-weight: 700;
        }
        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
        }

        .btn-custom {
            background-color: #ffcc00;
            color: #003366;
            padding: 12px 30px;
            border-radius: 50px;
            transition: 0.3s;
            font-weight: 600;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }

        /* Sections */
        .section-heading {
            text-align: center;
            margin-bottom: 2rem;
            color: #003366;
            font-weight: 700;
        }

        .ride-option {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }
        .ride-option i {
            color: #003366;
        }
        .ride-option h4 {
            color: #003366;
            margin-top: 1rem;
        }

        /* Footer */
        .footer {
            background-color: #003366;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 3rem;
        }
        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 20px;
        }

        .social-icons a:hover {
            color: #ffcc00;
        }

        /* Contact & Testimonials */
        section {
            padding: 4rem 0;
            background-color: #f8f9fa;
        }

        section p {
            font-size: 1.1rem;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            font-size: 1.2rem;
            padding: 10px 0;
        }
    </
    /* General Button Styles */
    .btn-custom {
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 50px;
        text-transform: uppercase;
        transition: 0.3s;
    }

    /* Signup Button */
    .btn-signup {
        background-color: #0056b3; /* Blue */
        color: white;
        border: 2px solid #0056b3;
    }
    .btn-signup:hover {
        background-color: #003f8c; /* Darker Blue */
        border-color: #003f8c;
    }

    /* Login Button */
    .btn-login {
        background-color: #ffcc00; /* Dark Yellow */
        color: black;
        border: 2px solid #ffcc00;
    }
    .btn-login:hover {
        background-color: #e6b800; /* Darker Yellow */
        border-color: #e6b800;
    }

    /* Disabled Button */
    .btn-disabled {
        background-color: #cccccc; /* Light Gray */
        color: #666666;
        border: 2px solid #cccccc;
        cursor: not-allowed;
    }

    /* Button Container for Layout */
    .btn-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
    }
    .btn-container .btn {
        width: 48%;
    }
</style>

</head>
<body>
    
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Mega City Cab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#services">Ride Options</a></li>
                    <li class="nav-item"><a class="nav-link" href="#how-it-works">How It Works</a></li>
                    <li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-warning text-dark" href="register.jsp">Sign Up</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-light text-primary" href="login.jsp">Sign In</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="container hero-content">
            <h1 class="display-4 fw-bold">Your Ride, Your Way</h1>
            <p class="lead">Fast, Reliable & Affordable Cab Service</p>
            <a href="booking.jsp" class="btn btn-custom">Book a Ride</a>
        </div>
    </section>

    <!-- Ride Options -->
    <section id="services" class="container my-5">
        <h2 class="section-heading">Ride Options</h2>
        <div class="row text-center">
            <div class="col-md-4 ride-option">
                <i class="fas fa-car fa-2x"></i>
                <h4>Standard</h4>
                <p>Affordable rides for everyday needs.</p>
            </div>
            <div class="col-md-4 ride-option">
                <i class="fas fa-car-side fa-2x"></i>
                <h4>Premium</h4>
                <p>Luxury cars for a comfortable experience.</p>
            </div>
            <div class="col-md-4 ride-option">
                <i class="fas fa-shuttle-van fa-2x"></i>
                <h4>XL</h4>
                <p>Extra space for groups or luggage.</p>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section id="how-it-works" class="container my-5">
        <h2 class="section-heading">How It Works</h2>
        <ul>
            <li>Enter pickup & drop-off location</li>
            <li>Choose your ride & confirm booking</li>
            <li>Enjoy your ride & pay easily</li>
        </ul>
    </section>

    <!-- Testimonials -->
    <section id="testimonials" class="container my-5">
        <h2 class="section-heading">What Our Riders Say</h2>
        <p>⭐⭐⭐⭐⭐ "Excellent service, very professional!"</p>
        <p>⭐⭐⭐⭐⭐ "Affordable and always on time!"</p>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container my-5">
        <h2 class="section-heading">Get in Touch</h2>
        <p>Email: support@megacitycab.com | Phone: +94 77 123 4567</p>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
