package com.rentcar.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {
    // Gunakan port 3306 jika MySQL normal, atau 3307 jika tadi kamu ubah di XAMPP
    private static final String URL = "jdbc:mysql://localhost:3306/rentcar_db";
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 

    public static Connection getConnection() throws SQLException {
        try {
            // Memanggil driver MySQL .jar yang sudah kita pasang
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver tidak ditemukan: " + e.getMessage());
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}