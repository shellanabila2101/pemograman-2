<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Shella's Rentcar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-secondary d-flex align-items-center" style="height: 100vh;">
    <div class="container" style="max-width: 400px;">
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center">Username atau Password Salah!</div>
        <% } %>
        <div class="card shadow-lg border-0">
            <div class="card-header bg-dark text-white text-center py-4">
                <h4 class="mb-0 fw-bold">🚗 Shella's Rentcar</h4>
                <small class="text-muted">Admin Login System</small>
            </div>
            <div class="card-body p-4">
                <form action="LoginController" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required placeholder="Masukkan username">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required placeholder="Masukkan password">
                    </div>
                    <button type="submit" class="btn btn-dark w-100 fw-bold py-2 mt-2">Masuk Ke Sistem</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>