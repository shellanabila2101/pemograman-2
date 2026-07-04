package com.example.hotel;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Entity
@Table(name = "reservasi")
public class Reservasi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nama_tamu", nullable = false)
    private String namaTamu;

    @Column(name = "tipe_kamar", nullable = false)
    private String tipeKamar;

    @Column(name = "tanggal_check_in", nullable = false)
    private LocalDate tanggalCheckIn;

    @Column(name = "tanggal_check_out", nullable = false)
    private LocalDate tanggalCheckOut;

    @Column(name = "total_biaya")
    private Long totalBiaya;

    // Tambah Kolom Status Pembayaran
    @Column(name = "status_bayar")
    private String statusBayar = "Belum Bayar"; 

    public Reservasi() {}

    public void hitungTotalBiaya() {
        long hargaPerMalam = 0;
        if ("Standard".equals(this.tipeKamar)) {
            hargaPerMalam = 350000;
        } else if ("Deluxe".equals(this.tipeKamar)) {
            hargaPerMalam = 600000;
        } else if ("Suite".equals(this.tipeKamar)) {
            hargaPerMalam = 1200000;
        }

        long jumlahMalam = ChronoUnit.DAYS.between(this.tanggalCheckIn, this.tanggalCheckOut);
        if (jumlahMalam <= 0) {
            jumlahMalam = 1; 
        }

        this.totalBiaya = hargaPerMalam * jumlahMalam;
    }

    // Getter dan Setter Tambahan
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNamaTamu() { return namaTamu; }
    public void setNamaTamu(String namaTamu) { this.namaTamu = namaTamu; }

    public String getTipeKamar() { return tipeKamar; }
    public void setTipeKamar(String tipeKamar) { this.tipeKamar = tipeKamar; }

    public LocalDate getTanggalCheckIn() { return tanggalCheckIn; }
    public void setTanggalCheckIn(LocalDate tanggalCheckIn) { this.tanggalCheckIn = tanggalCheckIn; }

    public LocalDate getTanggalCheckOut() { return tanggalCheckOut; }
    public void setTanggalCheckOut(LocalDate tanggalCheckOut) { this.tanggalCheckOut = tanggalCheckOut; }

    public Long getTotalBiaya() { return totalBiaya; }
    public void setTotalBiaya(Long totalBiaya) { this.totalBiaya = totalBiaya; }

    public String getStatusBayar() { return statusBayar; }
    public void setStatusBayar(String statusBayar) { this.statusBayar = statusBayar; }
}