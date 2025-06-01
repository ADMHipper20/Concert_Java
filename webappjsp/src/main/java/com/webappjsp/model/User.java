package com.webappjsp.model;

public class User {
    private int id;
    private String name;
    private String email;
    private int phoneNumber;

    // constructor + getter + setter
    public User(int id, String name, String email, int phoneNumber) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    public String getEmail() {
        return email;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }
    
    
}
