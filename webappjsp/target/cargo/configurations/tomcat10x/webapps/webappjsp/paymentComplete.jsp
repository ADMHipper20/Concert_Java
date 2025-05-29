<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.webappjsp.utils.jdbc" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Order Confirmed - SIZZLING CONCERT</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
        <style>
        /* Add any necessary styling */
        </style>
    </head>
    <body>

    <!-- Standard Header -->
        <div class="navbar-pg">
            <div class="header">
                <img src="Images/Logo/CoNEX.svg" alt="CoNEX Logo" class="logo">
                <ul class="ul-header-list">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Concert.jsp">Concert</a></li>
                    <li><a href="News.jsp">News</a></li>
                    <li><a href="About-Us.jsp">About Us</a></li>
                    <li><a href="Order.jsp" id="buy-now">Buy one now!</a></li>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="order-confirmed-container">
                <h1>Order Confirmed!</h1>

                <% 
                String ticketId = request.getParameter("ticketId");
                Map<String, String> orderDetails = null;
                    String errorMessage = null;

                if (ticketId != null && !ticketId.isEmpty()) {
                    try (jdbc db = new jdbc()) {
                        orderDetails = db.getOrderDetails(ticketId);
                        if (orderDetails == null) {
                            errorMessage = "Order details not found for Ticket ID: " + ticketId;
                        }
                    } catch (SQLException e) {
                        errorMessage = "Database error retrieving order details: " + e.getMessage();
                        e.printStackTrace();
                    }
                } else {
                    errorMessage = "Missing Ticket ID.";
                        }
                %>

            <% if (orderDetails != null) { %>
                    <p>Thank you for your order!</p>
                <p>Your payment has been confirmed and your ticket is being sent to your email address.</p>
                
                    <div class="payment-details">
                        <h3>Order Details</h3>
                    <p><strong>Concert:</strong> <%= orderDetails.get("title") %></p>
                    <p><strong>Date:</strong> <%= orderDetails.get("date") %></p>
                    <p><strong>Location:</strong> <%= orderDetails.get("location") %></p>
                    <%-- Assuming price is single ticket price here, you might want total amount --%>
                    <p><strong>Total Price:</strong> Rp <%= orderDetails.get("price") %></p>
                    <p><strong>Payment Method:</strong> <%= orderDetails.get("payment_method") %></p>
                    <p><strong>Ticket ID:</strong> <%= ticketId %></p>
                    </div>
                
                <% } else { %>
                <p style="color: red;">Error: <%= errorMessage %></p>
                <% } %>

            <%-- 
                Optional: Add a link to view order history or ticket details page if you create one.
                For now, just directing back to home.
            --%>
                <p style="margin-top: 20px;"><a href="index.jsp" class="return-home">Return to Home</a></p>

            </div>
        </div>

    <!-- Standard Footer -->
        <div class="footer">
            <ul class="ul-footer-list">
                <li class="name-category">
                    <h4>Developer</h4>
                    <ul class="name-list">
                        <li>Dani Adinugroho (FE/Server)</li>
                        <li>I Gede Hermawan (FE)</li>
                        <li>I Gede Fender (BE)</li>
                        <li>Rio Firman (BE)</li>
                        <li>Farandio Al-Khalid (BE)</li>
                    </ul>
                </li>
                <li class="name-category">
                    <h4>GitHub</h4>
                    <ul class="name-list">
                        <li><a href="https://github.com/ADMHipper20" target="_blank">Dani</a></li>
                        <li><a href="https://github.com/ADMHipper20" target="_blank">Hermawan</a></li>
                        <li><a href="https://github.com/ADMHipper20" target="_blank">Fender</a></li>
                        <li><a href="https://github.com/ADMHipper20" target="_blank">Rio</a></li>
                        <li><a href="https://github.com/ADMHipper20" target="_blank">Farandio</a></li>
                    </ul>
                </li>
                <li class="name-category">
                    <h4>Support</h4>
                    <ul class="name-list">
                        <li>
                            <a href="https://trakteer.id/HOTTORU" target="_blank">
                                <img src="Images/BGtest/Trakteer.png" alt="Trakteer"> Hottoru
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="footer-copyright">
                <p>&copy; 2025 CoNEX. All rights reserved.</p>
            </div>
        </div>

    </body>
</html> 