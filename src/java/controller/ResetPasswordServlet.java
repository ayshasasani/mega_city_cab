package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import util.PasswordHashing;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        UserDAO userDAO = new UserDAO();
        String email = userDAO.getEmailByToken(token);

        if (email != null) {
            String hashedPassword = PasswordHashing.hashPassword(newPassword);
            userDAO.updatePassword(email, hashedPassword);
            response.sendRedirect("login.jsp?resetSuccess=true");
        } else {
            request.setAttribute("errorMessage", "Invalid or expired reset link.");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }
}
