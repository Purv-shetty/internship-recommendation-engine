package com.aiinternship;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String qualification = request.getParameter("qualification");
        String skills = request.getParameter("skills");
        String location = request.getParameter("location");

        // For now, we just display the data (later we’ll store in MySQL)
        response.setContentType("text/html");
        response.getWriter().println("<h2>Registered Successfully!</h2>");
        response.getWriter().println("<p>Name: " + name + "</p>");
        response.getWriter().println("<p>Qualification: " + qualification + "</p>");
        response.getWriter().println("<p>Skills: " + skills + "</p>");
        response.getWriter().println("<p>Location: " + location + "</p>");
    }
}
