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
            "Embark on a spectacular journey through Taylor Swift's musical evolution! The Eras Tour is a vibrant celebration of her career, featuring iconic hits from all her distinct eras. Prepare for stunning visuals, incredible energy, and a setlist that spans pop, country, and indie folk. A must-see event for every Swiftie!",
            "Images/Concerts/ryokushaka_ASIATour_2025.jpg",
            2500000,
            "Taylor Swift",
            "Pop"
        ));

        // Concert 2
        concerts.add(new Concert(
            "Coldplay - Music of the Spheres World Tour",
            "January 15, 2026",
            "ICE BSD City",
            "Experience the cosmic spectacle of Coldplay's Music of the Spheres World Tour! Known for their visually stunning shows and uplifting anthems, Coldplay delivers an unforgettable night of music, light, and connection. Featuring hits like 'Yellow', 'Viva La Vida', and songs from their latest album, this concert is a journey through their vibrant universe.",
            "Images/Concerts/COLDPLAY_WorldTour.png",
            1800000,
            "Coldplay",
            "Alternative Rock"
        ));

        // Concert 3
        concerts.add(new Concert(
            "JKT48 - 10th Anniversary Concert",
            "February 1, 2025",
            "ICE BSD City",
            "Celebrate a decade of unforgettable performances with JKT48! Their 10th Anniversary Concert is a special event featuring all current members, surprise guests, and a look back at their journey. Get ready for high-energy choreography, fan favorites, and emotional moments. A milestone celebration for the Indonesian idol group!",
            "Images/Concerts/jkt48-konser.jpg", // Please add this image file to Images/Concerts/
            1000000,
            "JKT48",
            "J-Pop"
        ));

        // Concert 4
        concerts.add(new Concert(
            "Blackpink - Born Pink World Tour",
            "March 20, 2025",
            "Gelora Bung Karno Stadium",
            "Get ready to be blown away by the global phenomenon, Blackpink! The Born Pink World Tour showcases their fierce stage presence, powerful vocals, and groundbreaking hits. Expect dazzling production, stunning outfits, and chart-topping tracks that have taken the world by storm. A high-impact K-Pop experience you won't forget!",
            "Images/Concerts/blackpink_BORNPINK_2024.jpg",
            2200000,
            "Blackpink",
            "K-Pop"
        ));

        // Concert 5
        concerts.add(new Concert(
            "Ed Sheeran - Mathematics Tour",
            "April 5, 2025",
            "ICE BSD City",
            "Experience the raw talent of Ed Sheeran on his intimate Mathematics Tour. Known for his captivating solo performances with just a guitar and a loop pedal, Ed brings his heartfelt lyrics and catchy melodies to the stage. Sing along to global hits and enjoy an evening of acoustic brilliance and engaging storytelling.",
            "Images/Concerts/ED_Sheeran_Tour2024.jpg",
            1500000,
            "Ed Sheeran",
            "Pop"
        ));

        // Concert 6
        concerts.add(new Concert(
            "Foo Fighters - ASIA TOUR 2025",
            "October 4, 2025",
            "Carnaval Ancol, Jakarta, Indonesia",
            "Rock out with the legendary Foo Fighters on their Asia Tour 2025! Led by frontman Dave Grohl, the band is renowned for their explosive live shows and anthemic rock hits. Get ready for a high-octane performance featuring classics and tracks from their latest album. A must-see for rock fans!",
            "Images/Concerts/foo-fighters-concert.jpg", // Please add this image file to Images/Concerts/
            1700000, // Placeholder price
            "Foo Fighters",
            "Alternative Rock, Post-Grunge"
        ));

        // Concert 7
        concerts.add(new Concert(
            "YOASOBI - ASIA TOUR 2024-2025",
            "May 10, 2025",
            "ICE BSD City",
            "Experience the unique sound of YOASOBI, the Japanese music unit known for their innovative blend of pop and storytelling! Their Asia Tour brings their chart-topping hits and mesmerizing performances to Indonesia. Don't miss this chance to see the duo behind viral hits like 'Idol' and 'Gunjou' live in concert!",
            "Images/Concerts/YOASOBI-ASIATOUR-2024~2025.jpeg",
            1200000,
            "YOASOBI",
            "J-Pop"
        ));

        return concerts;
    }
} 