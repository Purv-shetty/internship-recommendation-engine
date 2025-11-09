package com.pminternship.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.pminternship.dao.UserDAO;
import com.pminternship.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private UserDAO userDAO;

  public void init() {
    userDAO = new UserDAO();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
      User user = userDAO.loginUser(email, password);
      if (user != null) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        response.sendRedirect("dashboard.jsp");
      } else {
        request.setAttribute("error", "Invalid email or password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
      }
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("error", "An error occurred");
      request.getRequestDispatcher("login.jsp").forward(request, response);
    }
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.getRequestDispatcher("login.jsp").forward(request, response);
  }
}
