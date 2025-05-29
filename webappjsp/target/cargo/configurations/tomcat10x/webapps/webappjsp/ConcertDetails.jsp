<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Concert Details</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
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
        <div class="flex-content">
            <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">Concert Details</h1>
            
            <div class="concert-details-container" style="color: white; text-align: left; max-width: 800px; margin: 20px auto; background: rgba(0, 0, 0, 0.7); padding: 20px; border-radius: 10px;">
                <% String imageUrl = request.getParameter("imageUrl"); %>
                <div style="display: flex; gap: 20px; align-items: start;">
                    <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
                         <img src="<%= imageUrl %>" alt="${param.title}" style="width: 300px; height: 300px; object-fit: cover; border-radius: 8px;">
                    <% } %>
                    <div>
                        <h2>${param.title}</h2>
                        <p><strong>Artist:</strong> ${param.artist}</p>
                        <p><strong>Genre:</strong> ${param.genre}</p>
                        <p><strong>Date:</strong> ${param.date}</p>
                        <p><strong>Location:</strong> ${param.location}</p>
                        <p><strong>Description:</strong> ${param.description}</p>
                        <p><strong>Starting Price:</strong> Rp ${param.price}</p>
                        
                        <!-- Form to pass data to Order.jsp -->
                        <form action="Order.jsp" method="GET" style="text-align: center; margin-top: 20px;">
                            <input type="hidden" name="title" value="${param.title}">
                            <input type="hidden" name="date" value="${param.date}">
                            <input type="hidden" name="location" value="${param.location}">
                            <input type="hidden" name="description" value="${param.description}">
                            <input type="hidden" name="price" value="${param.price}">
                            <input type="hidden" name="imageUrl" value="<%= imageUrl != null ? imageUrl : "" %>">
                            <input type="hidden" name="artist" value="${param.artist}">
                            <input type="hidden" name="genre" value="${param.genre}">
                            <button type="submit" class="buy-now-button" style="padding: 10px 20px; background-color: #ff4d4d; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;">
                                Order Tickets
                            </button>
                        </form>
                    </div>
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
            <p>&copy; 2025 SZLConcert Org. All rights reserved.</p>
        </div>
    </div>
    <script type="text/javascript" src="js/response.js"></script>
</body>
</html> 