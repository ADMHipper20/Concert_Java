<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-us">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
    <title>Email Sent | SIZZLING CONCERT</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Fallback background color */
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column; /* Changed to column to stack header, content, footer */
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
        .success-container {
            max-width: 600px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95); /* Slightly transparent white */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow */
            margin: auto; /* Center the container */
        }
        .success-container h1 {
            color: #28a745; /* Green color for success */
            margin-bottom: 20px;
        }
        .success-container p {
            color: #555;
            font-size: 1.1em;
            margin-bottom: 20px;
        }
        .return-home {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .return-home:hover {
            background-color: #0056b3;
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

    <!-- Include the standard header -->
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
        <div class="success-container">
            <h1>Email Sent Successfully!</h1>
            <p>Your ticket details and QR code have been sent to your email address.</p>
            <p>Please check your inbox (and spam folder) for the email.</p>
            <p><a href="index.jsp" class="return-home">Return to Home</a></p>
        </div>
    </div>

    <!-- Include the standard footer with updated copyright -->
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