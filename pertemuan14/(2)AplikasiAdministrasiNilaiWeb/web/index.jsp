<%

if(session.getAttribute("login")==null){

response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>
<head>

<title>Home</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<center>

<h1>APLIKASI ADMINISTRASI NILAI</h1>

<%@ include file="menu.jsp" %>

<h2>Selamat Datang Admin</h2>

</center>

</body>
</html>