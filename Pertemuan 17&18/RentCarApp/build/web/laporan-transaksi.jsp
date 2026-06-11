<%@page import="java.sql.*"%>
<%@page import="com.rentcar.model.DatabaseConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("adminUser") == null) { response.sendRedirect("login.jsp"); }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Laporan - Shella's Rentcar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">✨ SHELLA'S RENTCAR</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="form-mobil.jsp">Kelola Mobil</a></li>
                    <li class="nav-item"><a class="nav-link" href="form-customer.jsp">Kelola Customer</a></li>
                    <li class="nav-item"><a class="nav-link" href="form-transaksi.jsp">Transaksi Sewa</a></li>
                    <li class="nav-item"><a class="nav-link active" href="laporan-transaksi.jsp">Laporan</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger btn-sm text-white ms-3 px-3" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center py-3">
                <h5 class="mb-0 fw-bold">📊 LAPORAN RIWAYAT TRANSAKSI PENYEWAAN</h5>
                <button onclick="window.print()" class="btn btn-sm btn-light fw-bold">🖨️ Cetak Laporan</button>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped mb-0">
                    <thead class="table-secondary">
                        <tr>
                            <th class="ps-3">ID</th>
                            <th>Nama Customer</th>
                            <th>Mobil</th>
                            <th>Tanggal Sewa</th>
                            <th>Tanggal Kembali</th>
                            <th class="pe-3 text-end">Total Bayar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double omsetTotal = 0;
                            try {
                                Connection conn = DatabaseConfig.getConnection();
                                String sql = "SELECT t.*, c.nama, m.merk FROM transaksi t " +
                                             "JOIN customer c ON t.id_customer = c.id_customer " +
                                             "JOIN mobil m ON t.id_mobil = m.id_mobil WHERE t.status_transaksi='Selesai' ORDER BY t.id_transaksi DESC";
                                ResultSet rs = conn.createStatement().executeQuery(sql);
                                while(rs.next()) {
                                    omsetTotal += rs.getDouble("total_bayar");
                        %>
                        <tr>
                            <td class="ps-3"><%= rs.getInt("id_transaksi") %></td>
                            <td class="fw-semibold"><%= rs.getString("nama") %></td>
                            <td><%= rs.getString("merk") %></td>
                            <td><%= rs.getString("tgl_sewa") %></td>
                            <td><%= rs.getString("tgl_kembali") %></td>
                            <td class="pe-3 text-end text-success fw-bold">Rp <%= String.format("%,.0f", rs.getDouble("total_bayar")) %></td>
                        </tr>
                        <% } conn.close(); } catch(Exception e) { e.printStackTrace(); } %>
                        <tr class="table-dark fw-bold">
                            <td colspan="5" class="ps-3 text-end">TOTAL PENDAPATAN (OMSET):</td>
                            <td class="pe-3 text-end text-warning">Rp <%= String.format("%,.0f", omsetTotal) %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>