<%@page import="java.util.ArrayList"%>
<%@page import="model.mahasiswa"%>

<%

if(session.getAttribute("login")==null){

    response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>

<head>

<title>Data Mahasiswa</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<div class="container">

<center>

<h1>DATA MAHASISWA</h1>

<%@ include file="menu.jsp" %>

<table border="1">

<tr>

<th>No</th>
<th>NIM</th>
<th>Nama</th>
<th>Jurusan</th>
<th>Aksi</th>

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

<td>

<button class="edit-btn">
Edit
</button>

<button class="hapus-btn">
Hapus
</button>

</td>

</tr>

<%

    }

}

%>

</table>

</center>

</div>

</body>

</html>