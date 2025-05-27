package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.webappjsp.utils.jdbc;

@WebServlet("/validate-ticket")
public class ValidateTicketServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketId = request.getParameter("ticketId");
        
        if (ticketId == null || ticketId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ticket ID is required");
            return;
        }

        try (jdbc db = new jdbc()){
            boolean isValid = db.validateTicket(ticketId);
            
            if (isValid) {
                response.setContentType("application/json");
                response.getWriter().write("{\"status\":\"valid\",\"message\":\"Ticket is valid\"}");
            } else {
                response.setContentType("application/json");
                response.getWriter().write("{\"status\":\"invalid\",\"message\":\"Invalid ticket\"}");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error validating ticket: " + e.getMessage());
        }
    }
} 