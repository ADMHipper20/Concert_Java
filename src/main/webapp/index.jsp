<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <!-- <link rel="icon" href="boots" -->
        <link rel="icon" type ="image/x-icon" href="#">
        <title>SIZZLING CONCERT | Tiket Festival & Konser Favoritmu di Sini!</title>
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
            <div class="search-container">
                <form action="/result" method="GET" class="search-form">
                    <div class="search-bar">
                        <input type="text" name="search_query" autocomplete="off" autocorrect="off" placeholder="Search ur favorite concert!">
                        <button type="submit" class="search-button" aria-label="Search">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" height="24" viewBox="0 0 24 24" width="24" focusable="false" aria-hidden="true">
                                <path clip-rule="evenodd" d="M16.296 16.996a8 8 0 11.707-.708l3.909 3.91-.707.707-3.909-3.909zM18 11a7 7 0 00-14 0 7 7 0 1014 0z" fill-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            <div class="flex-content">
                <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">GO CHOOSE UR CONCERT AND BUY IT!</h1>
                <div class="concert-card">
                    <img src="Images/concert1.jpg" alt="Concert 1">
                    <div class="concert-info">
                        <h3>Concert Title 1</h3>
                        <p>Date: December 31, 2025</p>
                        <p>Location: Grand Arena</p>
                        <a href="ConcertDetails.jsp?title=Concert Title 1&date=December 31, 2025&location=Grand Arena&description=Experience an unforgettable night of music with our star-studded lineup. This concert features special guest appearances and exclusive performances.&price=750000" class="buy-now-button">View Details</a>
                    </div>
                </div>
                <div class="concert-card">
                    <img src="Images/concert2.jpg" alt="Concert 2">
                    <div class="concert-info">
                        <h3>Concert Title 2</h3>
                        <p>Date: January 15, 2026</p>
                        <p>Location: City Stadium</p>
                        <a href="ConcertDetails.jsp?title=Concert Title 2&date=January 15, 2026&location=City Stadium&description=Join us for a spectacular evening of live music featuring top artists from around the world. Special effects and amazing stage production guaranteed.&price=850000" class="buy-now-button">View Details</a>
                    </div>
                </div>
                <a href="ConcertDetails.jsp">
                    <li class="main-event-3" id="main-event-3">
                        <div class="card-content">
                            <h3>Concert Title 3</h3>
                            <p class="date">February 1, 2025</p>
                            <p class="location">Gelora Bung Karno</p>
                            <p class="description">${ConcertHelper.truncateWords("Don't miss this exclusive concert featuring the hottest artists of the year. Limited tickets available!", 11) }</p>
                            <a href="Order.jsp" class="price-tag">Starting from Rp 1.000.000</a>
                        </div>
                    </li>
                </a>
            </div>
            <div class="aboutKoi">
                <div class="about-content">
                    <p style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 28px; color: black; text-align: justify; font-weight: 600;">
                        
                    </p>
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