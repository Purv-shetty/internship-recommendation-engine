package com.pminternship.dao;

import com.pminternship.model.User;
import com.pminternship.util.DBConnection;

import java.sql.*;

/**
 * User Data Access Object
 * Handles all database operations related to users
 */
public class UserDAO {

  /**
   * Register a new user
   * 
   * @param user User object with registration details
   * @return true if registration successful
   */
  public boolean registerUser(User user) {
    String sql = "INSERT INTO users (full_name, email, mobile, password) VALUES (?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, user.getFullName());
      pstmt.setString(2, user.getEmail());
      pstmt.setString(3, user.getMobile());
      pstmt.setString(4, user.getPassword()); // In production, hash the password!

      int rowsAffected = pstmt.executeUpdate();
      return rowsAffected > 0;

    } catch (SQLException e) {
      System.err.println("Error registering user: " + e.getMessage());
      e.printStackTrace();
      return false;
    }
  }

  /**
   * Login user with email and password
   * 
   * @param email    User email
   * @param password User password
   * @return User object if login successful, null otherwise
   */
  public User loginUser(String email, String password) {
    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

    try (Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, email);
      pstmt.setString(2, password); // In production, compare hashed passwords!

      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          User user = new User();
          user.setId(rs.getInt("id"));
          user.setFullName(rs.getString("full_name"));
          user.setEmail(rs.getString("email"));
          user.setMobile(rs.getString("mobile"));
          user.setCreatedAt(rs.getTimestamp("created_at"));
          return user;
        }
      }

    } catch (SQLException e) {
      System.err.println("Error during login: " + e.getMessage());
      e.printStackTrace();
    }

    return null;
  }

  /**
   * Check if email already exists
   * 
   * @param email Email to check
   * @return true if email exists
   */
  public boolean emailExists(String email) {
    String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

    try (Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, email);

      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          return rs.getInt(1) > 0;
        }
      }

    } catch (SQLException e) {
      System.err.println("Error checking email: " + e.getMessage());
      e.printStackTrace();
    }

    return false;
  }

  /**
   * Get user by ID
   * 
   * @param userId User ID
   * @return User object
   */
  public User getUserById(int userId) {
    String sql = "SELECT * FROM users WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setInt(1, userId);

      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          User user = new User();
          user.setId(rs.getInt("id"));
          user.setFullName(rs.getString("full_name"));
          user.setEmail(rs.getString("email"));
          user.setMobile(rs.getString("mobile"));
          user.setCreatedAt(rs.getTimestamp("created_at"));
          return user;
        }
      }

    } catch (SQLException e) {
      System.err.println("Error getting user: " + e.getMessage());
      e.printStackTrace();
    }

    return null;
  }
}