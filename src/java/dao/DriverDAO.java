package dao;

import model.Driver;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // Add a new driver
    public boolean addDriver(Driver driver) {
        String sql = "INSERT INTO drivers (name, phone, licenseNumber, availability) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getPhone());
            stmt.setString(3, driver.getLicenseNumber());
            stmt.setString(4, driver.getAvailability());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM drivers ORDER BY name";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                drivers.add(mapResultSetToDriver(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // Update driver details
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE drivers SET name = ?, phone = ?, licenseNumber = ?, availability = ? WHERE driverId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getPhone());
            stmt.setString(3, driver.getLicenseNumber());
            stmt.setString(4, driver.getAvailability());
            stmt.setInt(5, driver.getDriverId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a driver
    public boolean deleteDriver(int driverId) {
        String sql = "DELETE FROM drivers WHERE driverId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, driverId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper method to map ResultSet to Driver object
    private Driver mapResultSetToDriver(ResultSet rs) throws SQLException {
        return new Driver(
            rs.getInt("driverId"),
            rs.getString("name"),
            rs.getString("phone"),
            rs.getString("licenseNumber"),
            rs.getString("availability")
        );
    }
}
