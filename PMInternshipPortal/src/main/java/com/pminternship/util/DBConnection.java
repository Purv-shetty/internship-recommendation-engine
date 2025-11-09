package com.pminternship.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database Connection Utility Class
 * Manages MySQL database connections for the PM Internship Portal
 */
public class DBConnection {

  // Database credentials - UPDATE THESE WITH YOUR MYSQL SETTINGS
  private static final String URL = "jdbc:mysql://localhost:3306/pm_internship_db?useSSL=false&serverTimezone=UTC";
  private static final String USER = "root";
  private static final String PASSWORD = "your_mysql_password_here"; // CHANGE THIS!

  // Database driver
  private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

  /**
   * Get a database connection
   * 
   * @return Connection object
   * @throws SQLException if connection fails
   */
  public static Connection getConnection() throws SQLException {
    try {
      // Load MySQL JDBC Driver
      Class.forName(DRIVER);

      // Return connection
      return DriverManager.getConnection(URL, USER, PASSWORD);

    } catch (ClassNotFoundException e) {
      System.err.println("MySQL JDBC Driver not found!");
      e.printStackTrace();
      throw new SQLException("Driver not found: " + e.getMessage());
    }
  }

  /**
   * Close database connection
   * 
   * @param conn Connection to close
   */
  public static void closeConnection(Connection conn) {
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        System.err.println("Error closing connection: " + e.getMessage());
        e.printStackTrace();
      }
    }
  }

  /**
   * Test database connection
   * 
   * @return true if connection successful
   */
  public static boolean testConnection() {
    try (Connection conn = getConnection()) {
      return conn != null && !conn.isClosed();
    } catch (SQLException e) {
      System.err.println("Database connection test failed!");
      e.printStackTrace();
      return false;
    }
  }
}