package com.webappjsp.servlet;

import com.webappjsp.model.Concert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/result")
public class SearchResultServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search_query");
        System.out.println("Search query received: " + searchQuery); // Debug log

        List<Concert> allConcerts = getHardcodedConcerts();
        System.out.println("Total concerts available: " + allConcerts.size()); // Debug log

        List<Concert> filteredConcerts = new ArrayList<>();
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            String lowerCaseQuery = searchQuery.trim().toLowerCase();
            filteredConcerts = allConcerts.stream()
                    .filter(concert ->
                            concert.getTitle().toLowerCase().contains(lowerCaseQuery) ||
                            concert.getDate().toLowerCase().contains(lowerCaseQuery) ||
                            concert.getLocation().toLowerCase().contains(lowerCaseQuery) ||
                            concert.getArtist().toLowerCase().contains(lowerCaseQuery) ||
                            concert.getGenre().toLowerCase().contains(lowerCaseQuery)
                    )
                    .collect(Collectors.toList());
            System.out.println("Found " + filteredConcerts.size() + " matching concerts"); // Debug log
        } else {
            filteredConcerts = allConcerts;
        }

        request.setAttribute("searchResults", filteredConcerts);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private List<Concert> getHardcodedConcerts() {
        List<Concert> concerts = new ArrayList<>();
        
        // Concert 1
        concerts.add(new Concert(
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
        concerts.add(new Concert(
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
        concerts.add(new Concert(
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
        concerts.add(new Concert(
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
        concerts.add(new Concert(
            "Ed Sheeran - Mathematics Tour",
            "April 5, 2025",
            "ICE BSD City",
            "Ed Sheeran returns to Indonesia with his Mathematics Tour. Enjoy an intimate evening with acoustic performances and his greatest hits.",
            "Images/ed-sheeran-concert.jpg",
            1500000,
            "Ed Sheeran",
            "Pop"
        ));

        return concerts;
    }
} 