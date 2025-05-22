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
                        <!-- Concert Image -->
                        <img src="../Images/sample-concert-image.jpg" alt="Concert Image">
                        <h2>Concert Title</h2>
                        <p>Date: December 31, 2025</p>
                        <p>Location: Grand Arena</p>
                        <p>Description: This is a placeholder for the concert description. It will provide details about the artists, event schedule, and any other relevant information.</p>
                    </div>

                    <div class="ticket-options">
                        <h3>Available Tickets</h3>
                        <div class="ticket-item">
                            <div class="ticket-info">
                                <h4>VIP Pass</h4>
                                <p>Price: Rp 1.500.000</p>
                            </div>
                            <div class="quantity-control">
                                <button>-</button>
                                <input type="text" value="0">
                                <button>+</button>
                            </div>
                        </div>
                        <div class="ticket-item">
                            <div class="ticket-info">
                                <h4>Regular Pass</h4>
                                <p>Price: Rp 750.000</p>
                            </div>
                            <div class="quantity-control">
                                <button>-</button>
                                <input type="text" value="0">
                                <button>+</button>
                            </div>
                        </div>
                        <!-- Add more ticket types here -->
                    </div>

                    <div class="order-summary">
                        <h3>Order Summary</h3>
                        <p>Total: Rp 0</p>
                        <!-- This will be updated with selected ticket prices -->
                    </div>

                    <a href="#" class="buy-now-button">Proceed to Checkout</a>

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