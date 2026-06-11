<%@page import="java.sql.*"%>
<%@page import="com.rentcar.model.DatabaseConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("adminUser") == null) { response.sendRedirect("login.jsp"); }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Transaksi - Shella's Rentcar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">✨ SHELLA'S RENTCAR</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="form-mobil.jsp">Kelola Mobil</a></li>
                    <li class="nav-item"><a class="nav-link" href="form-customer.jsp">Kelola Customer</a></li>
                    <li class="nav-item"><a class="nav-link active" href="form-transaksi.jsp">Transaksi Sewa</a></li>
                    <li class="nav-item"><a class="nav-link" href="laporan-transaksi.jsp">Laporan</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger btn-sm text-white ms-3 px-3" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-warning text-dark py-3"><h6 class="mb-0 fw-bold">📝 Input Sewa Baru</h6></div>
                    <div class="card-body">
                        <form action="TransaksiController" method="POST">
                            <input type="hidden" name="action" value="sewa">
                            
                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Pilih Mobil (Tersedia)</label>
                                <select name="id_mobil" class="form-select" required>
                                    <option value="">-- Pilih --</option>
                                    <% try { Connection c = DatabaseConfig.getConnection(); ResultSet r = c.createStatement().executeQuery("SELECT * FROM mobil WHERE status='Tersedia'"); while(r.next()) { %>
                                        <option value="<%= r.getInt("id_mobil") %>"><%= r.getString("merk") %> (<%= r.getString("plat_nomor") %>)</option>
                                    <% } c.close(); } catch(Exception e){} %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Pilih Customer</label>
                                <select name="id_customer" class="form-select" required>
                                    <option value="">-- Pilih --</option>
                                    <% try { Connection c = DatabaseConfig.getConnection(); ResultSet r = c.createStatement().executeQuery("SELECT * FROM customer"); while(r.next()) { %>
                                        <option value="<%= r.getInt("id_customer") %>"><%= r.getString("nama") %></option>
                                    <% } c.close(); } catch(Exception e){} %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-semibold">Tanggal Sewa</label>
                                <input type="date" name="tgl_sewa" class="form-control" required>
                            </div>

                            <button type="submit" class="btn btn-warning w-100 fw-bold py-2 text-dark">Proses Sewa</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-dark text-white py-3"><h6 class="mb-0 fw-bold">🔄 Rental Aktif (Sedang Disewa)</h6></div>
                    <div class="card-body p-0">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-secondary">
                                <tr>
                                    <th class="ps-3">ID</th>
                                    <th>Customer</th>
                                    <th>Mobil</th>
                                    <th>Tgl Sewa</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Connection conn = DatabaseConfig.getConnection();
                                        String sql = "SELECT t.*, c.nama, m.merk FROM transaksi t " +
                                                     "JOIN customer c ON t.id_customer = c.id_customer " +
                                                     "JOIN mobil m ON t.id_mobil = m.id_mobil WHERE t.status_transaksi='Disewa'";
                                        ResultSet rs = conn.createStatement().executeQuery(sql);
                                        while(rs.next()) {
                                %>
                                <tr>
                                    <td class="ps-3"><%= rs.getInt("id_transaksi") %></td>
                                    <td class="fw-bold"><%= rs.getString("nama") %></td>
                                    <td><%= rs.getString("merk") %></td>
                                    <td><%= rs.getString("tgl_sewa") %></td>
                                    <td>
                                        <form action="TransaksiController" method="POST" style="display:inline;">
                                            <input type="hidden" name="action" value="kembali">
                                            <input type="hidden" name="id_transaksi" value="<%= rs.getInt("id_transaksi") %>">
                                            <input type="hidden" name="id_mobil" value="<%= rs.getInt("id_mobil") %>">
                                            <input type="date" name="tgl_kembali" required class="form-control-sm border-secondary d-inline-block" style="width:130px;">
                                            <button type="submit" class="btn btn-danger btn-sm fw-bold">Kembalikan</button>
                                        </form>
                                    </td>
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