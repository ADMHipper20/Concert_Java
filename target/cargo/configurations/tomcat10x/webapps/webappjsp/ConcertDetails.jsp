<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Concert Details</title>
    <link rel="stylesheet" href="css/style.css">
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
                <li><a href="Order.jsp" id="buy-now">Buy one now!</a></li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="flex-content">
            <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">Concert Details</h1>
            
            <!-- Placeholder for Concert Details -->
            <div class="concert-details-container" style="color: white; text-align: left; max-width: 800px; margin: 20px auto;">
                <h2>[Concert Title]</h2>
                <p><strong>Date:</strong> [Concert Date]</p>
                <p><strong>Location:</strong> [Concert Location]</p>
                <p><strong>Description:</strong> [Full Concert Description]</p>
                
                <!-- Link to Order Page -->
                <div style="text-align: center; margin-top: 20px;">
                     <a href="Order.jsp" class="buy-now-button">Order Tickets</a>
                </div>
               
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
    <script type="text/javascript" src="js/response.js"></script>
</body>
</html> 