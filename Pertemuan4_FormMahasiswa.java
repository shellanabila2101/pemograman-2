import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.*;

public class Pertemuan4_FormMahasiswa extends JFrame {

    JTextField txtNim, txtNama, txtNilai;
    JButton btnTabel;
    JTable table;
    DefaultTableModel model;

    public Pertemuan4_FormMahasiswa() {

        setTitle("Form Mahasiswa");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        // Label
        JLabel lblNim = new JLabel("N I M");
        lblNim.setBounds(30, 20, 100, 25);
        add(lblNim);

        JLabel lblNama = new JLabel("Nama Mahasiswa");
        lblNama.setBounds(30, 60, 120, 25);
        add(lblNama);

        JLabel lblNilai = new JLabel("Nilai");
        lblNilai.setBounds(30, 100, 100, 25);
        add(lblNilai);

        // TextField
        txtNim = new JTextField();
        txtNim.setBounds(160, 20, 200, 25);
        add(txtNim);

        txtNama = new JTextField();
        txtNama.setBounds(160, 60, 200, 25);
        add(txtNama);

        txtNilai = new JTextField();
        txtNilai.setBounds(160, 100, 200, 25);
        add(txtNilai);

        // Button
        btnTabel = new JButton("TABEL");
        btnTabel.setBounds(380, 20, 100, 30);
        add(btnTabel);

        // Table
        model = new DefaultTableModel();
        model.addColumn("NIM");
        model.addColumn("Nama");
        model.addColumn("Nilai");
        model.addColumn("Grade");

        table = new JTable(model);
        JScrollPane sp = new JScrollPane(table);
        sp.setBounds(30, 150, 520, 150);
        add(sp);

        // Event tombol
        btnTabel.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

                String nim = txtNim.getText();
                String nama = txtNama.getText();
                float nilai = Float.parseFloat(txtNilai.getText());

                String grade;
                if (nilai < 50)
                    grade = "E";
                else if (nilai < 60)
                    grade = "D";
                else if (nilai < 70)
                    grade = "C";
                else if (nilai < 80)
                    grade = "B";
                else
                    grade = "A";

                // Tambah ke tabel
                model.addRow(new Object[]{nim, nama, nilai, grade});

                // Clear input
                txtNim.setText("");
                txtNama.setText("");
                txtNilai.setText("");
            }
        });
    }

    public static void main(String[] args) {
        new Pertemuan4_FormMahasiswa().setVisible(true);
    }
}
