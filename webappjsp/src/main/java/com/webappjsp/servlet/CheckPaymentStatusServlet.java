package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.webappjsp.utils.jdbc;
import java.sql.SQLException;
import org.json.JSONObject;

@WebServlet("/check-payment-status")
public class CheckPaymentStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketId = request.getParameter("ticketId");

        if (ticketId == null || ticketId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ticketId parameter.");
            return;
        }

        try (jdbc db = new jdbc()) {
            String paymentStatus = db.getOrderStatus(ticketId);
            
            JSONObject jsonResponse = new JSONObject();
            if (paymentStatus != null) {
                jsonResponse.put("status", "success");
                jsonResponse.put("paymentStatus", paymentStatus);
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Order not found.");
            }

            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());

        } catch (SQLException e) {
            System.err.println("Database error checking payment status: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
} 