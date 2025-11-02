package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // You can later add database logic here
        response.setContentType("text/html");
        response.getWriter().println("<h3>Registration Successful!</h3>");
        response.getWriter().println("<p>Welcome, " + name + " (" + email + ")</p>");
    }
}
