<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" type ="image/x-icon" href="#">
        <title>Order Tickets | SIZZLING CONCERT</title>
        <style>
            .order-container {
                background: rgba(0, 0, 0, 0.7);
                padding: 20px;
                border-radius: 10px;
                color: white;
                max-width: 800px;
                margin: 20px auto;
            }
            .ticket-options {
                margin: 20px 0;
            }
            .ticket-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }
            .quantity-control {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .quantity-control button {
                background: #ff4d4d;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 3px;
                cursor: pointer;
            }
            .quantity-control input {
                width: 50px;
                text-align: center;
                padding: 5px;
            }
            .order-form {
                margin-top: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input {
                width: 100%;
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ddd;
            }
            .buy-now-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff4d4d;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                margin-top: 20px;
                cursor: pointer;
            }
            .order-summary {
                margin-top: 20px;
                padding: 15px;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 5px;
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
                <ul class="ul-header-list">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Consert.jsp">Concert</a></li>
                    <li><a href="News.jsp">News</a></li>
                    <li><a href="About-Us.jsp">About Us</a></li>
                    <li><a href="#" id="buy-now">Buy one now!</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="flex-content">
                <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">Order Your Tickets</h1>
                
                <div class="order-container">
                    <div class="concert-details">
                        <h2>${param.title}</h2>
                        <p><strong>Date:</strong> ${param.date}</p>
                        <p><strong>Location:</strong> ${param.location}</p>
                        <p><strong>Description:</strong> ${param.description}</p>
                    </div>

                    <div class="ticket-options">
                        <h3>Available Tickets</h3>
                        <div class="ticket-item">
                            <div class="ticket-info">
                                <h4>VIP Pass</h4>
                                <p>Price: Rp 1.500.000</p>
                            </div>
                            <div class="quantity-control">
                                <button onclick="decrementQuantity('vip')">-</button>
                                <input type="number" id="vip-quantity" value="0" min="0" onchange="updateTotal()">
                                <button onclick="incrementQuantity('vip')">+</button>
                            </div>
                        </div>
                        <div class="ticket-item">
                            <div class="ticket-info">
                                <h4>Regular Pass</h4>
                                <p>Price: Rp 750.000</p>
                            </div>
                            <div class="quantity-control">
                                <button onclick="decrementQuantity('regular')">-</button>
                                <input type="number" id="regular-quantity" value="0" min="0" onchange="updateTotal()">
                                <button onclick="incrementQuantity('regular')">+</button>
                            </div>
                        </div>
                    </div>

                    <form class="order-form" action="processOrder.jsp" method="POST">
                        <input type="hidden" name="concertTitle" value="${param.title}">
                        <input type="hidden" name="concertDate" value="${param.date}">
                        <input type="hidden" name="concertLocation" value="${param.location}">
                        
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone">Phone Number:</label>
                            <input type="tel" id="phone" name="phone" required>
                        </div>

                        <div class="order-summary">
                            <h3>Order Summary</h3>
                            <p>VIP Tickets: <span id="vip-total">0</span> x Rp 1.500.000</p>
                            <p>Regular Tickets: <span id="regular-total">0</span> x Rp 750.000</p>
                            <p><strong>Total: Rp <span id="total-amount">0</span></strong></p>
                        </div>

                        <button type="submit" class="buy-now-button">Complete Order</button>
                    </form>
                </div>
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
                    <h4>List</h4>
                    <ul class="name-list">
                        <li><a href="#">Anime</a></li>
                        <li><a href="#">Characters</a></li>
                    </ul>
                </li>
                <li class="name-category">
                    <h4>Support</h4>
                    <ul class="name-list">
                        <li>
                            <a href="https://trakteer.id/HOTTORU" target="_blank">
                                <img src="Images/Trakteer.png" alt="Trakteer"> Hottoru
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="footer-copyright">
                <p>&copy; 2025 SZLConcert Org. All rights reserved.</p>
            </div>
        </div>
        <script>
            function incrementQuantity(type) {
                const input = document.getElementById(type + '-quantity');
                input.value = parseInt(input.value) + 1;
                updateTotal();
            }

            function decrementQuantity(type) {
                const input = document.getElementById(type + '-quantity');
                if (parseInt(input.value) > 0) {
                    input.value = parseInt(input.value) - 1;
                    updateTotal();
                }
            }

            function updateTotal() {
                const vipQuantity = parseInt(document.getElementById('vip-quantity').value) || 0;
                const regularQuantity = parseInt(document.getElementById('regular-quantity').value) || 0;
                
                document.getElementById('vip-total').textContent = vipQuantity;
                document.getElementById('regular-total').textContent = regularQuantity;
                
                const total = (vipQuantity * 1500000) + (regularQuantity * 750000);
                document.getElementById('total-amount').textContent = total.toLocaleString('id-ID');
            }
        </script>
    </body>
</html> 