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
