package com.webappjsp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.xendit.Xendit;
import com.xendit.model.QRCode;
import com.xendit.model.FixedVirtualAccount;
import com.xendit.exception.XenditException;
import java.util.HashMap;
import java.util.Map;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.BarcodeFormat;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import java.util.Base64;
import java.sql.SQLException;
import com.webappjsp.utils.jdbc;

@WebServlet("/xendit-payment")
public class XenditPaymentServlet extends HttpServlet {
    
    private static final String XENDIT_API_KEY = "xnd_development_"; // Replace with your actual API key
    // Update this URL whenever you restart ngrok
    private static final String NGROK_BASE_URL = "https://precisely-included-killdeer.ngrok-free.app";
    
    @Override
    public void init() throws ServletException {
        // Initialize Xendit client
        Xendit.apiKey = XENDIT_API_KEY;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        String amount = request.getParameter("totalAmount");
        String title = request.getParameter("title");
        String customerName = request.getParameter("name");
        String customerEmail = request.getParameter("email");
        String ticketId = request.getParameter("ticketId");

         if (paymentMethod == null || amount == null || title == null || customerName == null || customerEmail == null || ticketId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters for payment.");
            return;
        }

        try {
            if ("QRIS".equals(paymentMethod)) {
                // Create QRIS payment
                long amountLong = Long.parseLong(amount);

                // Check if amount is within Xendit QRIS limits (1500 - 10,000,000 IDR)
                if (amountLong < 1500 || amountLong > 10000000) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Payment amount must be between 1,500 and 10,000,000 IDR for QRIS.");
                    return;
                }

                Map<String, Object> params = new HashMap<>();
                params.put("external_id", ticketId);
                params.put("amount", amountLong);
                params.put("type", "DYNAMIC");
                // Use ngrok URL for callback
                params.put("callback_url", NGROK_BASE_URL + "/payment-callback");
                params.put("description", "Payment for " + title);
                params.put("currency", "IDR");
                params.put("channel_code", "ID_QRIS"); // Required for QRIS payments
                params.put("metadata", new HashMap<String, String>() {{
                    put("customer_name", customerName);
                    put("customer_email", customerEmail);
                }});

                // Use createQRCode method for QR codes
                QRCode qrCode = QRCode.createQRCode(params);
                
                // Store QR code data in session for later use
                request.getSession().setAttribute("qrCode", qrCode);
                
                // Convert QR string to base64 image
                String qrString = qrCode.getQrString();
                // Create QR code image using a QR code library
                QRCodeWriter qrCodeWriter = new QRCodeWriter();
                BitMatrix bitMatrix = qrCodeWriter.encode(qrString, BarcodeFormat.QR_CODE, 300, 300);
                
                // Convert to image
                BufferedImage qrImage = new BufferedImage(300, 300, BufferedImage.TYPE_INT_RGB);
                for (int x = 0; x < 300; x++) {
                    for (int y = 0; y < 300; y++) {
                        qrImage.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
                    }
                }
                
                // Convert to base64
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(qrImage, "png", baos);
                String base64Image = Base64.getEncoder().encodeToString(baos.toByteArray());
                
                // Set request attributes for display
                request.setAttribute("qrCodeImageBase64", base64Image);
                request.setAttribute("title", title);
                request.setAttribute("amount", amount);
                request.setAttribute("customerName", customerName);
                
                // Forward to display QR code page
                request.getRequestDispatcher("displayQrCode.jsp").forward(request, response);
                
            } else if (paymentMethod.matches("BCA|Mandiri|BNI|BRI")) {
                // Create Virtual Account
                Map<String, Object> params = new HashMap<>();
                params.put("external_id", ticketId);
                params.put("bank_code", paymentMethod);
                params.put("name", customerName);
                params.put("expected_amount", Long.parseLong(amount));
                params.put("is_closed", true);
                params.put("currency", "IDR");
                params.put("callback_url", NGROK_BASE_URL + "/payment-callback");

                try {
                    // Use createClosed method for fixed VA
                    FixedVirtualAccount virtualAccount = FixedVirtualAccount.createClosed(params);
                    
                    // Debug: Print all available fields and their values
                    System.out.println("=== Virtual Account Response Details ===");
                    System.out.println("All fields: " + virtualAccount.toString());
                    System.out.println("ID: " + virtualAccount.getId());
                    System.out.println("Account Number: " + virtualAccount.getAccountNumber());
                    System.out.println("Bank Code: " + virtualAccount.getBankCode());
                    System.out.println("Expected Amount: " + virtualAccount.getExpectedAmount());
                    System.out.println("Status: " + virtualAccount.getStatus());
                    System.out.println("Owner ID: " + virtualAccount.getOwnerId());
                    System.out.println("External ID: " + virtualAccount.getExternalId());
                    System.out.println("Merchant Code: " + virtualAccount.getMerchantCode());
                    System.out.println("=== End Virtual Account Details ===");
                    
                    if (virtualAccount.getStatus() == null || 
                        (!virtualAccount.getStatus().equals("ACTIVE") && !virtualAccount.getStatus().equals("PENDING"))) {
                        throw new XenditException("Virtual Account creation failed or invalid status: " + virtualAccount.getStatus());
                    }
                    
                    // Store the Virtual Account ID in session for later use
                    request.getSession().setAttribute("virtualAccountId", virtualAccount.getId());
                    
                    // === Save Order to Database ===
                    try (jdbc db = new jdbc()) {
                        // You will need to adapt this call to match your saveOrder method signature
                        // Ensure you are passing the correct parameters including ticketCount and totalAmount
                        // Assuming you have ticketCount available from the request parameters
                        String ticketCountStr = request.getParameter("ticketCount");
                        int ticketCount = 1; // Default to 1 if ticketCount is not available
                        if (ticketCountStr != null) {
                            try {
                                ticketCount = Integer.parseInt(ticketCountStr);
                            } catch (NumberFormatException e) {
                                System.err.println("Invalid ticket count format: " + ticketCountStr);
                            }
                        }
                        
                        String artist = request.getParameter("artist");
                        String genre = request.getParameter("genre");
                        String date = request.getParameter("date");
                        String location = request.getParameter("location");
                        long totalAmount = Long.parseLong(amount);

                        db.saveOrder(ticketId, title, date, location, totalAmount, artist, genre, paymentMethod, ticketCount, customerName, customerEmail, request.getParameter("phone"), paymentMethod);
                        System.out.println("Order saved to database with Ticket ID: " + ticketId + ", Total Amount: " + totalAmount + ", Quantity: " + ticketCount);
                    } catch (SQLException e) {
                        System.err.println("Database error saving order for VA: " + e.getMessage());
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save order details for VA.");
                        return;
                    }
                    // === End Save Order ===

                    // Pass VA data to display page via request attributes or session
                    request.setAttribute("vaNumber", virtualAccount.getAccountNumber());
                    request.setAttribute("bankCode", virtualAccount.getBankCode());
                    request.setAttribute("amount", virtualAccount.getExpectedAmount());
                    // Assuming Xendit response includes expiry date, add it here
                    // request.setAttribute("expiryDate", virtualAccount.getExpirationDate()); 
                    request.setAttribute("customerName", customerName);
                    request.setAttribute("title", title);
                    request.setAttribute("ticketId", ticketId);

                    // Forward to display VA details page
                    request.getRequestDispatcher("displayVADetails.jsp").forward(request, response);
                    
                } catch (XenditException e) {
                    e.printStackTrace(); // Log the full exception for debugging
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating payment: " + e.getMessage());
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unsupported payment method: " + paymentMethod);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format.");
        } catch (XenditException e) {
            e.printStackTrace(); // Log the full exception for debugging
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating payment: " + e.getMessage());
        } catch (WriterException e) {
            e.printStackTrace(); // Log the QR code generation error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating QR code: " + e.getMessage());
        } catch (IOException e) {
            e.printStackTrace(); // Log the image conversion error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing QR code image: " + e.getMessage());
        }
    }
} 
