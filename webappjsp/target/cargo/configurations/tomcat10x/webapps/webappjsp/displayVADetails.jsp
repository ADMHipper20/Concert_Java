<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Virtual Account Payment - SIZZLING CONCERT</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Fallback background color */
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            text-align: center;
        }
         .bg.fill {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }
        #video-bg {
            position: absolute;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            transform: translate(-50%, -50%);
            background-size: cover;
        }

        /* Added padding-top to content to account for fixed header */
        .content {
             padding-top: 100px; /* Adjust based on header height */
             flex: 1; /* Allow content to grow */
             display: flex;
             justify-content: center;
             align-items: center; /* Center content vertically within its area */
        }

        .payment-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 30px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px; /* Adjusted max-width */
        }
        .payment-container h1 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #ff4d4d; /* Accent color line */
            padding-bottom: 10px;
        }
        .payment-details {
            margin: 20px 0;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 10px;
            text-align: left;
        }
        .payment-details p {
            margin: 10px 0;
            font-size: 1.1em;
            color: #555;
        }
        .payment-details strong {
            color: #e44d26;
        }
        .instructions {
            text-align: left;
            margin: 20px 0;
            padding: 20px;
            background: #f9f9f9; /* Light background for instructions */
            border-radius: 10px;
            border: 1px solid #eee; /* Subtle border */
        }
        .instructions h3 {
             margin-top: 0;
             color: #555;
        }
        .instructions ol {
            margin-left: 20px;
            padding-left: 0;
        }
        .instructions li {
            margin-bottom: 8px;
            color: #666;
        }
        .timer {
            color: #e44d26; /* Accent color for timer */
            font-weight: bold;
            margin: 20px 0;
            font-size: 1.1em;
        }
         /* Basic footer styling to match other pages */
        .footer {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            color: #fff; /* White text */
            padding: 20px 0;
            text-align: center;
            margin-top: auto; /* Push footer to the bottom */
        }
        .footer ul {
            list-style: none;
            padding: 0;
            margin: 0 0 20px 0;
        }
        .footer ul li {
            display: inline-block;
            margin: 0 15px;
        }
        .footer ul li a {
            text-decoration: none;
            color: #fff;
            transition: color 0.3s ease;
        }
        .footer ul li a:hover {
            color: #e44d26;
        }
        .footer-copyright {
            font-size: 0.9em;
            color: #ccc; /* Light grey for copyright text */
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
        <div class="payment-container">
            <h1>Complete Your Payment</h1>
            <p>Event: ${title}</p>

            <div class="payment-details">
                <h3>Virtual Account Details</h3>
                <p><strong>Bank:</strong> ${bankCode}</p>
                <p><strong>Virtual Account Number:</strong> ${vaNumber}</p>
                <p><strong>Amount:</strong> Rp ${amount}</p>
                <%-- Add expiry date if available --%>
                <%-- <p><strong>Expiry Date:</strong> ${expiryDate}</p> --%>
            </div>

            <div class="instructions">
                <h3>How to Pay:</h3>
                <p>Please make a transfer to the Virtual Account details provided above.</p>
                <ol>
                    <li>Log in to your banking portal or mobile app.</li>
                    <li>Select the transfer or payment option.</li>
                    <li>Choose transfer to Virtual Account.</li>
                    <li>Enter the Virtual Account number and the exact amount.</li>
                    <li>Follow the prompts to complete the payment.</li>
                </ol>
            </div>

            <div class="timer">
                <p>Please complete the payment within the specified time.</p>
                <%-- You might want to add a countdown timer here with JavaScript --%>
            </div>

            <p>After successful payment, you will receive a confirmation email with your ticket details.</p>
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

    <script>
        // Get the ticketId from the request attribute
        var ticketId = '<%= request.getAttribute("ticketId") %>';
        var contextPath = '<%= request.getContextPath() %>';

        console.log('Ticket ID:', ticketId);
        console.log('Context Path:', contextPath);

        // Function to check payment status
        function checkPaymentStatus() {
            console.log('Checking payment status for ticket:', ticketId);
            fetch(contextPath + '/check-payment-status?ticketId=' + ticketId)
                .then(response => {
                    console.log('Received response from check-payment-status:', response);
                    return response.json();
                })
                .then(data => {
                    console.log('Payment status data:', data);
                    // Assuming both VA and QRIS payment status in DB is updated to 'PAID' on success
                    if (data.status === 'success' && data.paymentStatus === 'PAID') {
                        // Payment is completed, redirect to success page
                        console.log('Payment is PAID, redirecting...');
                        clearInterval(pollingInterval);
                        // Pass order details as parameters to the success page
                        window.location.href = contextPath + '/paymentComplete.jsp?ticketId=' + ticketId;
                    } else if (data.status === 'success' && data.paymentStatus === 'EXPIRED') {
                        // Payment expired, handle accordingly (e.g., show a message)
                        clearInterval(pollingInterval);
                        console.log('Payment for ticket ' + ticketId + ' expired.');
                        // You might want to redirect to an error/expired page
                    }
                    // Optionally handle other statuses or errors
                })
                .catch(error => {
                    console.error('Error checking payment status:', error);
                    // Handle errors during polling
                });
        }

        // Poll for payment status every 10 seconds (adjust as needed)
        console.log('Starting payment status polling...');
        var pollingInterval = setInterval(checkPaymentStatus, 10000);

        // Clear the interval if the user leaves the page
        window.addEventListener('beforeunload', function() {
            clearInterval(pollingInterval);
        });

    </script>

</body>
</html> 