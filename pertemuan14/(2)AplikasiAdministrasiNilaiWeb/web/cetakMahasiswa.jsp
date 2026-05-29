<%@page import="java.util.ArrayList"%>
<%@page import="model.mahasiswa"%>

<!DOCTYPE html>
<html>

<head>

<title>Cetak Mahasiswa</title>

<link rel="stylesheet" href="style.css">

<style>

@media print{

button{
display:none;
}

}

</style>

</head>

<body>

<center>

<h1>LAPORAN DATA MAHASISWA</h1>

<button onclick="window.print()">
Cetak Laporan
</button>

<br><br>

<table border="1">

<tr>

<th>No</th>
<th>NIM</th>
<th>Nama</th>
<th>Jurusan</th>

</tr>

<%

ArrayList<mahasiswa> dataMhs =
(ArrayList<mahasiswa>)
session.getAttribute("dataMhs");

if(dataMhs != null){

int no = 1;

for(mahasiswa mhs : dataMhs){

%>

<tr>

<td><%= no++ %></td>

<td><%= mhs.getNim() %></td>

<td><%= mhs.getNama() %></td>

<td><%= mhs.getJurusan() %></td>

</tr>

<%

}

}

%>

</table>

</center>

</body>

</html>