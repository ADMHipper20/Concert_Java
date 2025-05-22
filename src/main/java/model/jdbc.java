package model;

import java.sql.*;
import java.util.*;

public class jdbc {
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
}