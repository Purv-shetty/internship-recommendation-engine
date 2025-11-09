package com.pminternship.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchInternshipServlet")
public class SearchInternshipServlet extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Get search parameters
    String keywords = request.getParameter("keywords");
    String location = request.getParameter("location");
    String category = request.getParameter("category");
    String duration = request.getParameter("duration");
    String[] workTypes = request.getParameterValues("workType");

    // TODO: Implement search logic with database
    // For now, we'll just redirect back to the search page
    // In a real implementation, you would:
    // 1. Query the database with these parameters
    // 2. Set the results in request attributes
    // 3. Forward to search.jsp to display results

    response.sendRedirect("search.jsp");
  }
}