package com.example.hotel;

import jakarta.servlet.http.HttpSession; // Baris import ini yang sangat krusial
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class ReservasiController {

    @Autowired
    private ReservasiRepository reservasiRepository;

    @GetMapping
    public String index(Model model) {
        model.addAttribute("reservasi", new Reservasi());
        return "index";
    }

    @PostMapping("/pesan")
    public String pesanKamar(@ModelAttribute("reservasi") Reservasi reservasi, Model model) {
        try {
            if (reservasi.getNamaTamu() == null || reservasi.getNamaTamu().trim().isEmpty()) {
                throw new IllegalArgumentException("Nama tamu tidak boleh kosong!");
            }

            long totalTerpesan = reservasiRepository.countByTipeKamar(reservasi.getTipeKamar());
            if (totalTerpesan >= 3) {
                throw new KamarPenuhException("Maaf, Kamar tipe " + reservasi.getTipeKamar() + " sudah penuh!");
            }

            reservasi.hitungTotalBiaya();
            reservasiRepository.save(reservasi);
            
            model.addAttribute("successMessage", "Reservasi berhasil diajukan! Status: Belum Bayar.");
            model.addAttribute("reservasi", new Reservasi());
            return "index";

        } catch (KamarPenuhException | IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "index";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Terjadi kesalahan sistem: " + e.getMessage());
            return "index";
        }
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String prosesLogin(@RequestParam("username") String username, 
                              @RequestParam("password") String password, 
                              HttpSession session, Model model) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("adminSession", username);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("loginError", "Username atau Password Admin Salah!");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        if (session.getAttribute("adminSession") == null) {
            return "redirect:/login";
        }
        model.addAttribute("listReservasi", reservasiRepository.findAll());
        return "admin-dashboard";
    }

    @GetMapping("/admin/konfirmasi-bayar/{id}")
    public String konfirmasiBayar(@PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("adminSession") == null) {
            return "redirect:/login";
        }
        
        Reservasi res = reservasiRepository.findById(id).orElse(null);
        if (res != null) {
            res.setStatusBayar("Sudah Bayar");
            reservasiRepository.save(res);
        }
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/admin/delete/{id}")
    public String hapusReservasi(@PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("adminSession") == null) {
            return "redirect:/login";
        }
        reservasiRepository.deleteById(id);
        return "redirect:/admin/dashboard";
    }
}