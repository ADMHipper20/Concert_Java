package com.webappjsp.utils;

import java.sql.*;
import java.util.*;

import com.webappjsp.model.User;

public class jdbc implements AutoCloseable {
    private Connection conn;

    public jdbc() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc_demo", "root", "");
        conn.setAutoCommit(false);
    }

    public List<User> getAllUsers() throws SQLException {
        List<User> list = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");

        while (rs.next()) {
            list.add(new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getInt("phoneNumber")
            ));
        }
        return list;
    }

    public void saveOrder(String externalId, String concertTitle, String orderDate, String location, double price, String artist, String genre, String ticketType, int ticketCount, String customerName, String customerEmail, String customerPhone, String paymentMethod) throws SQLException {
        String sql = "INSERT INTO orders (external_id, concert_title, order_date, location, price, artist, genre, ticket_type, ticket_count, customer_name, customer_email, customer_phone, payment_method, order_timestamp, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'PENDING')";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, externalId);
        pstmt.setString(2, concertTitle);
        pstmt.setString(3, orderDate);
        pstmt.setString(4, location);
        pstmt.setDouble(5, price);
        pstmt.setString(6, artist);
        pstmt.setString(7, genre);
        pstmt.setString(8, ticketType);
        pstmt.setInt(9, ticketCount);
        pstmt.setString(10, customerName);
        pstmt.setString(11, customerEmail);
        pstmt.setString(12, customerPhone);
        pstmt.setString(13, paymentMethod);

        pstmt.executeUpdate();
        conn.commit(); // Commit the transaction
    }

    public boolean validateTicket(String ticketId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders WHERE external_id = ? AND payment_status = 'PAID'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ticketId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }

    public void updateOrderStatus(String ticketId, String status) throws SQLException {
        String sql = "UPDATE orders SET payment_status = ? WHERE external_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, status);
        pstmt.setString(2, ticketId);
        pstmt.executeUpdate();
        conn.commit();
    }

    public String getCustomerEmail(String ticketId) throws SQLException {
        String sql = "SELECT customer_email FROM orders WHERE external_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ticketId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            return rs.getString("customer_email");
        }
        return null;
    }

    public Map<String, String> getOrderDetails(String ticketId) throws SQLException {
        String sql = "SELECT external_id, concert_title, order_date, location, price, customer_name, customer_email, customer_phone, payment_method, artist, genre FROM orders WHERE external_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ticketId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            Map<String, String> orderDetails = new HashMap<>();
            orderDetails.put("image_url", "src/main/webapp/Images/Concerts");
            orderDetails.put("title", rs.getString("concert_title"));
            orderDetails.put("date", rs.getString("order_date"));
            orderDetails.put("location", rs.getString("location"));
            orderDetails.put("price", String.valueOf(rs.getDouble("price")));
            orderDetails.put("customer_name", rs.getString("customer_name"));
            orderDetails.put("customer_email", rs.getString("customer_email"));
            orderDetails.put("customer_phone", rs.getString("customer_phone"));
            orderDetails.put("payment_method", rs.getString("payment_method"));
            orderDetails.put("artist", rs.getString("artist"));
            orderDetails.put("genre", rs.getString("genre"));
            return orderDetails;
        }
        return null;
    }

    public List<com.webappjsp.model.Order> getPendingOrders() throws SQLException {
        List<com.webappjsp.model.Order> pendingOrders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE payment_status = 'PENDING'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            // Assuming you have an Order model class with appropriate constructor or setters
            com.webappjsp.model.Order order = new com.webappjsp.model.Order();
            order.setTicketId(rs.getString("external_id"));
            order.setConcertTitle(rs.getString("concert_title"));
            order.setOrderDate(rs.getString("order_date"));
            order.setLocation(rs.getString("location"));
            order.setPrice(rs.getDouble("price"));
            order.setArtist(rs.getString("artist"));
            order.setGenre(rs.getString("genre"));
            order.setTicketType(rs.getString("ticket_type"));
            order.setTicketCount(rs.getInt("ticket_count"));
            order.setCustomerName(rs.getString("customer_name"));
            order.setCustomerEmail(rs.getString("customer_email"));
            order.setCustomerPhone(rs.getString("customer_phone"));
            order.setPaymentMethod(rs.getString("payment_method"));
            order.setPaymentStatus(rs.getString("payment_status"));
            pendingOrders.add(order);
        }
        return pendingOrders;
    }

    public String getOrderStatus(String ticketId) throws SQLException {
        String sql = "SELECT payment_status FROM orders WHERE external_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ticketId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            return rs.getString("payment_status");
        }
        return null;
    }

    @Override
    public void close() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}