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
        <link rel="icon" href="Images/Logo/CoNEX.svg" type="image/svg+xml">
        <style>
            /* Add specific styles for Concert.jsp layout */
            .concert-list-container {
                max-width: 1000px;
                margin: 60px auto;
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
                flex-shrink: 0;
                flex-basis: 150px;
            }
            .concert-details {
                flex-grow: 1;
                margin-left: 10px;
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
            <div class="concert-list-container">
                <h1>Upcoming Concerts in Indonesia</h1>

                <div style="text-align: center;">
                    <label for="concertSearch">
                      Search <em>'YOASOBI Asia Tour'</em>
                    </label><br>
                    <input type="text" id="concertSearch" placeholder="Search here...">
                  </div>

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
                    <div class="concert-item">
                        <img src="<%= concert.getImageUrl() %>" alt="<%= concert.getTitle() %>">
                        <div class="concert-details">
                            <h3><%= concert.getTitle() %></h3>
                            <p><strong>Artist:</strong> <%= concert.getArtist() %></p>
                            <p class="genre"><strong>Genre:</strong> <% String[] genres = concert.getGenre().split(", "); for(String genre : genres) {%><span><%= genre %></span><%} %></p>
                            <p><strong>Date:</strong> <%= concert.getDate() %></p>
                            <p><strong>Venue:</strong> <%= concert.getLocation() %></p>
                            <p><strong>Price:</strong> Starting from Rp <%= String.format("%,.0f", concert.getPrice()) %></p>
                            <p class="description"><%= concert.getDescription() %></p>
                            <a href="ConcertDetails.jsp?title=<%= concert.getTitle() %>&artist=<%= concert.getArtist() %>&genre=<%= concert.getGenre() %>&date=<%= concert.getDate() %>&location=<%= concert.getLocation() %>&price=<%= concert.getPrice() %>&imageUrl=<%= java.net.URLEncoder.encode(concert.getImageUrl(), "UTF-8") %>&description=<%= java.net.URLEncoder.encode(concert.getDescription(), "UTF-8") %>" class="buy-button">Buy Tickets</a>
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
        <script>
            const searchInput = document.getElementById('concertSearch');
            const concertItems = document.querySelectorAll('.concert-item');

            searchInput.addEventListener('keyup', function(event) {
                const searchTerm = event.target.value.toLowerCase();

                concertItems.forEach(item => {
                    const textContent = item.textContent.toLowerCase();
                    if (textContent.includes(searchTerm)) {
                        item.style.display = 'flex'; // Show the concert item
                    } else {
                        item.style.display = 'none'; // Hide the concert item
                    }
                });
            });
        </script>
    </body>
</html>