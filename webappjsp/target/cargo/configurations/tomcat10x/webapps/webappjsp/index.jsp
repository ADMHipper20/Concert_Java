<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.webappjsp.model.Concert" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <!-- <link rel="icon" href="boots" -->
        <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
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
            <div class="search-container">
                <form action="result.jsp" method="GET" class="search-form">
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
                <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">UPCOMING CONCERTS</h1>

                <% // Hardcoded list of concerts (can be replaced with dynamic data later) %>
                <%
                    List<Concert> upcomingConcerts = new ArrayList<>();
                    upcomingConcerts.add(new Concert(
                        "YOASOBI World Tour 2025",
                        "June 15, 2025",
                        "ICE BSD, Tangerang",
                        "Experience the electrifying performance of YOASOBI on their World Tour.",
                        "Images/Concerts/YOASOBI-ASIATOUR-2024~2025.jpeg",
                        20000,
                        "YOASOBI",
                        "J-Pop, Electronic"
                    ));
                    upcomingConcerts.add(new Concert(
                        "ONE OK ROCK Luxury Disease Tour",
                        "July 20, 2025",
                        "Jl. Expo Kemayoran, Jakarta",
                        "Experience ONE OK ROCK live on their Luxury Disease Tour.",
                        "Images/Concerts/ONEOKROCK_LuxuryDisease_ASIAtour_2025.jpg",
                        1800000,
                        "ONE OK ROCK",
                        "Rock, Alternative"
                    ));
                     upcomingConcerts.add(new Concert(
                        "RADWIMPS Asia Tour 2025",
                        "August 5, 2025",
                        "ICE BSD, Tangerang",
                        "Catch RADWIMPS on their exciting Asia Tour.",
                        "Images/Concerts/RADWIMPS_Jakarta_2024.jpg",
                        1600000,
                        "RADWIMPS",
                        "Rock, J-Rock"
                    ));
                    upcomingConcerts.add(new Concert(
                        "Ed Sheeran Mathematics Tour",
                        "September 10, 2025",
                        "Gelora Bung Karno, Jakarta",
                        "An intimate evening with Ed Sheeran on his Mathematics Tour.",
                        "Images/Concerts/ED_Sheeran_Tour2024.jpg",
                        2000000,
                        "Ed Sheeran",
                        "Pop, Folk"
                    ));
                    upcomingConcerts.add(new Concert(
                        "Coldplay Music of the Spheres Tour",
                        "October 15, 2025",
                        "Gelora Bung Karno, Jakarta",
                        "Join Coldplay for a spectacular evening of live music.",
                        "Images/Concerts/COLDPLAY_WorldTour.png",
                        2500000,
                        "Coldplay",
                        "Rock, Alternative"
                    ));
                     upcomingConcerts.add(new Concert(
                        "BLACKPINK Born Pink World Tour",
                        "November 20, 2025",
                        "ICE BSD, Tangerang",
                        "Don't miss Blackpink's Born Pink World Tour!",
                        "Images/Concerts/blackpink_BORNPINK_2024.jpg",
                        2200000,
                        "BLACKPINK",
                        "K-Pop, Pop"
                    ));
                     upcomingConcerts.add(new Concert(
                        "Liam Gallagher Definitely Maybe Tour",
                        "December 5, 2025",
                        "Jl. Expo Kemayoran, Jakarta",
                        "Liam Gallagher performs the iconic album 'Definitely Maybe'.",
                        "Images/Concerts/Liam-Gallagher_oasis2024.jpg",
                        1800000,
                        "Liam Gallagher",
                        "Rock, Britpop"
                    ));
                      upcomingConcerts.add(new Concert(
                        "Arctic Monkeys The Car Tour",
                        "January 15, 2026",
                        "ICE BSD, Tangerang",
                        "Arctic Monkeys on their latest tour, 'The Car'.",
                        "Images/Concerts/ARTIC-Monkeys_AsiaTour_2023.jpg",
                        1900000,
                        "Arctic Monkeys",
                        "Rock, Indie"
                    ));
                %>

                <% for (Concert concert : upcomingConcerts) { %>
                    <div class="concert-card">
                        <img src="<%= concert.getImageUrl() %>" alt="<%= concert.getTitle() %>">
                        <div class="concert-info">
                            <div class="concert-details">
                                <h3><%= concert.getTitle() %></h3>
                                <p>Artist: <%= concert.getArtist() %></p>
                                <p>Genre: <%= concert.getGenre() %></p>
                                <p>Date: <%= concert.getDate() %></p>
                                <p>Location: <%= concert.getLocation() %></p>
                                <p class="description"><%= concert.getDescription() %></p>
                            </div>
                            <a href="ConcertDetails.jsp?title=<%= concert.getTitle() %>&artist=<%= concert.getArtist() %>&genre=<%= concert.getGenre() %>&date=<%= concert.getDate() %>&location=<%= concert.getLocation() %>&price=<%= concert.getPrice() %>&imageUrl=<%= java.net.URLEncoder.encode(concert.getImageUrl(), "UTF-8") %>&description=<%= java.net.URLEncoder.encode(concert.getDescription(), "UTF-8") %>" class="buy-now-button">View Details</a>
                        </div>
                    </div>
                <% } %>

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
    <script type="text/javascript" src="js/response.js"></script>
    </body>
</html>