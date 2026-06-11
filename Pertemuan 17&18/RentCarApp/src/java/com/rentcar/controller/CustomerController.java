package com.rentcar.controller;

import com.rentcar.model.DatabaseConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil data dari form-customer.jsp
        String nama = request.getParameter("nama");
        String nik = request.getParameter("nik");
        String telepon = request.getParameter("telepon");
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            // 2. Buka koneksi database
            conn = DatabaseConfig.getConnection();
            
            // 3. Query SQL untuk insert data customer
            String sql = "INSERT INTO customer (nama, nik, telepon) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, nama);
            ps.setString(2, nik);
            ps.setString(3, telepon);
            
            // 4. Jalankan perintah query
            ps.executeUpdate();
            
            // 5. Kembali ke halaman form-customer dengan status sukses
            response.sendRedirect("form-customer.jsp?status=sukses");
            
        } catch (Exception e) {
            e.printStackTrace();
            // Jika error, lempar status gagal
            response.sendRedirect("form-customer.jsp?status=gagal");
        } finally {
            // Bersihkan koneksi
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}