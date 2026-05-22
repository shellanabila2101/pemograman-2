<%@page import="java.util.ArrayList"%>

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

ArrayList dataMhs = (ArrayList)session.getAttribute("dataMhs");

if(dataMhs != null){

int no = 1;

for(int i=0; i<dataMhs.size(); i+=3){

%>

<tr>

<td><%= no++ %></td>

<td><%= dataMhs.get(i) %></td>

<td><%= dataMhs.get(i+1) %></td>

<td><%= dataMhs.get(i+2) %></td>

<td>

<a href="editMahasiswa.jsp?index=<%=i%>">
<button class="edit-btn">Edit</button>
</a>

<a href="hapusMahasiswa.jsp?index=<%=i%>">
<button class="hapus-btn">Hapus</button>
</a>

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