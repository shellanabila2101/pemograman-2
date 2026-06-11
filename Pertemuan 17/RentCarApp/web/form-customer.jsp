<%@page import="java.sql.*"%>
<%@page import="com.rentcar.model.DatabaseConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("adminUser") == null) { response.sendRedirect("login.jsp"); }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola Customer - Shella's Rentcar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">✨ SHELLA'S RENTCAR</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="form-mobil.jsp">Kelola Mobil</a></li>
                    <li class="nav-item"><a class="nav-link active" href="form-customer.jsp">Kelola Customer</a></li>
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
                    <div class="alert alert-success">Data customer berhasil disimpan!</div>
                <% } %>
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-success text-white py-3"><h6 class="mb-0 fw-bold">Tambah Customer Baru</h6></div>
                    <div class="card-body">
                        <form action="CustomerController" method="POST">
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Nama Lengkap</label>
                                <input type="text" name="nama" class="form-control" required placeholder="Nama sesuai KTP">
                            </div>
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Nomor NIK</label>
                                <input type="text" name="nik" class="form-control" required placeholder="16 Digit NIK">
                            </div>
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">No. Telepon</label>
                                <input type="text" name="telepon" class="form-control" required placeholder="Contoh: 0812345...">
                            </div>
                            <button type="submit" class="btn btn-success w-100 fw-bold py-2">Simpan Customer</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-dark text-white py-3"><h6 class="mb-0 fw-bold">👥 Daftar Customer Terdaftar</h6></div>
                    <div class="card-body p-0">
                        <table class="table table-striped mb-0">
                            <thead class="table-secondary">
                                <tr>
                                    <th class="ps-3">ID</th>
                                    <th>Nama</th>
                                    <th>NIK</th>
                                    <th>Telepon</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Connection conn = DatabaseConfig.getConnection();
                                        ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM customer ORDER BY id_customer DESC");
                                        while(rs.next()) {
                                %>
                                <tr>
                                    <td class="ps-3"><%= rs.getInt("id_customer") %></td>
                                    <td class="fw-bold text-secondary"><%= rs.getString("nama") %></td>
                                    <td><%= rs.getString("nik") %></td>
                                    <td><%= rs.getString("telepon") %></td>
                                </tr>
                                <% } conn.close(); } catch(Exception e) { e.printStackTrace(); } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>