package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import com.xendit.Xendit;
import com.xendit.model.FixedVirtualAccount;
import com.xendit.exception.XenditException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/create-va")
public class CreateVAServlet extends HttpServlet {

    private static final String XENDIT_API_KEY = "xnd_development_pYMoDCLv5FCoaYkksZhBfkHo60p6jr0eRn08dlpD0OCgSD1iT0gQwOVidg"; // Replace with your actual API key

    @Override
    public void init() throws ServletException {
        // Initialize Xendit client
        Xendit.apiKey = XENDIT_API_KEY;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get order details from request parameters
        String title = request.getParameter("title");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String amountStr = request.getParameter("amount");
        String customerName = request.getParameter("name");
        String customerEmail = request.getParameter("email");
        // String customerPhone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");
        String ticketId = request.getParameter("ticketId");

        // Basic validation
        if (title == null || amountStr == null || customerName == null || customerEmail == null || paymentMethod == null || ticketId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters for VA creation.");
            return;
        }

        try {
            long amount = Long.parseLong(amountStr);

            // Create Virtual Account using Xendit API
            Map<String, Object> params = new HashMap<>();
            params.put("external_id", ticketId);
            params.put("bank_code", paymentMethod);
            params.put("name", customerName);
            params.put("expected_amount", amount);
            params.put("is_closed", true); // Fixed amount VA
            // Add expiration date if needed, format depends on Xendit API version
            // params.put("expiration_date", "2024-12-31T23:59:59Z"); 

            FixedVirtualAccount virtualAccount = FixedVirtualAccount.createClosed(params);
            
            // Store VA data in session for later use
            request.getSession().setAttribute("virtualAccount", virtualAccount);

            // Redirect to display VA details page
            String redirectUrl = "displayVADetails.jsp?" +
                               "title=" + URLEncoder.encode(title, StandardCharsets.UTF_8) +
                               "date=" + URLEncoder.encode(date, StandardCharsets.UTF_8) +
                               "Location=" + URLEncoder.encode(location, StandardCharsets.UTF_8) +
                               "&amount=" + amount +
                               "&customerName=" + URLEncoder.encode(customerName, StandardCharsets.UTF_8) +
                               "&vaNumber=" + URLEncoder.encode(virtualAccount.getAccountNumber(), StandardCharsets.UTF_8) +
                               "&vaInstructions=" + URLEncoder.encode(getVAInstructions(paymentMethod, virtualAccount), StandardCharsets.UTF_8);

            response.sendRedirect(redirectUrl);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format.");
        } catch (XenditException e) {
            e.printStackTrace(); // Log the full exception for debugging
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating Virtual Account: " + e.getMessage());
        }
    }

    private String getVAInstructions(String bankCode, FixedVirtualAccount va) {
        StringBuilder instructions = new StringBuilder();
        instructions.append("Please transfer the exact amount to:\n\n");
        instructions.append("Bank: ").append(bankCode).append("\n");
        instructions.append("Account Number: ").append(va.getAccountNumber()).append("\n");
        instructions.append("Account Name: ").append(va.getName()).append("\n\n");
        // Add expiration date to instructions if it was set
        // if (va.getExpirationDate() != null) {
        //     instructions.append("Payment will expire on ").append(va.getExpirationDate()).append("\n");
        // }
        instructions.append("Important:\n");
        instructions.append("1. Transfer the exact amount\n");
        // instructions.append("2. Payment will expire on ").append(va.getExpirationDate()).append("\n");
        instructions.append("2. Keep your payment receipt for reference");
        return instructions.toString();
    }
} 