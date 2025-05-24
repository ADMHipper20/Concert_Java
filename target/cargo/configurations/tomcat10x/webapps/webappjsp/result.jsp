<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.webappjsp.model.Concert" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="css/style.css">
        <title>Search Results | SIZZLING CONCERT</title>
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
                <form action="result.jsp" method="GET" class="search-form">
                    <div class="search-bar">
                        <input type="text" name="search_query" autocomplete="off" autocorrect="off" placeholder="Search ur favorite concert!" value="<%= request.getParameter("search_query") != null ? request.getParameter("search_query") : "" %>">
                        <button type="submit" class="search-button" aria-label="Search">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" height="24" viewBox="0 0 24 24" width="24" focusable="false" aria-hidden="true">
                                <path clip-rule="evenodd" d="M16.296 16.996a8 8 0 11.707-.708l3.909 3.91-.707.707-3.909-3.909zM18 11a7 7 0 00-14 0 7 7 0 1014 0z" fill-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            <div class="flex-content">
                <h1 class="event-title" style="font-family: 'Segoe UI', Geneva, Verdana, sans-serif;">Search Results</h1>

                <% 
                String searchQuery = request.getParameter("search_query");
                if (searchQuery != null && !searchQuery.trim().isEmpty()) { 
                %>
                    <p class="search-info" style="text-align: center; color: #fff; margin-bottom: 20px; font-size: 1.2em;">
                        Showing results for: "<%= searchQuery %>"
                    </p>
                <% } %>

                <%
                // Get all concerts
                List<Concert> allConcerts = new ArrayList<>();
                
                // Concert 1
                allConcerts.add(new Concert(
                    "Taylor Swift - The Eras Tour",
                    "December 31, 2025",
                    "Gelora Bung Karno Stadium",
                    "Experience the biggest concert of the year with Taylor Swift's The Eras Tour. Get ready for an unforgettable night of music spanning her entire career.",
                    "Images/ZZZ-Background-Belle-Wise.jpg",
                    2500000,
                    "Taylor Swift",
                    "Pop"
                ));

                // Concert 2
                allConcerts.add(new Concert(
                    "Coldplay - Music of the Spheres World Tour",
                    "January 15, 2026",
                    "ICE BSD City",
                    "Join Coldplay for a spectacular evening of live music featuring their greatest hits and songs from their latest album. Special effects and amazing stage production guaranteed.",
                    "Images/Second_Closed_Beta_Wallpaper.jpg",
                    1800000,
                    "Coldplay",
                    "Alternative Rock"
                ));

                // Concert 3
                allConcerts.add(new Concert(
                    "JKT48 - 10th Anniversary Concert",
                    "February 1, 2025",
                    "ICE BSD City",
                    "Celebrate JKT48's 10th anniversary with this exclusive concert featuring all current members and special performances. Limited tickets available!",
                    "Images/jkt48-konser.jpg",
                    1000000,
                    "JKT48",
                    "J-Pop"
                ));

                // Concert 4
                allConcerts.add(new Concert(
                    "Blackpink - Born Pink World Tour",
                    "March 20, 2025",
                    "Gelora Bung Karno Stadium",
                    "Don't miss Blackpink's Born Pink World Tour! Experience the ultimate K-pop concert with amazing performances and special effects.",
                    "Images/blackpink-concert.jpg",
                    2200000,
                    "Blackpink",
                    "K-Pop"
                ));

                // Concert 5
                allConcerts.add(new Concert(
                    "Ed Sheeran - Mathematics Tour",
                    "April 5, 2025",
                    "ICE BSD City",
                    "Ed Sheeran returns to Indonesia with his Mathematics Tour. Enjoy an intimate evening with acoustic performances and his greatest hits.",
                    "Images/ed-sheeran-concert.jpg",
                    1500000,
                    "Ed Sheeran",
                    "Pop"
                ));

                // Filter concerts based on search query
                List<Concert> searchResults = allConcerts;
                if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                    String lowerCaseQuery = searchQuery.trim().toLowerCase();
                    searchResults = allConcerts.stream()
                            .filter(concert ->
                                    concert.getTitle().toLowerCase().contains(lowerCaseQuery) ||
                                    concert.getDate().toLowerCase().contains(lowerCaseQuery) ||
                                    concert.getLocation().toLowerCase().contains(lowerCaseQuery) ||
                                    concert.getArtist().toLowerCase().contains(lowerCaseQuery) ||
                                    concert.getGenre().toLowerCase().contains(lowerCaseQuery)
                            )
                            .collect(Collectors.toList());
                }
                %>

                <% if (!searchResults.isEmpty()) { %>
                    <div class="search-results-list" style="display: flex; flex-direction: column; gap: 20px;">
                        <% for (Concert concert : searchResults) { %>
                            <div class="concert-card" style="background: rgba(255, 255, 255, 0.9); border-radius: 10px; overflow: hidden; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
                                <img src="<%= concert.getImageUrl() %>" alt="<%= concert.getTitle() %>" style="width: 100%; height: 300px; object-fit: cover;">
                                <div class="concert-info" style="padding: 20px;">
                                    <div class="concert-details">
                                        <h3 style="color: #333; margin-bottom: 15px; font-size: 1.5em;"><%= concert.getTitle() %></h3>
                                        <p class="artist" style="color: #666; margin: 5px 0;"><strong>Artist:</strong> <%= concert.getArtist() %></p>
                                        <p class="genre" style="color: #666; margin: 5px 0;"><strong>Genre:</strong> <%= concert.getGenre() %></p>
                                        <p class="date" style="color: #666; margin: 5px 0;"><strong>Date:</strong> <%= concert.getDate() %></p>
                                        <p class="location" style="color: #666; margin: 5px 0;"><strong>Location:</strong> <%= concert.getLocation() %></p>
                                        <p class="price" style="color: #e44d26; margin: 10px 0; font-size: 1.2em;"><strong>Price:</strong> Rp <%= String.format("%,.0f", concert.getPrice()) %></p>
                                        <p class="description" style="color: #444; margin: 15px 0; line-height: 1.5;"><%= concert.getDescription() %></p>
                                    </div>
                                    <a href="ConcertDetails.jsp?title=<%= concert.getTitle() %>&date=<%= concert.getDate() %>&location=<%= concert.getLocation() %>&description=<%= concert.getDescription() %>&price=<%= concert.getPrice() %>&artist=<%= concert.getArtist() %>&genre=<%= concert.getGenre() %>" 
                                       class="buy-now-button" 
                                       style="display: inline-block; background: #e44d26; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; transition: background 0.3s;">
                                        View Details
                                    </a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                <% } else { %>
                    <div class="no-results" style="text-align: center; color: #fff; padding: 40px; background: rgba(0,0,0,0.5); border-radius: 10px; margin: 20px 0;">
                        <h2 style="margin-bottom: 15px;">No concerts found</h2>
                        <p>Try searching with different keywords or browse our concert listings.</p>
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