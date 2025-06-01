CREATE DATABASE mvc_demo;
USE mvc_demo;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phoneNumber INT NOT NULL
);

INSERT INTO users (name, email, phoneNumber) VALUES
('John Doe', 'john.doe@example.com', 1234567890),
('Jane Smith', 'jane.smith@example.com', 9876543210);

-- Create the orders table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    external_id VARCHAR(255) NOT NULL,
    concert_title VARCHAR(255) NOT NULL,
    order_date VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    artist VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    ticket_type VARCHAR(50) NOT NULL,
    ticket_count INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'PENDING',
    order_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
