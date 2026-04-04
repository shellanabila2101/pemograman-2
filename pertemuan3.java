import javax.swing.*;
import java.awt.event.*;

public class KalkulatorSederhana extends JFrame implements ActionListener {

    JLabel lblAngka1, lblAngka2, lblHasil;
    JTextField txtAngka1, txtAngka2, txtHasil;
    JButton btnTambah, btnHapus, btnExit;

    public KalkulatorSederhana() {

        setTitle("Shellawati Nabila - 231011401016");
        setSize(350,250);
        setLayout(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Label
        lblAngka1 = new JLabel("Angka Pertama");
        lblAngka1.setBounds(30,20,100,25);
        add(lblAngka1);

        lblAngka2 = new JLabel("Angka Kedua");
        lblAngka2.setBounds(30,60,100,25);
        add(lblAngka2);

        lblHasil = new JLabel("Hasil");
        lblHasil.setBounds(30,100,100,25);
        add(lblHasil);

        // TextField
        txtAngka1 = new JTextField();
        txtAngka1.setBounds(150,20,120,25);
        add(txtAngka1);

        txtAngka2 = new JTextField();
        txtAngka2.setBounds(150,60,120,25);
        add(txtAngka2);

        txtHasil = new JTextField();
        txtHasil.setBounds(150,100,120,25);
        txtHasil.setEditable(false);
        add(txtHasil);

        // Button
        btnTambah = new JButton("Tambah");
        btnTambah.setBounds(30,150,80,30);
        add(btnTambah);

        btnHapus = new JButton("Hapus");
        btnHapus.setBounds(130,150,80,30);
        add(btnHapus);

        btnExit = new JButton("Exit");
        btnExit.setBounds(230,150,80,30);
        add(btnExit);

        btnTambah.addActionListener(this);
        btnHapus.addActionListener(this);
        btnExit.addActionListener(this);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        if(e.getSource()==btnTambah){
            int angka1 = Integer.parseInt(txtAngka1.getText());
            int angka2 = Integer.parseInt(txtAngka2.getText());
            int hasil = angka1 + angka2;

            txtHasil.setText(String.valueOf(hasil));
        }

        if(e.getSource()==btnHapus){
            txtAngka1.setText("");
            txtAngka2.setText("");
            txtHasil.setText("");
        }

        if(e.getSource()==btnExit){
            System.exit(0);
        }
    }

    public static void main(String[] args) {
        new KalkulatorSederhana();
    }
}