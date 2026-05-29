<%@page import="java.util.ArrayList"%>

<%

int index = Integer.parseInt(request.getParameter("index"));

ArrayList dataMhs = (ArrayList)session.getAttribute("dataMhs");

String nim = (String)dataMhs.get(index);
String nama = (String)dataMhs.get(index+1);
String jurusan = (String)dataMhs.get(index+2);

%>

<!DOCTYPE html>
<html>
<head>

<title>Edit Mahasiswa</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<center>

<h1>EDIT MAHASISWA</h1>

<%@ include file="menu.jsp" %>

<form action="updateMahasiswa.jsp" method="post">

<input type="hidden" name="index" value="<%=index%>">

<table>

<tr>
<td>NIM</td>
<td><input type="text" name="nim" value="<%=nim%>"></td>
</tr>

<tr>
<td>Nama</td>
<td><input type="text" name="nama" value="<%=nama%>"></td>
</tr>

<tr>
<td>Jurusan</td>
<td><input type="text" name="jurusan" value="<%=jurusan%>"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Update"></td>
</tr>

</table>

</form>

</center>

</body>
</html>