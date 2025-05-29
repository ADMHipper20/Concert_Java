<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
        <title>Select Tickets | SIZZLING CONCERT</title>
        <style>
            .ticket-container {
                max-width: 800px;
                margin: 60px auto;
                padding: 20px;
                background: rgba(255, 255, 255, 0.95);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .ticket-options {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
                margin: 20px 0;
            }
            .ticket-type {
                border: 2px solid #ddd;
                border-radius: 10px;
                padding: 20px;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .ticket-type:hover {
                border-color: #e44d26;
                transform: translateY(-5px);
            }
            .ticket-type.selected {
                border-color: #e44d26;
                background: #fff5f2;
            }
            .ticket-type h3 {
                color: #333;
                margin-bottom: 10px;
            }
            .ticket-type .price {
                color: #e44d26;
                font-size: 1.5em;
                font-weight: bold;
                margin: 10px 0;
            }
            .ticket-type .features {
                list-style: none;
                padding: 0;
                margin: 15px 0;
            }
            .ticket-type .features li {
                margin: 5px 0;
                color: #666;
            }
            .ticket-type .features li:before {
                content: "✓";
                color: #e44d26;
                margin-right: 10px;
            }
            .continue-button {
                background: #e44d26;
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 5px;
                font-size: 1.2em;
                cursor: pointer;
                width: 100%;
                margin-top: 20px;
                transition: background 0.3s ease;
            }
            .continue-button:hover {
                background: #c73e1d;
            }
            .continue-button:disabled {
                background: #ccc;
                cursor: not-allowed;
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
            <div class="ticket-container">
                <h2>Select Your Ticket Type</h2>
                
                <%
                // Get parameters from the request
                String title = request.getParameter("title");
                String date = request.getParameter("date");
                String location = request.getParameter("location");
                String artist = request.getParameter("artist");
                String genre = request.getParameter("genre");
                String basePrice = request.getParameter("price");
                
                // Calculate VIP price (50% more than regular)
                double regularPrice = 0;
                try {
                    regularPrice = Double.parseDouble(basePrice != null ? basePrice : "0");
                } catch (NumberFormatException e) {
                    regularPrice = 0;
                }
                double vipPrice = regularPrice * 1.5;
                %>

                <div class="concert-info" style="margin-bottom: 20px; padding: 15px; background: #f9f9f9; border-radius: 5px;">
                    <div style="display: flex; gap: 20px; align-items: center;">
                        <img src='<%= request.getContextPath() %>/<%= request.getParameter("imageUrl") %>' alt="<%= title %>" style="width: 200px; height: 200px; object-fit: cover; border-radius: 8px;">
                        <div>
                            <h3 style="margin-bottom: 10px;"><%= title %></h3>
                            <p><strong>Artist:</strong> <%= artist %></p>
                            <p><strong>Date:</strong> <%= date %></p>
                            <p><strong>Location:</strong> <%= location %></p>
                        </div>
                    </div>
                </div>

                <div class="ticket-options">
                    <div class="ticket-type" data-type="Regular" data-price="<%= regularPrice %>" onclick="selectTicketType(this)">
                        <h3>Regular Ticket</h3>
                        <div class="price">Rp <%= String.format("%,.0f", regularPrice) %></div>
                        <ul class="features">
                            <li>Standard seating</li>
                            <li>Access to main concert area</li>
                            <li>Basic amenities</li>
                            <li>Standard entry time</li>
                        </ul>
                    </div>

                    <div class="ticket-type" data-type="VIP" data-price="<%= vipPrice %>" onclick="selectTicketType(this)">
                        <h3>VIP Ticket</h3>
                        <div class="price">Rp <%= String.format("%,.0f", vipPrice) %></div>
                        <ul class="features">
                            <li>Premium seating</li>
                            <li>Exclusive VIP area access</li>
                            <li>Complimentary refreshments</li>
                            <li>Early entry</li>
                            <li>Meet & Greet opportunity</li>
                            <li>Exclusive merchandise</li>
                        </ul>
                    </div>
                </div>

                <button class="continue-button" onclick="continueToPayment()" disabled>Continue to Payment</button>
            </div>
        </div>
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
        <script>
            let selectedTicketType = null;
            let selectedPrice = 0;

            function selectTicketType(element) {
                // Remove selected class from all ticket types
                document.querySelectorAll('.ticket-type').forEach(ticket => {
                    ticket.classList.remove('selected');
                });
                
                // Add selected class to clicked ticket type
                element.classList.add('selected');
                selectedTicketType = element.getAttribute('data-type');
                selectedPrice = parseFloat(element.getAttribute('data-price'));
                
                // Enable continue button
                document.querySelector('.continue-button').disabled = false;
            }

            function continueToPayment() {
                if (!selectedTicketType) {
                    alert('Please select a ticket type');
                    return;
                }

                // Redirect to process order page with all parameters
                const params = new URLSearchParams(window.location.search);
                params.set('ticketType', selectedTicketType);
                params.set('price', selectedPrice);
                // Make sure imageUrl is included
                const imageUrl = params.get('imageUrl');
                if (imageUrl) {
                    params.set('imageUrl', imageUrl);
                }
                window.location.href = 'processOrder.jsp?' + params.toString();
            }
        </script>
    </body>
</html> 