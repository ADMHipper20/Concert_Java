package com.webappjsp.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
import java.util.Map;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.NumberFormat;
import java.util.Locale;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
// import java.io.File;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.InputStream;

public class EmailUtil {
    private static final String SMTP_HOST = "smtp.gmail.com"; // This will be replaced with the ESP's SMTP host
    private static final String SMTP_PORT = "587"; // This will be replaced with the ESP's SMTP port
    // private static final String SMTP_USERNAME = "daniadinugroho@gmail.com"; // Removed Gmail username
    // private static final String EMAIL_PASSWORD = "bqwq rpwk srdu avyn"; // Removed Gmail app password
    private static final String EMAIL_TEMPLATE_PATH = "src/main/webapp/WEB-INF/emailTemplates/ticket_email_template.html";

    public static void sendTicketEmail(String toEmail, String ticketId, Map<String, String> orderDetails, InputStream concertImageStream) throws MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // This will be replaced with the ESP's authentication
                return new PasswordAuthentication("", "");
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("noreply@CoNEX.com"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject("Your Concert Ticket - " + orderDetails.get("title"));

        // Generate QR code for the ticket
        String qrCodeBase64 = generateQRCode(ticketId);
        
        // Generate Base64 for concert image from stream
        String concertImageBase64 = "";
        if (concertImageStream != null) {
             try {
                 concertImageBase64 = encodeImageStreamToBase64(concertImageStream);
             } catch (IOException e) {
                 System.err.println("Failed to encode concert image to Base64: " + e.getMessage());
                 e.printStackTrace();
                 // Continue without image if encoding fails
             }
        }

        // Read the HTML email template
        String htmlTemplate = new String(Files.readAllBytes(Paths.get(EMAIL_TEMPLATE_PATH)));

        // Populate the template with order details
        String htmlEmailBody = String.format(
            htmlTemplate,
            orderDetails.get("customer_name"),
            concertImageBase64,
            orderDetails.get("title"),
            orderDetails.get("artist"),
            orderDetails.get("genre"),
            orderDetails.get("date"),
            orderDetails.get("location"),
            formatRupiah(orderDetails.get("price")),
            ticketId,
            qrCodeBase64
        );

        message.setContent(htmlEmailBody, "text/html");

        Transport.send(message);
        
        // Close the stream after use
        if (concertImageStream != null) {
            try {
                concertImageStream.close();
            } catch (IOException e) {
                System.err.println("Error closing concert image stream: " + e.getMessage());
            }
        }
    }

    private static String generateQRCode(String ticketId) throws IOException {
        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(ticketId, BarcodeFormat.QR_CODE, 200, 200);
            
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);
            byte[] qrCodeBytes = outputStream.toByteArray();
            
            return "data:image/png;base64," + Base64.getEncoder().encodeToString(qrCodeBytes);
        } catch (WriterException e) {
            throw new IOException("Failed to generate QR code", e);
        }
    }
    
    private static String encodeImageStreamToBase64(InputStream imageStream) throws IOException {
        try {
            BufferedImage originalImage = ImageIO.read(imageStream);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(originalImage, "png", baos);
            byte[] imageBytes = baos.toByteArray();
            return "data:image/png;base64," + Base64.getEncoder().encodeToString(imageBytes);
        } catch (IOException e) {
            throw new IOException("Could not read or encode image stream", e);
        }
    }

    private static String formatRupiah(String amount) {
        try {
            double amountDouble = Double.parseDouble(amount);
            NumberFormat formatter = NumberFormat.getCurrencyInstance(Locale.forLanguageTag("id-ID"));
            formatter.setMaximumFractionDigits(0);
            return formatter.format(amountDouble);
        } catch (NumberFormatException e) {
            return amount; // Return original if parsing fails
        }
    }
}
