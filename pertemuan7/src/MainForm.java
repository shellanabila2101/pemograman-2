// Nama : SHELLAWATI NABILA
// NIM  : 231011401016

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

public class MainForm extends JFrame {
    
    public MainForm() {
        // Konfigurasi dasar JFrame
        setTitle("Form Cetak Laporan");
        setSize(300, 150);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new FlowLayout(FlowLayout.CENTER, 20, 40));

        // Membuat tombol "Cetak"
        JButton btnCetak = new JButton("Cetak");
        
        // Menambahkan aksi (event) ketika tombol diklik
        btnCetak.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cetakLaporan();
            }
        });

        add(btnCetak);
        setLocationRelativeTo(null); // Menempatkan window di tengah layar
    }

    private void cetakLaporan() {
        // Detail Koneksi Database MySQL
        String user = "root";
        String pass = "";
        String host = "localhost";
        String db = "datamhs";
        String url = "jdbc:mysql://" + host + ":3306/" + db;

        try {
            // 1. Membuka Koneksi ke Database
            Connection conn = DriverManager.getConnection(url, user, pass);
            
            // 2. Menentukan lokasi file .jrxml
            String jrxmlFile = "src/NilaiReport.jrxml";
            
            // 3. Mengompilasi .jrxml menjadi JasperReport
            JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlFile);
            
            // 4. Mengisi laporan dengan data dari database yang terhubung
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
            
            // 5. Menampilkan laporan menggunakan JasperViewer
            // Parameter 'false' agar aplikasi tidak tertutup saat viewer laporan di-close
            JasperViewer.viewReport(jasperPrint, false);
            
            // Tutup koneksi setelah selesai
            conn.close();
            
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Gagal mencetak laporan: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void main(String[] args) {
        // Menjalankan GUI Swing di thread yang aman
        SwingUtilities.invokeLater(() -> {
            new MainForm().setVisible(true);
        });
    }
}