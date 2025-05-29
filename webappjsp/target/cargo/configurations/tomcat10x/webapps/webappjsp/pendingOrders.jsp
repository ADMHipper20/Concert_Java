<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.webappjsp.model.Order" %>
<%@ page import="com.webappjsp.utils.jdbc" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Orders - SIZZLING CONCERT</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
    <style>
        /* Add specific styles for Pending Orders page */
        .pending-orders-container {
            max-width: 800px;
            margin: 60px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .pending-orders-container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #ff4d4d;
            padding-bottom: 10px;
        }
        .order-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
            margin-bottom: 15px;
        }
        .order-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        .order-item p {
            margin: 5px 0;
            color: #555;
        }
        .order-item strong {
            color: #e44d26;
        }
    </style>
</head>
<body>

    <div class="bg fill bg-fill bg-loaded">
        <video autoplay muted loop id="video-bg">
            <source src="videos/Honkai Star Rail Serval Trailer -  The Cusp of Ignition!.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>

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
        <div class="pending-orders-container">
            <h1>Pending Orders</h1>

            <% 
                List<Order> pendingOrders = null;
                String errorMessage = null;
                try (jdbc db = new jdbc()) {
                    pendingOrders = db.getPendingOrders();
                } catch (SQLException e) {
                    e.printStackTrace();
                    errorMessage = "Error retrieving pending orders: " + e.getMessage();
                }
            %>

            <% if (errorMessage != null) { %>
                <p style="color: red;"><%= errorMessage %></p>
            <% } else if (pendingOrders != null && !pendingOrders.isEmpty()) { %>
                <% for (Order order : pendingOrders) { %>
                    <div class="order-item">
                        <p><strong>Order ID:</strong> <%= order.getTicketId() %></p>
                        <p><strong>Concert:</strong> <%= order.getConcertTitle() %></p>
                        <p><strong>Customer:</strong> <%= order.getCustomerName() %></p>
                        <p><strong>Amount:</strong> Rp <%= String.format("%,.0f", order.getPrice()) %></p>
                        <p><strong>Payment Method:</strong> <%= order.getPaymentMethod() %></p>
                        <p><strong>Status:</strong> <%= order.getPaymentStatus() %></p>
                        <%-- Add more order details here if needed --%>
                    </div>
                <% } %>
            <% } else { %>
                <p>No pending orders found.</p>
            <% } %>

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