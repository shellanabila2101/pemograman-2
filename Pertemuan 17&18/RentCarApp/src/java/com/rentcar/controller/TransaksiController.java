package com.rentcar.controller;

import com.rentcar.model.DatabaseConfig;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TransaksiController")
public class TransaksiController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Connection conn = null;
        
        try {
            conn = DatabaseConfig.getConnection();
            
            if ("sewa".equals(action)) {
                int idMobil = Integer.parseInt(request.getParameter("id_mobil"));
                int idCustomer = Integer.parseInt(request.getParameter("id_customer"));
                String tglSewa = request.getParameter("tgl_sewa");
                
                // 1. Simpan data transaksi
                PreparedStatement ps = conn.prepareStatement("INSERT INTO transaksi (id_mobil, id_customer, tgl_sewa) VALUES (?, ?, ?)");
                ps.setInt(1, idMobil);
                ps.setInt(2, idCustomer);
                ps.setString(3, tglSewa);
                ps.executeUpdate();
                
                // 2. Ubah status mobil jadi 'Disewa'
                PreparedStatement psMobil = conn.prepareStatement("UPDATE mobil SET status='Disewa' WHERE id_mobil=?");
                psMobil.setInt(1, idMobil);
                psMobil.executeUpdate();
                
            } else if ("kembali".equals(action)) {
                int idTransaksi = Integer.parseInt(request.getParameter("id_transaksi"));
                int idMobil = Integer.parseInt(request.getParameter("id_mobil"));
                String tglKembaliStr = request.getParameter("tgl_kembali");
                
                // Ambil tgl_sewa dan harga_sewa untuk hitung total bayar otomatis
                PreparedStatement psGet = conn.prepareStatement(
                    "SELECT t.tgl_sewa, m.harga_sewa FROM transaksi t JOIN mobil m ON t.id_mobil = m.id_mobil WHERE t.id_transaksi=?");
                psGet.setInt(1, idTransaksi);
                ResultSet rs = psGet.executeQuery();
                
                if(rs.next()) {
                    LocalDate tglSewa = LocalDate.parse(rs.getString("tgl_sewa"));
                    LocalDate tglKembali = LocalDate.parse(tglKembaliStr);
                    double hargaSewa = rs.getDouble("harga_sewa");
                    
                    // Hitung durasi hari (minimal 1 hari)
                    long hari = ChronoUnit.DAYS.between(tglSewa, tglKembali);
                    if(hari <= 0) { hari = 1; }
                    double totalBayar = hari * hargaSewa;
                    
                    // Update data transaksi pengembalian
                    PreparedStatement psUp = conn.prepareStatement(
                        "UPDATE transaksi SET tgl_kembali=?, total_bayar=?, status_transaksi='Selesai' WHERE id_transaksi=?");
                    psUp.setString(1, tglKembaliStr);
                    psUp.setDouble(2, totalBayar);
                    psUp.setInt(3, idTransaksi);
                    psUp.executeUpdate();
                    
                    // Ubah kembali status mobil menjadi 'Tersedia'
                    PreparedStatement psMob = conn.prepareStatement("UPDATE mobil SET status='Tersedia' WHERE id_mobil=?");
                    psMob.setInt(1, idMobil);
                    psMob.executeUpdate();
                }
            }
            conn.close();
        } catch(Exception e) { e.printStackTrace(); }
        response.sendRedirect("form-transaksi.jsp");
    }
}