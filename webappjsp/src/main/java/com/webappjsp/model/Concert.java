package com.webappjsp.model;

public class Concert {
    private String title;
    private String date;
    private String location;
    private String description;
    private String imageUrl;
    private double price;
    private String artist;
    private String genre;

    public Concert(String title, String date, String location, String description, String imageUrl, double price, String artist, String genre) {
        this.title = title;
        this.date = date;
        this.location = location;
        this.description = description;
        this.imageUrl = imageUrl;
        this.price = price;
        this.artist = artist;
        this.genre = genre;
    }
    
    // Getters (required for JSP and Servlet to access properties)
    public String getTitle() {
        return title;
    }
    
    public String getDate() {
        return date;
    }
    
    public String getLocation() {
        return location;
    }

    public String getDescription() {
        return description;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    
    public double getPrice() { 
        return price;
    }

    public String getArtist() {
        return artist;
    }

    public String getGenre() {
        return genre;
    }
}