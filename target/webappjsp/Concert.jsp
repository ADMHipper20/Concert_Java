<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.webappjsp.model.Concert" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Upcoming Concerts | SIZZLING CONCERT</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            /* Add specific styles for Concert.jsp layout */
            .concert-list-container {
                max-width: 1000px;
                margin: 20px auto;
                padding: 20px;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .concert-item {
                display: flex;
                align-items: center;
                border-bottom: 1px solid #eee;
                padding: 20px 0;
                margin-bottom: 20px;
            }
            .concert-item:last-child {
                border-bottom: none;
                margin-bottom: 0;
            }
            .concert-item img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
                margin-right: 20px;
            }
            .concert-details {
                flex-grow: 1;
            }
            .concert-details h3 {
                margin-top: 0;
                color: #333;
                font-size: 1.5em;
            }
            .concert-details p {
                margin: 5px 0;
                color: #555;
            }
            .concert-details .genre span {
                display: inline-block;
                background: #e44d26;
                color: white;
                padding: 3px 10px;
                border-radius: 12px;
                margin-right: 5px;
                font-size: 0.9em;
            }
             .buy-button {
                display: inline-block;
                background: #e44d26;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                transition: background 0.3s ease;
                margin-top: 10px;
            }
            .buy-button:hover {
                background: #c73e1d;
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
            <div class="concert-list-container">
                <h1>Upcoming Concerts in Indonesia</h1>

                <% // Hardcoded list of concerts (can be replaced with dynamic data later) %>
                <%
                    List<Concert> upcomingConcerts = new ArrayList<>();
                    upcomingConcerts.add(new Concert(
                        "YOASOBI World Tour 2024",
                        "June 15, 2024",
                        "ICE BSD, Tangerang",
                        "Experience the electrifying performance of YOASOBI on their World Tour.",
                        "Images/Concerts/yoasobi.jpg",
                        1500000,
                        "YOASOBI",
                        "J-Pop, Electronic"
                    ));
                    upcomingConcerts.add(new Concert(
                        "ONE OK ROCK Luxury Disease Tour",
                        "July 20, 2024",
                        "JIExpo Kemayoran, Jakarta",
                        "Experience ONE OK ROCK live on their Luxury Disease Tour.",
                        "Images/Concerts/oneokrock.jpg",
                        1800000,
                        "ONE OK ROCK",
                        "Rock, Alternative"
                    ));
                     upcomingConcerts.add(new Concert(
                        "RADWIMPS Asia Tour 2024",
                        "August 5, 2024",
                        "ICE BSD, Tangerang",
                        "Catch RADWIMPS on their exciting Asia Tour.",
                        "Images/Concerts/radwimps.jpg",
                        1600000,
                        "RADWIMPS",
                        "Rock, J-Rock"
                    ));
                    upcomingConcerts.add(new Concert(
                        "Ed Sheeran Mathematics Tour",
                        "September 10, 2024",
                        "Gelora Bung Karno, Jakarta",
                        "An intimate evening with Ed Sheeran on his Mathematics Tour.",
                        "Images/Concerts/ed-sheeran.jpg",
                        2000000,
                        "Ed Sheeran",
                        "Pop, Folk"
                    ));
                    upcomingConcerts.add(new Concert(
                        "Coldplay Music of the Spheres Tour",
                        "October 15, 2024",
                        "Gelora Bung Karno, Jakarta",
                        "Join Coldplay for a spectacular evening of live music.",
                        "Images/Concerts/coldplay.jpg",
                        2500000,
                        "Coldplay",
                        "Rock, Alternative"
                    ));
                     upcomingConcerts.add(new Concert(
                        "BLACKPINK Born Pink World Tour",
                        "November 20, 2024",
                        "ICE BSD, Tangerang",
                        "Don't miss Blackpink's Born Pink World Tour!",
                        "Images/Concerts/blackpink.jpg",
                        2200000,
                        "BLACKPINK",
                        "K-Pop, Pop"
                    ));
                     upcomingConcerts.add(new Concert(
                        "Liam Gallagher Definitely Maybe Tour",
                        "December 5, 2024",
                        "JIExpo Kemayoran, Jakarta",
                        "Liam Gallagher performs the iconic album 'Definitely Maybe'.",
                        "Images/Concerts/liam-gallagher.jpg",
                        1800000,
                        "Liam Gallagher",
                        "Rock, Britpop"
                    ));
                      upcomingConcerts.add(new Concert(
                        "Arctic Monkeys The Car Tour",
                        "January 15, 2025",
                        "ICE BSD, Tangerang",
                        "Arctic Monkeys on their latest tour, 'The Car'.",
                        "Images/Concerts/arctic-monkeys.jpg",
                        1900000,
                        "Arctic Monkeys",
                        "Rock, Indie"
                    ));
                %>

                <% for (Concert concert : upcomingConcerts) { %>
                    <div class="concert-item">
                        <img src="<%= concert.getImageUrl() %>" alt="<%= concert.getTitle() %>">
                        <div class="concert-details">
                            <h3><%= concert.getTitle() %></h3>
                            <p><strong>Artist:</strong> <%= concert.getArtist() %></p>
                            <p class="genre"><strong>Genre:</strong> <% String[] genres = concert.getGenre().split(", "); for(String genre : genres) {%><span><%= genre %></span><%} %></p>
                            <p><strong>Date:</strong> <%= concert.getDate() %></p>
                            <p><strong>Venue:</strong> <%= concert.getLocation() %></p>
                            <p><strong>Price:</strong> Starting from Rp <%= String.format("%,.0f", concert.getPrice()) %></p>
                            <a href="Order.jsp?title=<%= concert.getTitle() %>&artist=<%= concert.getArtist() %>&genre=<%= concert.getGenre() %>&date=<%= concert.getDate() %>&location=<%= concert.getLocation() %>&price=<%= concert.getPrice() %>" class="buy-button">Buy Tickets</a>
                        </div>
                    </div>
                <% } %>

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