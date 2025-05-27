package com.webappjsp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class HomeServlet extends HttpServlet {
    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
            
        // Set content type
        response.setContentType("text/html;charset=UTF-8");

        // Get the writer to send output
        PrintWriter out = response.getWriter();
        
        try {
            // Mock data for "TOP 3 Largest Incomes" (you can replace this with dynamic data from a database or API)
            List<String> top3Incomes = new ArrayList<>();
            top3Incomes.add("Event 1 - $5000");
            top3Incomes.add("Event 2 - $4500");
            top3Incomes.add("Event 3 - $4000");

            // Set the list as an attribute for the JSP to access
            request.setAttribute("top3Incomes", top3Incomes);

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            out.close();
        }
    }
}
