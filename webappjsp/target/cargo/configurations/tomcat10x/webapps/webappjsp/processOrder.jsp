<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
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
                margin-bottom: 10px;
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
                padding: 30px;
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
            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: #333;
                font-weight: 600;
                font-size: 16px;
            }
            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="tel"] {
                width: calc(100% - 16px);
                padding: 12px 8px;
                border-radius: 5px;
                border: 1px solid #ddd;
                background: rgba(255, 255, 255, 0.95);
                transition: border-color 0.3s ease, background-color 0.3s ease;
                font-size: 16px;
                color: #333;
            }
            .form-group input:focus {
                border-color: #ff4d4d;
            }
            .form-group input::placeholder {
                color: #666;
                opacity: 1;
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
            <div class="order-container">
                <form id="orderForm" method="POST">
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
                        String imageUrl = request.getParameter("imageUrl");
                        
                        // Calculate base price
                        double basePrice = 0;
                        try {
                            basePrice = Double.parseDouble(price != null ? price : "0");
                        } catch (NumberFormatException e) {
                            basePrice = 0;
                        }
                        int ticketCount = 1;
                        double totalPrice = basePrice * ticketCount;
                        
                        // Generate a simple unique ticket ID (for demonstration)
                        String ticketId = "TICKET-" + System.currentTimeMillis() + "-" + (int)(Math.random() * 10000);
                        %>

                        <input type="hidden" name="imageUrl" value="<%= imageUrl != null ? imageUrl : "" %>">
                        <input type="hidden" name="ticketId" value="<%= ticketId %>">
                        <input type="hidden" name="title" value="<%= title %>">
                        <input type="hidden" name="amount" value="<%= (long)totalPrice %>">
                        <input type="hidden" name="name" value="<%= request.getParameter("customerName") %>">
                        <input type="hidden" name="email" value="<%= request.getParameter("customerEmail") %>">
                        <input type="hidden" name="phone" value="<%= request.getParameter("customerPhone") %>">
                        <input type="hidden" name="artist" value="<%= artist %>">
                        <input type="hidden" name="genre" value="<%= genre %>">
                        

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
                            
                            <label>Price per Ticket:</label>
                            <div>Rp <span id="basePriceValue"><%= price %></span></div>
                            
                            <label>Quantity:</label>
                            <div class="ticket-count">
                                <button type="button" id="decrementBtn">-</button>
                                <input type="number" id="ticketCountInput" name="ticketCount" value="1" min="1" max="2" readonly>
                                <button type="button" id="incrementBtn">+</button>
                            </div>

                            <label>Total Amount:</label>
                            <div class="total-amount">Rp <span id="totalPriceValue"><%= (long)totalPrice %></span></div>
                        </div>

                        <div class="payment-methods">
                            <h3>Select Payment Method</h3>
                            
                            <h4>Virtual Account</h4>
                            <div class="payment-method" onclick="selectPayment(this, 'BCA')">
                                <img src="Images/Logo/BCA.png" alt="BCA">
                                <span>Bank Central Asia (BCA)</span>
                            </div>
                            
                            <div class="payment-method" onclick="selectPayment(this, 'Mandiri')">
                                <img src="Images/Logo/Mandiri.png" alt="Mandiri">
                                <span>Bank Mandiri</span>
                            </div>
                            
                            <div class="payment-method" onclick="selectPayment(this, 'BNI')">
                                <img src="Images/Logo/BNI.png" alt="BNI">
                                <span>Bank Negara Indonesia (BNI)</span>
                            </div>
                            
                            <div class="payment-method" onclick="selectPayment(this, 'BRI')">
                                <img src="Images/Logo/BRI.png" alt="BRI">
                                <span>Bank Rakyat Indonesia (BRI)</span>
                            </div>

                            <h4>E-Wallets (QRIS)</h4>
                            <div class="payment-method" onclick="selectPayment(this, 'QRIS')">
                                <img src="Images/Logo/QRIS.png" alt="QRIS">
                                <span>QRIS (All E-Wallets)</span>
                            </div>

                            <div class="payment-method" onclick="selectPayment(this, 'Gopay')">
                                <img src="Images/Logo/GoPay.png" alt="Gopay">
                                <span>Gopay</span>
                            </div>
                        </div>

                    </div>

                    <div class="user-details-form">
                        <h3 style="color: #333;">Your Information</h3>

                        <input type="hidden" name="title" value="<%= title %>">
                        <input type="hidden" name="date" value="<%= date %>">
                        <input type="hidden" name="location" value="<%= location %>">
                        <input type="hidden" name="price" value="<%= basePrice %>">
                        <input type="hidden" name="artist" value="<%= artist %>">
                        <input type="hidden" name="genre" value="<%= genre %>">
                        <input type="hidden" name="ticketType" value="<%= ticketType %>">
                        <input type="hidden" name="ticketCount" id="hiddenTicketCount" value="<%= ticketCount %>">
                        <input type="hidden" name="totalAmount" id="hiddenTotalAmount" value="<%= (long) totalPrice %>">

                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input type="text" id="name" placeholder="Username/name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" placeholder="Email@example.com" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number:</label>
                            <input type="tel" id="phone" placeholder="0123456789" name="phone" required>
                        </div>

                        <input type="hidden" name="paymentMethod" id="selectedPaymentMethod">

                        <button type="submit" class="confirm-button">Proceed to Payment</button>
                    </div>
                </form>
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
            // Initialize variables
            let selectedPayment = null;
            const orderForm = document.getElementById('orderForm');
            const ticketCountInput = document.getElementById('ticketCountInput');
            const hiddenTicketCountInput = document.getElementById('hiddenTicketCount');
            const totalPriceSpan = document.getElementById('totalPriceValue');
            const selectedPaymentMethodInput = document.getElementById('selectedPaymentMethod');
            const hiddenAmountInput = document.getElementById('hiddenTotalAmount');
            const basePriceSpan = document.getElementById('basePriceValue');
            const decrementBtn = document.getElementById('decrementBtn');
            const incrementBtn = document.getElementById('incrementBtn');

            // Set initial hidden ticket count value
            hiddenTicketCountInput.value = ticketCountInput.value;

            function updateTicketCount(change) {
                let value = parseInt(ticketCountInput.value) + change;
                // Enforce min (1) and max (2)
                value = Math.max(1, Math.min(2, value));
                ticketCountInput.value = value;
                hiddenTicketCountInput.value = value; // Update hidden input
                updateTotal();
            }

            function updateTotal() {
                const ticketCount = parseInt(ticketCountInput.value);
                const basePrice = parseFloat(basePriceSpan.textContent);
                const total = basePrice * ticketCount;
                totalPriceSpan.textContent = total.toLocaleString('id-ID');
                hiddenAmountInput.value = total; // Update hidden amount input
            }

            function selectPayment(element, method) {
                // Remove selected class from all payment methods
                document.querySelectorAll('.payment-method').forEach(el => {
                    el.classList.remove('selected');
                });
                
                // Add selected class to clicked element
                element.classList.add('selected');
                
                // Set the selected payment method in the hidden input
                selectedPaymentMethodInput.value = method;

                // Dynamically set the form action based on the selected method
                if (method === 'QRIS' || method === 'Gopay') { // Assuming Gopay also uses QR code flow
                    orderForm.action = 'create-qrcode'; // Should point to CreateQrCodeServlet
                } else { // Bank VA methods
                    orderForm.action = 'xendit-payment'; // Should point to XenditPaymentServlet
                }
            }

            // Ensure hidden ticket count is updated when input field changes manually
            ticketCountInput.addEventListener('change', function() {
                let value = parseInt(this.value);
                 // Enforce min (1) and max (2) on manual input
                value = Math.max(1, Math.min(2, value));
                this.value = value;
                hiddenTicketCountInput.value = value;
                updateTotal();
            });

             // Prevent manual input exceeding max="2"
             ticketCountInput.addEventListener('input', function() {
                let value = parseInt(this.value);
                if (value > 2) {
                    this.value = 2;
                    hiddenTicketCountInput.value = 2;
                    updateTotal();
                }
            });

            // Add event listener to the form submission
            orderForm.addEventListener('submit', function(event) {
                // Get customer details from input fields
                const customerName = document.getElementById('name').value;
                const customerEmail = document.getElementById('email').value;
                const customerPhone = document.getElementById('phone').value;

                // Update hidden input fields with customer details
                document.querySelector('input[name="name"]').value = customerName;
                document.querySelector('input[name="email"]').value = customerEmail;
                document.querySelector('input[name="phone"]').value = customerPhone;

                // Ensure other hidden fields are up-to-date (though updateTotal should handle amount/ticketCount)
                updateTotal(); // Just to be safe

                // The form will now submit with all necessary hidden fields populated
            });

            const basePrice = parseFloat(basePriceSpan.textContent);

            function updateTotalPrice() {
                const ticketCount = parseInt(ticketCountInput.value);
                const totalPrice = basePrice * ticketCount;
                totalPriceSpan.textContent = totalPrice.toFixed(0); // Format as integer without decimal
                hiddenAmountInput.value = totalPrice; // Update the hidden input value
            }

            decrementBtn.addEventListener('click', () => {
                let count = parseInt(ticketCountInput.value);
                if (count > 1) {
                    ticketCountInput.value = count - 1;
                    updateTotalPrice();
                }
            });

            incrementBtn.addEventListener('click', () => {
                let count = parseInt(ticketCountInput.value);
                updateTicketCount(1);
            });

            // Initial calculation on page load
            updateTotalPrice();

        </script>
    </body>
</html> 