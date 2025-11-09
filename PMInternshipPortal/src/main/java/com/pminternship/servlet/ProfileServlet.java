package com.pminternship.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.pminternship.model.User;

@WebServlet(name = "ProfileServlet", urlPatterns = { "/profile" })
public class ProfileServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null) {
      response.sendRedirect("login.jsp");
      return;
    }

    request.getRequestDispatcher("profile.jsp").forward(request, response);
  }
}