package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
// import java.net.URLEncoder;
// import java.nio.charset.StandardCharsets;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.awt.image.BufferedImage;
import java.util.Hashtable;
import java.util.Base64;
import javax.imageio.ImageIO;

// TODO: Add Payment Gateway SDK imports here
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.google.gson.JsonObject;
// import com.google.gson.JsonParser;
import com.webappjsp.utils.jdbc;
import java.sql.SQLException;

@WebServlet("/create-qrcode")
public class CreateQrCodeServlet extends HttpServlet {

    // TODO: Initialize Payment Gateway client/config here
    // Assume you have a way to get your Xendit Secret Key and Callback URL
    private static final String XENDIT_SECRET_KEY = "xnd_development_"; // Replace with your test secret key
    private static final String XENDIT_QR_CREATE_URL = "https://api.xendit.co/qr_codes";
    private static final String YOUR_CALLBACK_URL = "https://precisely-included-killdeer.ngrok-free.app/webappjsp/payment-callback"; // Replace with your ngrok URL for PaymentCallbackServlet

    private final HttpClient httpClient = HttpClient.newHttpClient();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get order details from request parameters
        String title = request.getParameter("title");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String amountStr = request.getParameter("totalAmount");
        String customerName = request.getParameter("name");
        String customerEmail = request.getParameter("email");
        String customerPhone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");
        String ticketId = request.getParameter("ticketId");
        String artist = request.getParameter("artist");
        String genre = request.getParameter("genre");
        String ticketCountStr = request.getParameter("ticketCount");

        // Basic validation
        if (title == null || amountStr == null || customerName == null || customerEmail == null || paymentMethod == null || ticketCountStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters for QR code creation.");
            return;
        }

        try {
            long totalAmount = Long.parseLong(amountStr);
            int ticketCount = Integer.parseInt(ticketCountStr);

            // Generate QR code content
            String qrContent = String.format(
                "Payment for: %s\n" +
                "Date: %s\n" +
                "Location: %s\n" +
                "Amount: IDR %d\n" +
                "Quantity: %d\n" +
                "Customer: %s\n" +
                "Email: %s\n" +
                "Phone: %s\n" +
                "Payment Method: %s\n" +
                "Ticket ID: %s",
                title, date, location, totalAmount, ticketCount, customerName, customerEmail, customerPhone, paymentMethod, ticketId
            );

            // Generate QR code image (for display)
            BufferedImage qrImage = generateQRCodeImage(qrContent, 300, 300);
            
            // Convert QR code image to base64 (for display)
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(qrImage, "png", baos);
            String qrCodeBase64 = Base64.getEncoder().encodeToString(baos.toByteArray());

            // === Call Xendit API to Create QR Code Payment ===
            JsonObject xenditPayload = new JsonObject();
            xenditPayload.addProperty("external_id", ticketId);
            xenditPayload.addProperty("type", "DYNAMIC");
            xenditPayload.addProperty("amount", totalAmount);
            xenditPayload.addProperty("callback_url", YOUR_CALLBACK_URL);

            HttpRequest xenditRequest = HttpRequest.newBuilder()
                .uri(URI.create(XENDIT_QR_CREATE_URL))
                .header("Content-Type", "application/json")
                .header("Authorization", "Basic " + Base64.getEncoder().encodeToString((XENDIT_SECRET_KEY + ":").getBytes()))
                .POST(HttpRequest.BodyPublishers.ofString(xenditPayload.toString()))
                .build();

            HttpResponse<String> xenditResponse = httpClient.send(xenditRequest, HttpResponse.BodyHandlers.ofString());

            // Check Xendit API response
            if (xenditResponse.statusCode() != 200 && xenditResponse.statusCode() != 201) {
                // Log or handle the error appropriately
                System.err.println("Error creating Xendit QR code: " + xenditResponse.statusCode() + " - " + xenditResponse.body());
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create Xendit QR code.");
                return;
            }

            // === End Xendit API Call ===

            // === Save Order to Database ===
            try (jdbc db = new jdbc()) {
                db.saveOrder(ticketId, title, date, location, totalAmount, artist, genre, "QRIS", ticketCount, customerName, customerEmail, customerPhone, paymentMethod);
                System.out.println("Order saved to database with Ticket ID: " + ticketId + ", Total Amount: " + totalAmount + ", Quantity: " + ticketCount);
            } catch (SQLException e) {
                System.err.println("Database error saving order: " + e.getMessage());
                e.printStackTrace();
                // Depending on your error handling, you might want to rollback Xendit creation or notify the user
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save order details.");
                return;
            }
            // === End Save Order ===

            // Set QR code data as a request attribute (using the locally generated Base64 image)
            request.setAttribute("qrCodeImageBase64", qrCodeBase64);
            request.setAttribute("title", title);
            request.setAttribute("amount", totalAmount);
            request.setAttribute("customerName", customerName);
            request.setAttribute("ticketId", ticketId);

            // Forward to the display QR code page
            request.getRequestDispatcher("displayQrCode.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format.");
        } catch (WriterException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating QR code: " + e.getMessage());
        } catch (InterruptedException e) {
            // Handle interruption during HTTP call
            System.err.println("Xendit API call interrupted: " + e.getMessage());
            Thread.currentThread().interrupt(); // Restore the interrupted status
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Payment processing interrupted.");
        }
    }

    private BufferedImage generateQRCodeImage(String text, int width, int height) throws WriterException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        Hashtable<EncodeHintType, Object> hints = new Hashtable<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height, hints);
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }
} 
