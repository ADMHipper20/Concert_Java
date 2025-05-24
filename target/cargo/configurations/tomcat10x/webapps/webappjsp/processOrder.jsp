<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <title>Process Order | SIZZLING CONCERT</title>
        <style>
            .order-container {
                max-width: 800px;
                margin: 20px auto;
                padding: 30px;
                background: rgba(255, 255, 255, 0.95);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .order-details {
                margin-bottom: 30px;
                color: #333;
            }
            .order-details h2 {
                color: #333;
                margin-bottom: 20px;
                border-bottom: 2px solid #e44d26;
                padding-bottom: 10px;
            }
            .order-info {
                display: grid;
                grid-template-columns: 150px 1fr;
                gap: 15px;
                margin-bottom: 20px;
                padding: 15px;
                background: #f9f9f9;
                border-radius: 8px;
            }
            .order-info label {
                font-weight: bold;
                text-align: right;
                color: #333;
                padding: 8px 0;
            }
            .order-info div {
                color: #333;
                padding: 8px 0;
                display: flex;
                align-items: center;
            }
            .payment-methods {
                margin-top: 30px;
                padding: 20px;
                background: #f9f9f9;
                border-radius: 8px;
            }
            .payment-methods h3 {
                color: #333;
                margin-bottom: 20px;
            }
            .payment-method {
                display: flex;
                align-items: center;
                border: 1px solid #ddd;
                padding: 15px;
                margin-bottom: 15px;
                border-radius: 5px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: white;
            }
            .payment-method:hover {
                border-color: #e44d26;
                background: #fff5f2;
            }
            .payment-method.selected {
                border-color: #e44d26;
                background: #fff5f2;
            }
            .payment-method img {
                width: 50px;
                height: 50px;
                object-fit: contain;
                margin-right: 15px;
            }
            .payment-method span {
                color: #333;
                font-size: 1.1em;
            }
            .total-amount {
                font-size: 1.5em;
                color: #e44d26;
                text-align: right;
                margin: 20px 0;
                padding: 15px;
                background: #fff5f2;
                border-radius: 8px;
                font-weight: bold;
            }
            .confirm-button {
                background: #e44d26;
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 5px;
                font-size: 1.2em;
                cursor: pointer;
                width: 100%;
                transition: background 0.3s ease;
                margin-top: 20px;
            }
            .confirm-button:hover {
                background: #c73e1d;
            }
            .ticket-count {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .ticket-count button {
                background: #e44d26;
                color: white;
                border: none;
                border-radius: 5px;
                width: 35px;
                height: 35px;
                cursor: pointer;
                font-size: 1.5em;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0;
                line-height: 1;
                transition: background-color 0.3s ease;
            }
            .ticket-count button:hover {
                background: #c73e1d;
            }
            .ticket-count input {
                width: 60px;
                text-align: center;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 1.1em;
            }
            .ticket-count input::-webkit-outer-spin-button,
            .ticket-count input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            .content {
                padding: 20px;
                min-height: calc(100vh - 200px);
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
                    <li><a href="Concert.jsp">Concert</a></li>
                    <li><a href="News.jsp">News</a></li>
                    <li><a href="About-Us.jsp">About Us</a></li>
                    <li><a href="Order.jsp" id="buy-now">Buy one now!</a></li>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="order-container">
                <div class="order-details">
                    <h2>Order Confirmation</h2>
                    
                    <%
                    // Get parameters from the request
                    String title = request.getParameter("title");
                    String date = request.getParameter("date");
                    String location = request.getParameter("location");
                    String price = request.getParameter("price");
                    String artist = request.getParameter("artist");
                    String genre = request.getParameter("genre");
                    String ticketType = request.getParameter("ticketType");
                    
                    // Calculate total price (will be updated by JavaScript)
                    double basePrice = 0;
                    try {
                        basePrice = Double.parseDouble(price != null ? price : "0");
                    } catch (NumberFormatException e) {
                        basePrice = 0;
                    }
                    int ticketCount = 1;
                    double totalPrice = basePrice * ticketCount;
                    %>

                    <div class="order-info">
                        <label>Concert:</label>
                        <div><%= title %></div>
                        
                        <label>Artist:</label>
                        <div><%= artist %></div>
                        
                        <label>Genre:</label>
                        <div><%= genre %></div>
                        
                        <label>Date:</label>
                        <div><%= date %></div>
                        
                        <label>Location:</label>
                        <div><%= location %></div>
                        
                        <label>Ticket Type:</label>
                        <div><%= ticketType != null ? ticketType : "Regular" %></div>
                        
                        <label>Price per ticket:</label>
                        <div>Rp <%= String.format("%,.0f", basePrice) %></div>
                        
                        <label>Number of tickets:</label>
                        <div class="ticket-count">
                            <button onclick="updateTicketCount(-1)">-</button>
                            <input type="number" id="ticketCount" value="1" min="1" max="2" onchange="updateTotal()">
                            <button onclick="updateTicketCount(1)">+</button>
                        </div>
                    </div>

                    <div class="total-amount">
                        Total Amount: Rp <span id="totalPrice"><%= String.format("%,.0f", totalPrice) %></span>
                    </div>

                    <div class="payment-methods">
                        <h3>Select Payment Method</h3>
                        
                        <div class="payment-method" onclick="selectPayment(this)">
                            <img src="Images/Logo/BCA.png" alt="BCA">
                            <span>Bank Central Asia (BCA)</span>
                        </div>
                        
                        <div class="payment-method" onclick="selectPayment(this)">
                            <img src="Images/Logo/Mandiri.png" alt="Mandiri">
                            <span>Bank Mandiri</span>
                        </div>
                        
                        <div class="payment-method" onclick="selectPayment(this)">
                            <img src="Images/Logo/BNI.png" alt="BNI">
                            <span>Bank Negara Indonesia (BNI)</span>
                        </div>
                        
                        <div class="payment-method" onclick="selectPayment(this)">
                            <img src="Images/Logo/GoPay.png" alt="GoPay">
                            <span>GoPay</span>
                        </div>
                        
                        <div class="payment-method" onclick="selectPayment(this)">
                            <img src="Images/Logo/QRIS.png" alt="QRIS">
                            <span>QRIS (All E-Wallets)</span>
                        </div>
                    </div>

                    <button class="confirm-button" onclick="processPayment()">Confirm and Pay</button>
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
            // Initialize variables
            let selectedPayment = null;
            const concertTitle = '<%= title %>';
            const basePrice = parseFloat('<%= basePrice %>');

            function updateTicketCount(change) {
                const input = document.getElementById('ticketCount');
                let value = parseInt(input.value) + change;
                value = Math.max(1, Math.min(10, value));
                input.value = value;
                updateTotal();
            }

            function updateTotal() {
                const ticketCount = parseInt(document.getElementById('ticketCount').value);
                const total = basePrice * ticketCount;
                document.getElementById('totalPrice').textContent = total.toLocaleString('id-ID');
            }

            function selectPayment(element) {
                // Remove selected class from all payment methods
                document.querySelectorAll('.payment-method').forEach(pm => {
                    pm.classList.remove('selected');
                });
                
                // Add selected class to clicked payment method
                element.classList.add('selected');
                selectedPayment = element.querySelector('span').textContent;
            }

            function processPayment() {
                if (!selectedPayment) {
                    alert('Please select a payment method');
                    return;
                }

                const ticketCount = document.getElementById('ticketCount').value;
                const total = basePrice * ticketCount;

                // Here you would typically make an API call to your payment processor
                // For now, we'll just show a confirmation message
                alert(`Order confirmed!\n\nConcert: ${concertTitle}\nTickets: ${ticketCount}\nTotal: Rp ${total.toLocaleString('id-ID')}\nPayment Method: ${selectedPayment}\n\nThank you for your purchase!`);
                
                // Redirect to a success page or home page
                window.location.href = 'index.jsp';
            }
        </script>
    </body>
</html> 