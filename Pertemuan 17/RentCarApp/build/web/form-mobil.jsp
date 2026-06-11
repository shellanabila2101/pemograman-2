<%@page import="java.sql.*"%>
<%@page import="com.rentcar.model.DatabaseConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Kunci keamanan: jika belum login, kembalikan ke halaman login
    if(session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola Mobil - Shella's Rentcar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">✨ SHELLA'S RENTCAR</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="form-mobil.jsp">Kelola Mobil</a></li>
                    <li class="nav-item"><a class="nav-link" href="form-customer.jsp">Kelola Customer</a></li>
                    <li class="nav-item"><a class="nav-link" href="form-transaksi.jsp">Transaksi Sewa</a></li>
                    <li class="nav-item"><a class="nav-link" href="laporan-transaksi.jsp">Laporan</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger btn-sm text-white ms-3 px-3" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 mb-4">
                <% if (request.getParameter("status") != null && request.getParameter("status").equals("sukses")) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Berhasil!</strong> Data disimpan.
                    </div>
                <% } %>

                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white py-3">
                        <h6 class="mb-0 fw-bold">Tambah Mobil Baru</h6>
                    </div>
                    <div class="card-body p-3">
                        <form action="MobilController" method="POST">
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Nama / Merk Mobil</label>
                                <input type="text" name="merk" class="form-control" placeholder="Contoh: Toyota Avanza" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Plat Nomor</label>
                                <input type="text" name="plat_nomor" class="form-control" placeholder="Contoh: B 1234 ABC" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Harga Sewa / Hari (Rp)</label>
                                <input type="number" name="harga_sewa" class="form-control" placeholder="Contoh: 350000" required>
                            </div>
                            <button type="submit" class="btn btn-success w-100 fw-bold py-2">Simpan Mobil</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-dark text-white py-3">
                        <h6 class="mb-0 fw-bold">🚗 Daftar Armada Mobil Shella's Rentcar</h6>
                    </div>
                    <div class="card-body p-0">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-secondary">
                                <tr>
                                    <th class="ps-3">ID</th>
                                    <th>Merk/Model Mobil</th>
                                    <th>Plat Nomor</th>
                                    <th>Harga / Hari</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        // Membuka koneksi ke MySQL untuk menarik data mobil
                                        Connection conn = DatabaseConfig.getConnection();
                                        String query = "SELECT * FROM mobil ORDER BY id_mobil DESC";
                                        Statement st = conn.createStatement();
                                        ResultSet rs = st.executeQuery(query);
                                        
                                        // Looping untuk menampilkan setiap baris data mobil
                                        while(rs.next()) {
                                %>
                                <tr>
                                    <td class="ps-3"><%= rs.getInt("id_mobil") %></td>
                                    <td class="fw-semibold text-secondary"><%= rs.getString("merk") %></td>
                                    <td><span class="badge bg-light text-dark border border-secondary"><%= rs.getString("plat_nomor") %></span></td>
                                    <td>Rp <%= String.format("%,.0f", rs.getDouble("harga_sewa")) %></td>
                                    <td>
                                        <% if(rs.getString("status").equals("Tersedia")) { %>
                                            <span class="badge bg-success">Tersedia</span>
                                        <% } else { %>
                                            <span class="badge bg-danger">Disewa</span>
                                        <% } %>
                                    </td>
                                </tr>
                                <% 
                                        }
                                        conn.close();
                                    } catch (Exception e) {
                                        out.println("<tr><td colspan='5' class='text-center text-danger'>Gagal memuat data: " + e.getMessage() + "</td></tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>