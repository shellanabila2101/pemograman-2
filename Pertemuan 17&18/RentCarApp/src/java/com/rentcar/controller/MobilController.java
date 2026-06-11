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

@WebServlet("/MobilController")
public class MobilController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil data yang diisi user dari form-mobil.jsp
        String merk = request.getParameter("merk");
        String platNomor = request.getParameter("plat_nomor");
        double hargaSewa = Double.parseDouble(request.getParameter("harga_sewa"));
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            // 2. Panggil koneksi database dari DatabaseConfig
            conn = DatabaseConfig.getConnection();
            
            // 3. Siapkan query SQL untuk menyimpan data
            String sql = "INSERT INTO mobil (merk, plat_nomor, harga_sewa) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, merk);
            ps.setString(2, platNomor);
            ps.setDouble(3, hargaSewa);
            
            // 4. Jalankan perintah SQL
            ps.executeUpdate();
            
            // 5. Jika berhasil, lempar kembali ke halaman form dengan status sukses
            response.sendRedirect("form-mobil.jsp?status=sukses");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("form-mobil.jsp?status=gagal");
        } finally {
            // Tutup koneksi agar tidak berat
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}