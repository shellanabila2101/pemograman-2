<%
    session.invalidate(); // Menghapus session login admin
    response.sendRedirect("login.jsp"); // Mengembalikan ke halaman login
%>