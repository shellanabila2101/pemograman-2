<%@page import="java.util.ArrayList"%>
<%@page import="model.Nilai"%>

<!DOCTYPE html>
<html>

<head>

<title>Cetak Nilai</title>

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

<h1>LAPORAN NILAI MAHASISWA</h1>

<button onclick="window.print()">
Cetak Laporan
</button>

<br><br>

<table border="1">

<tr>

<th>No</th>
<th>NIM</th>
<th>Nama</th>
<th>Mata Kuliah</th>
<th>Nilai</th>
<th>Grade</th>

</tr>

<%

ArrayList<Nilai> dataNilai =
(ArrayList<Nilai>)
session.getAttribute("dataNilai");

if(dataNilai != null){

    int no = 1;

    for(Nilai n : dataNilai){

%>

<tr>

<td><%= no++ %></td>

<td><%= n.getNim() %></td>

<td><%= n.getNama() %></td>

<td><%= n.getMatkul() %></td>

<td><%= n.getNilai() %></td>

<td><%= n.getGrade() %></td>

</tr>

<%

    }

}

%>

</table>

</center>

</body>

</html>