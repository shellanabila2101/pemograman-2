import javax.swing.*;
import java.awt.event.*;

public class pertemuan4_frame extends JFrame {

    public pertemuan4_frame() {
        setTitle("Memanggil Frame");
        setSize(400, 200);
        setLayout(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        JLabel label = new JLabel("MEMANGGIL - MENAMPILKAN FRAME LAIN");
        label.setBounds(50, 30, 300, 30);
        add(label);

        JButton btn = new JButton("PANGGIL FRAME");
        btn.setBounds(100, 80, 200, 30);
        add(btn);

        btn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                new FrameKedua();
            }
        });

        setLocationRelativeTo(null);
        setVisible(true);
    }

    // Class frame kedua di dalam file yang sama
    class FrameKedua extends JFrame {
        public FrameKedua() {
            setTitle("Frame Yang Dipanggil");
            setSize(400, 250);
            setLayout(null);

            JLabel title = new JLabel("FRAME YANG DIPANGGIL");
            title.setBounds(100, 20, 200, 30);
            add(title);

            JLabel lblNim = new JLabel("NIM");
            lblNim.setBounds(50, 80, 100, 25);
            add(lblNim);

            JTextField txtNim = new JTextField();
            txtNim.setBounds(200, 80, 120, 25);
            add(txtNim);

            JLabel lblNama = new JLabel("Nama Mahasiswa");
            lblNama.setBounds(50, 120, 150, 25);
            add(lblNama);

            JTextField txtNama = new JTextField();
            txtNama.setBounds(200, 120, 120, 25);
            add(txtNama);

            setLocationRelativeTo(null);
            setVisible(true);
        }
    }

    public static void main(String[] args) {
        new pertemuan4_frame();
    }
}