package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import util.EmailUtility;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailRegistered(email)) {
            String token = UUID.randomUUID().toString();
            userDAO.saveResetToken(email, token);

            String resetLink = "http://localhost:8081/MegaCityCabReservation/reset-password.jsp?token=" + token;
            String subject = "Password Reset Request";
            String message = "Click the following link to reset your password: " + resetLink;

            EmailUtility.sendEmail(email, subject, message);
            request.setAttribute("message", "A password reset link has been sent to your email.");
        } else {
            request.setAttribute("errorMessage", "Email not found!");
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }
}
