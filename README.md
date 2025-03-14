Mega City Cab Reservation System
Project Overview
Mega City Cab Reservation System is a web-based application that allows users to easily book, track, and manage their cab rides. The system supports user authentication, ride scheduling, booking history, payment management, and administrative controls for managing drivers, users, and bookings.

This system is developed using Java, JSP, Servlets, MySQL, and Bootstrap for a modern and responsive web design. It also utilizes Git/GitHub for version control and GitHub Actions for Continuous Integration and Deployment (CI/CD).

Features
User Authentication & Profile Management:

Sign up and log in.
Manage user profile details.
Forgot password functionality.
Cab Booking & Ride Scheduling:

Select pickup/drop-off locations.
Choose ride date/time.
Select cab type (economy, premium, etc.).
Instant and scheduled rides.
Fare estimation and live ride status updates.
Booking History & Ride Management:

View past and upcoming bookings.
Modify or cancel bookings.
Payment & Billing:

Multiple payment options (credit card, wallet, etc.).
Generate invoices and apply promo codes.
Admin Controls:

Dashboard for managing users, drivers, and bookings.
View and manage booking history.
User and driver profile management.
Security & Customer Support:

Live ride tracking.
Emergency SOS feature.
Customer support chat and call.
Notifications & Alerts:

Email and SMS notifications for ride confirmations, reminders, and updates.
Tech Stack
Frontend:

HTML, CSS, JavaScript, Bootstrap
JSP (Java Server Pages) for dynamic web pages
Backend:

Java (Servlets)
JDBC for MySQL database connection
Tomcat for server management
Database:

MySQL for data storage (user details, booking history, etc.)
Version Control:

Git/GitHub for version control and collaboration
CI/CD:

GitHub Actions for Continuous Integration and Deployment
Installation
To set up the project on your local machine, follow these steps:

Clone the repository:
git clone https://github.com/ayshasasani/mega_city_cab.git

Navigate to the project directory:
cd mega-city-cab

Setup MySQL Database:
Import the database schema from the sql/ folder.
Ensure you update the database connection details in the DBConnection class if necessary (located in src/util/DBConnection.java).
Build the project:
Ensure you have Tomcat installed and running on your machine.
Deploy the project to your Tomcat server.
Access the system via http://localhost:8080/mega-city-cab/ in your browser.
Usage
User Registration & Login:

Navigate to the Login page to either log in with an existing account or sign up.
After logging in, users can view available cab types, book rides, check booking history, and manage their profiles.
Admin Dashboard:

Admin users can log in to access a dashboard for managing users, bookings, drivers, and viewing system statistics.
Booking Process:

Select the pickup and drop-off locations, choose the ride date/time, and confirm your booking.
Track your ride in real time and receive notifications on ride status.
GitHub Actions (CI/CD)
The project is integrated with GitHub Actions for continuous integration and deployment. The workflow performs the following steps:

Run Unit Tests: After each commit, the system runs unit tests to ensure code stability.
Build Project: The project is built automatically.
Deploy: Once tests pass, the code is deployed to the staging or production environment.
You can view the status of the workflows in the Actions tab of the GitHub repository.

Contribution Guidelines
We welcome contributions! If you would like to contribute to this project, follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-name).
Commit your changes (git commit -m 'Add new feature').
Push to the branch (git push origin feature-name).
Create a pull request.
License
This project is licensed under the MIT License. See the LICENSE file for more information.

Acknowledgements
Tomcat for serving the application.
Bootstrap for responsive front-end design.
MySQL for the database management system.
GitHub for version control and CI/CD integration.
