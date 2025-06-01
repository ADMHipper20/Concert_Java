<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Validate Ticket - SIZZLING CONCERT</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
    <script src="https://unpkg.com/html5-qrcode"></script>
    <style>
        .scanner-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        #reader {
            width: 100%;
            margin: 20px 0;
        }
        #result {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .valid {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .invalid {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
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
        <div class="scanner-container">
            <h1>Validate Ticket</h1>
            <p>Scan the QR code on the ticket to validate it.</p>
            
            <div id="reader"></div>
            <div id="result"></div>
        </div>
    </div>

    <script>
        function onScanSuccess(decodedText, decodedResult) {
            // Stop scanning
            html5QrcodeScanner.stop();
            
            // Send the ticket ID to the server for validation
            fetch('validate-ticket', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'ticketId=' + encodeURIComponent(decodedText)
            })
            .then(response => response.json())
            .then(data => {
                const resultDiv = document.getElementById('result');
                if (data.status === 'valid') {
                    resultDiv.className = 'valid';
                    resultDiv.innerHTML = '✓ Valid Ticket<br>Ticket ID: ' + decodedText;
                } else {
                    resultDiv.className = 'invalid';
                    resultDiv.innerHTML = '✗ Invalid Ticket<br>Ticket ID: ' + decodedText;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('result').innerHTML = 'Error validating ticket';
            });
        }

        function onScanFailure(error) {
            // Handle scan failure, usually ignore
            console.warn(`QR code scanning failed: ${error}`);
        }

        let html5QrcodeScanner = new Html5QrcodeScanner(
            "reader",
            { fps: 10, qrbox: {width: 250, height: 250} },
            false
        );
        html5QrcodeScanner.render(onScanSuccess, onScanFailure);
    </script>
</body>
</html> 