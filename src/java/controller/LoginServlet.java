package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;
import dao.UserDAO;
import util.PasswordHashing;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form inputs
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input fields
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            sendError(request, response, "Email and password are required.");
            return;
        }

        email = email.trim().toLowerCase(); // Normalize email input

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        // 🔹 Debug Log: Check if User Exists in Database
        if (user == null) {
            log("❌ User not found for email: " + email);
            sendError(request, response, "Invalid email or password.");
            return;
        } else {
            log("✅ User found: " + user.getEmail());
            log("🔹 Stored Password Hash: " + user.getPassword());
        }

        // 🔹 Debug Log: Check Password Hashing
        if (!PasswordHashing.verifyPassword(password, user.getPassword())) {
            log("❌ Password verification failed for user: " + email);
            log("🔹 Entered Password Hash: " + PasswordHashing.hashPassword(password)); // For debugging only
            sendError(request, response, "Invalid email or password.");
            return;
        } else {
            log("✅ Password verification successful for user: " + email);
        }

        // Session Management
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate(); // Invalidate previous session if any
        }

        // Create a new secure session
        HttpSession session = request.getSession(true);
        session.setAttribute("userId", user.getId());
        session.setAttribute("userRole", user.getRole());
        session.setAttribute("userEmail", user.getEmail());
        session.setMaxInactiveInterval(30 * 60); // 30-minute session timeout

        // Prevent browser from caching the login page
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // Redirect based on user role
        String redirectPage = "admin".equalsIgnoreCase(user.getRole()) ? "admin-dashboard.jsp" : "dashboard.jsp";
        log("🚀 User " + email + " logged in. Redirecting to " + redirectPage);
        response.sendRedirect(redirectPage);
    }

    /**
     * Utility method to send an error message to login.jsp
     */
    private void sendError(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}

