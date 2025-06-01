package com.webappjsp.servlet;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import jakarta.activation.DataSource;
import jakarta.activation.DataHandler;
import jakarta.mail.util.ByteArrayDataSource;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.awt.image.BufferedImage;
import java.util.Hashtable;
// import java.util.Base64;
import java.net.URLDecoder;

@WebServlet("/send-ticket")
public class EmailTicketServlet extends HttpServlet {
    
    // TODO: Configure email properties securely
    private static final String SENDER_EMAIL = "your_gmail_something@gmail.com"; // Replace with your email
    private static final String SENDER_PASSWORD = ""; // Replace with your email password (use App Password for Gmail)
    private static final String SMTP_HOST = "smtp.gmail.com"; // Gmail SMTP Host
    private static final String SMTP_PORT = "587"; // Gmail SMTP TLS Port

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipientEmail = request.getParameter("email");
        String concertTitle = request.getParameter("title");
        String ticketId = request.getParameter("ticketId");
        String imageUrl = request.getParameter("imageUrl");
        String concertDate = request.getParameter("date");
        String concertLocation = request.getParameter("location");

        if (recipientEmail == null || concertTitle == null || ticketId == null || imageUrl == null || concertDate == null || concertLocation == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing email, title, ticketId, imageUrl, date, or location parameters.");
            return;
        }

        try {
            imageUrl = URLDecoder.decode(imageUrl, "UTF-8");
            concertDate = URLDecoder.decode(concertDate, "UTF-8");
            concertLocation = URLDecoder.decode(concertLocation, "UTF-8");
            concertTitle = URLDecoder.decode(concertTitle, "UTF-8");
            recipientEmail = URLDecoder.decode(recipientEmail, "UTF-8");
            ticketId = URLDecoder.decode(ticketId, "UTF-8");
        } catch (IllegalArgumentException e) {
            System.err.println("Error decoding URL parameters: " + e.getMessage());
        }

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(SENDER_EMAIL));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));

            message.setSubject("Your Concert Ticket");

            MimeMultipart multipart = new MimeMultipart("related");

            MimeBodyPart htmlPart = new MimeBodyPart();

            String htmlText = "<html><body>" +
                              "<div style=\"width: 100%; max-width: 400px; margin: 0 auto; border: 1px solid #000; font-family: Arial, sans-serif;\">" +
                              "<div style=\"background-color: #000; padding: 10px; text-align: center;\">" +
                              "<img src=\"cid:conex-logo\" alt=\"CoNEX Logo\" style=\"height: 50px;\">" +
                              "</div>" +
                              "<div style=\"background-color: #ff9900; padding: 20px; text-align: center;\">" +
                              "<p style=\"margin: 0; font-size: 20px; color: #000; font-weight: bold;\">" + concertTitle + "</p>" +
                              "<div style=\"background-color: #5c4b45; padding: 10px 0; margin-top: 15px;\">" +
                              "<img src=\"cid:concert-image\" alt=\"Concert Image\" style=\"display: block; width: 100%; height: auto; object-fit: cover;\">" +
                              "</div>" +
                              "</div>" +
                              "<div style=\"background-color: #5c4b45; padding: 15px; text-align: center; color: #fff;\">" +
                              "<p style=\"margin: 0; font-size: 16px;\">Date: " + concertDate + "</p>" +
                              "<p style=\"margin: 5px 0 0 0; font-size: 14px;\">Venue: " + concertLocation + "</p>" +
                              "</div>" +
                              "<div style=\"background-color: #ff9900; padding: 20px; text-align: center;\">" +
                              "<p style=\"margin: 0; font-size: 16px; color: #000;\">Your Ticket QR Code</p>" +
                              "<p style=\"margin: 5px 0 0 0; font-size: 14px; color: #000;\">Ticket ID: " + ticketId + "</p>" +
                              "<img src=\"cid:qrcode-image\" alt=\"QR Code\" style=\"width: 150px; height: 150px; margin-top: 10px;\">" +
                              "</div>" +
                              "</div>" +
                              "</body></html>";

            htmlPart.setContent(htmlText, "text/html");
            multipart.addBodyPart(htmlPart);

            try {
                byte[] logoBytes = getServletContext().getResourceAsStream("/Images/Logo/CoNEX_Logo.png").readAllBytes();
                DataSource logoSource = new ByteArrayDataSource(logoBytes, "image/png");
                MimeBodyPart logoImagePart = new MimeBodyPart();
                logoImagePart.setDataHandler(new DataHandler(logoSource));
                logoImagePart.setFileName("CoNEX_Logo.png");
                logoImagePart.setContentID("<conex-logo>");
                logoImagePart.setHeader("Content-Transfer-Encoding", "base64");
                logoImagePart.setDisposition(MimeBodyPart.INLINE);
                multipart.addBodyPart(logoImagePart);
            } catch (IOException e) {
                 System.err.println("Error attaching logo: " + e.getMessage());
            }

            try {
                java.io.InputStream concertImageStream = getServletContext().getResourceAsStream(imageUrl);
                if (concertImageStream != null) {
                    byte[] concertImageBytes = concertImageStream.readAllBytes();
                    DataSource concertImageSource = new ByteArrayDataSource(concertImageBytes, "image/*");
                    MimeBodyPart concertImagePart = new MimeBodyPart();
                    concertImagePart.setDataHandler(new DataHandler(concertImageSource));
                    concertImagePart.setFileName(imageUrl.substring(imageUrl.lastIndexOf('/') + 1));
                    concertImagePart.setContentID("<concert-image>");
                    concertImagePart.setHeader("Content-Transfer-Encoding", "base64");
                    concertImagePart.setDisposition(MimeBodyPart.INLINE);
                    multipart.addBodyPart(concertImagePart);
                } else {
                    System.err.println("Concert image not found at path: " + imageUrl);
                }
            } catch (IOException e) {
                 System.err.println("Error attaching concert image: " + e.getMessage());
            }

            try {
                BufferedImage qrImage = generateQRCodeImage("Ticket ID: " + ticketId + "\nConcert: " + concertTitle, 200, 200);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                javax.imageio.ImageIO.write(qrImage, "png", baos);
                byte[] imageBytes = baos.toByteArray();
                DataSource qrCodeSource = new ByteArrayDataSource(imageBytes, "image/png");
                MimeBodyPart qrCodeImagePart = new MimeBodyPart();
                qrCodeImagePart.setDataHandler(new DataHandler(qrCodeSource));
                qrCodeImagePart.setFileName("ticket_qrcode.png");
                qrCodeImagePart.setContentID("<qrcode-image>");
                qrCodeImagePart.setHeader("Content-Transfer-Encoding", "base64");
                qrCodeImagePart.setDisposition(MimeBodyPart.INLINE);
                multipart.addBodyPart(qrCodeImagePart);
            } catch (WriterException | IOException e) {
                e.printStackTrace();
                 System.err.println("Error generating or attaching QR code: " + e.getMessage());
            }

            message.setContent(multipart);

            Transport.send(message);

            System.out.println("Email sent successfully to " + recipientEmail);

            response.sendRedirect(request.getContextPath() + "/emailSentSuccess.jsp");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error sending email: " + e.getMessage());
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
