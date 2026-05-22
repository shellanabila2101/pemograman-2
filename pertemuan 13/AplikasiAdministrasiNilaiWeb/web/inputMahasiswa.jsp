<%

if(session.getAttribute("login")==null){

response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>
<head>

<title>Input Mahasiswa</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<center>

<h1>INPUT MAHASISWA</h1>

<%@ include file="menu.jsp" %>

<form action="simpanMahasiswa.jsp" method="post">

<table>

<tr>
<td>NIM</td>
<td><input type="text" name="nim"></td>
</tr>

<tr>
<td>Nama</td>
<td><input type="text" name="nama"></td>
</tr>

<tr>
<td>Jurusan</td>
<td><input type="text" name="jurusan"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Simpan"></td>
</tr>

</table>

</form>

</center>

</body>
</html>