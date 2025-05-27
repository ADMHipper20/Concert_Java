package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.BufferedReader;
import com.webappjsp.utils.jdbc;
import com.webappjsp.utils.EmailUtil;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.JSONException;
import java.sql.SQLException;
import jakarta.mail.MessagingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@WebServlet("/payment-callback")
public class PaymentCallbackServlet extends HttpServlet {
    
    private static final String XENDIT_CALLBACK_TOKEN = "Fev0UE36XmW3hNEGUYQonEM8ODkI6Prsfe9y2tpEJQiFAeKl"; // Replace with your Xendit callback token
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Verify Xendit callback signature
        String xCallbackToken = request.getHeader("x-callback-token");
        if (!XENDIT_CALLBACK_TOKEN.equals(xCallbackToken)) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid callback token");
            return;
        }

        // Read request body
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        String jsonBody = jsonBuilder.toString();

        try {
            // Parse JSON payload
            JSONObject payload = new JSONObject(new JSONTokener(jsonBody));

            // Log the incoming payload for debugging
            System.out.println("Received Xendit webhook payload: " + payload.toString(2));

            String status;
            String externalId;

            // Check if this is a QR code callback (has data object) or VA callback
            if (payload.has("qr_code")) {
                // QR Code callback
                JSONObject qrCode = payload.getJSONObject("qr_code");
                status = payload.getString("status");
                externalId = qrCode.getString("external_id");
            } else if (payload.has("external_id")) {
                // Virtual Account callback
                status = "PAID"; // VA callbacks only come when payment is successful
                externalId = payload.getString("external_id");
            } else {
                throw new JSONException("Invalid webhook payload: missing qr_code or external_id");
            }

            // Update order status in database
            try (jdbc db = new jdbc()) { // Use try-with-resources for proper connection handling
                if ("PAID".equals(status) || "SUCCEEDED".equals(status) || "COMPLETED".equals(status)) {
                    // Update order status to paid for both VA and QRIS successful payments
                    db.updateOrderStatus(externalId, "PAID");
                    
                    // Get order details for email and success page
                    Map<String, String> orderDetails = db.getOrderDetails(externalId);
                    if (orderDetails != null) {
                        // Send confirmation email
                        String customerEmail = orderDetails.get("customer_email");
                        if (customerEmail != null) {
                            try {
                                EmailUtil.sendTicketEmail(customerEmail, externalId, orderDetails);
                                System.out.println("Ticket email sent to " + customerEmail);
                            } catch (MessagingException e) {
                                System.err.println("Failed to send ticket email: " + e.getMessage());
                                e.printStackTrace();
                            }
                        }

                        // Redirect to success page with order details
                        String redirectUrl = request.getContextPath() + "/paymentComplete.jsp?" +
                            "title=" + URLEncoder.encode(orderDetails.get("title"), StandardCharsets.UTF_8) +
                            "&date=" + URLEncoder.encode(orderDetails.get("date"), StandardCharsets.UTF_8) +
                            "&location=" + URLEncoder.encode(orderDetails.get("location"), StandardCharsets.UTF_8) +
                            "&price=" + URLEncoder.encode(orderDetails.get("price"), StandardCharsets.UTF_8) +
                            "&name=" + URLEncoder.encode(orderDetails.get("customer_name"), StandardCharsets.UTF_8) +
                            "&email=" + URLEncoder.encode(orderDetails.get("customer_email"), StandardCharsets.UTF_8) +
                            "&phone=" + URLEncoder.encode(orderDetails.get("customer_phone"), StandardCharsets.UTF_8) +
                            "&paymentMethod=" + URLEncoder.encode(orderDetails.get("payment_method"), StandardCharsets.UTF_8) +
                            "&ticketId=" + URLEncoder.encode(externalId, StandardCharsets.UTF_8);
                        
                        response.sendRedirect(redirectUrl);
                        return;
                    }
                } else if ("EXPIRED".equals(status)) {
                    // Update order status to expired
                    db.updateOrderStatus(externalId, "EXPIRED");
                } else {
                    // Log other statuses if needed
                    System.out.println("Received Xendit webhook with status: " + status + " for external_id: " + externalId);
                }
            }

            // Return success response to Xendit
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\"}");

        } catch (JSONException e) {
            System.err.println("JSON parsing error in PaymentCallbackServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON payload: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Database error in PaymentCallbackServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error in PaymentCallbackServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error: " + e.getMessage());
        }
    }
} 