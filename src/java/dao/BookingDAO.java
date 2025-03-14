package dao;

import model.Booking;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Add a new booking
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (id, pickupLocation, pickupLat, pickupLng, dropoffLocation, dropoffLat, dropoffLng, cabType, rideType, scheduledTime, fare, status, bookingTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
             
            stmt.setInt(1, booking.getUserId()); 
            stmt.setString(2, booking.getPickupLocation());
            stmt.setDouble(3, booking.getPickupLat());
            stmt.setDouble(4, booking.getPickupLng());
            stmt.setString(5, booking.getDropoffLocation());
            stmt.setDouble(6, booking.getDropoffLat());
            stmt.setDouble(7, booking.getDropoffLng());
            stmt.setString(8, booking.getCabType());
            stmt.setString(9, booking.getRideType());
            stmt.setTimestamp(10, booking.getScheduledTime());
            stmt.setDouble(11, booking.getFare());
            stmt.setString(12, booking.getStatus());
            stmt.setTimestamp(13, booking.getBookingTime());
            
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY bookingTime DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Retrieve bookings by user ID
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE id = ? ORDER BY bookingTime DESC"; 

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Update booking status
    public boolean updateBookingStatus(int bookingId, String newStatus) {
        String sql = "UPDATE bookings SET status = ? WHERE bookingId = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, bookingId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a booking
    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM bookings WHERE bookingId = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, bookingId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper method to map ResultSet to Booking object
    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        return new Booking(
            rs.getInt("bookingId"),
            rs.getInt("id"), 
            rs.getString("pickupLocation"),
            rs.getDouble("pickupLat"),
            rs.getDouble("pickupLng"),
            rs.getString("dropoffLocation"),
            rs.getDouble("dropoffLat"),
            rs.getDouble("dropoffLng"),
            rs.getString("cabType"),
            rs.getString("rideType"),
            rs.getTimestamp("scheduledTime"),
            rs.getDouble("fare"),
            rs.getString("status"),
            rs.getTimestamp("bookingTime")
        );
    }
}
