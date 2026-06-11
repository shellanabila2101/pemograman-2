<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Kunci keamanan: jika belum login, tendang balik ke halaman login
    if(session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard - Shella's Rentcar</title>
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
                    <li class="nav-item"><a class="nav-link" href="form-transaksi.jsp">Transaksi Sewa</a></li>
                    <li class="nav-item"><a class="nav-link" href="laporan-transaksi.jsp">Laporan</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger btn-sm text-white ms-3 px-3" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="p-5 mb-4 bg-white rounded-3 shadow-sm border text-center">
            <h1 class="display-5 fw-bold text-success">Shella's Rentcar System</h1>
            <p class="lead mt-3">Selamat datang, <b><%= session.getAttribute("adminUser") %></b>! Sistem manajemen armada rental mobil Anda siap digunakan.</p>
        </div>
    </div>

</body>
</html>