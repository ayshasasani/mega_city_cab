package controller;

import dao.BookingDAO;
import model.Booking;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    public void init() {
        bookingDAO = new BookingDAO();
    }

    private boolean isUserLoggedIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return false;
        }
        return true;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) return;

        int id = (int) request.getSession().getAttribute("id");
        try {
            String pickupLocation = request.getParameter("pickupLocation");
            double pickupLat = Double.parseDouble(request.getParameter("pickupLat"));
            double pickupLng = Double.parseDouble(request.getParameter("pickupLng"));
            String dropoffLocation = request.getParameter("dropoffLocation");
            double dropoffLat = Double.parseDouble(request.getParameter("dropoffLat"));
            double dropoffLng = Double.parseDouble(request.getParameter("dropoffLng"));
            String cabType = request.getParameter("cabType");
            String rideType = request.getParameter("rideType");
            double fare = Double.parseDouble(request.getParameter("fare"));
            
            Timestamp scheduledTime = null;
            String scheduledTimeStr = request.getParameter("scheduledTime");
            if (scheduledTimeStr != null && !scheduledTimeStr.isEmpty()) {
                scheduledTime = Timestamp.valueOf(scheduledTimeStr);
            }

            Booking booking = new Booking(id, pickupLocation, pickupLat, pickupLng, dropoffLocation, dropoffLat,
                    dropoffLng, cabType, rideType, scheduledTime, fare, "Pending", new Timestamp(System.currentTimeMillis()));

            if (bookingDAO.addBooking(booking)) {
                request.setAttribute("successMessage", "Booking successful!");
                request.getRequestDispatcher("booking-history.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to book ride. Try again.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Invalid input. Please check your details.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) return;

        int id = (int) request.getSession().getAttribute("userId");
        try {
            List<Booking> bookings = bookingDAO.getBookingsByUser(id);
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("booking-history.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Unable to retrieve booking history.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) return;

        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String newStatus = request.getParameter("status");

            if (newStatus == null || newStatus.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid status");
                return;
            }

            if (bookingDAO.updateBookingStatus(bookingId, newStatus)) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("success");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("error");
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Unable to update booking status");
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) return;

        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            if (bookingDAO.deleteBooking(bookingId)) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("success");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("error");
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Unable to delete booking");
        }
    }
}
