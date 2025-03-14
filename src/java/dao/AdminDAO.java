package dao;

import model.Admin;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    private static final String LOGIN_QUERY = "SELECT * FROM admin WHERE username = ? AND password = ?";

    public Admin validateAdmin(String username, String password) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(LOGIN_QUERY)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Admin(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
