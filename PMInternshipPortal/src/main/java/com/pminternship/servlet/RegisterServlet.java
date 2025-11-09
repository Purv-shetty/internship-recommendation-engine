package com.pminternship.servlet;

import com.pminternship.dao.UserDAO;
import com.pminternship.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Registration Servlet
 * Handles user registration requests
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

  private UserDAO userDAO;

  @Override
  public void init() throws ServletException {
    userDAO = new UserDAO();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // Get form parameters
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    // Validation
    if (fullName == null || fullName.trim().isEmpty() ||
        email == null || email.trim().isEmpty() ||
        mobile == null || mobile.trim().isEmpty() ||
        password == null || password.trim().isEmpty()) {

      response.sendRedirect("register.jsp?error=All fields are required");
      return;
    }

    // Check password match
    if (!password.equals(confirmPassword)) {
      response.sendRedirect("register.jsp?error=Passwords do not match");
      return;
    }

    // Check if email already exists
    if (userDAO.emailExists(email)) {
      response.sendRedirect("register.jsp?error=Email already registered");
      return;
    }

    // Validate mobile number
    if (!mobile.matches("\\d{10}")) {
      response.sendRedirect("register.jsp?error=Invalid mobile number");
      return;
    }

    // Create user object
    User user = new User(fullName.trim(), email.trim(), mobile.trim(), password);

    // Register user
    boolean registered = userDAO.registerUser(user);

    if (registered) {
      // Registration successful
      response.sendRedirect("login.jsp?registered=true");
    } else {
      // Registration failed
      response.sendRedirect("register.jsp?error=Registration failed. Please try again");
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Redirect to registration page
    response.sendRedirect("register.jsp");
  }
}