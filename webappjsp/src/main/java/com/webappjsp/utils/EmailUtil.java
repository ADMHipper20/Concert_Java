package com.webappjsp.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
import java.util.Map;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class EmailUtil {
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String EMAIL_FROM = "daniadinugroho@gmail.com"; // Replace with your Gmail
    private static final String EMAIL_PASSWORD = "bqwq rpwk srdu avyn"; // Replace with your app password
    private static final String EMAIL_TEMPLATE_PATH = "src/main/webapp/WEB-INF/emailTemplates/ticket_email_template.html";

    public static void sendTicketEmail(String toEmail, String ticketId, Map<String, String> orderDetails) throws MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, EMAIL_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(EMAIL_FROM));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject("Your Concert Ticket - " + orderDetails.get("title"));

        // Read the HTML email template
        String htmlTemplate = new String(Files.readAllBytes(Paths.get(EMAIL_TEMPLATE_PATH)));

        // Populate the template with order details
        String htmlEmailBody = String.format(
            htmlTemplate,
            orderDetails.get("customer_name"),
            orderDetails.get("title"),
            orderDetails.get("date"),
            orderDetails.get("location"),
            orderDetails.get("price"), // Using price here, assuming it's the total or relevant amount
            ticketId
        );

        message.setContent(htmlEmailBody, "text/html");

        Transport.send(message);
    }
} 