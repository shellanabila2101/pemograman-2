<%

if(session.getAttribute("login")==null){

response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>
<head>

<title>Input Nilai</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<center>

<h1>INPUT NILAI</h1>

<%@ include file="menu.jsp" %>

<form action="NilaiController" method="post">

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
<td>Mata Kuliah</td>
<td><input type="text" name="matkul"></td>
</tr>

<tr>
<td>Nilai</td>
<td><input type="number" name="nilai"></td>
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