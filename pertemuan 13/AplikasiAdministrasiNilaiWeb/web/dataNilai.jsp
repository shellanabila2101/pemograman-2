<%@page import="java.util.ArrayList"%>

<%

if(session.getAttribute("login")==null){

response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>
<head>

<title>Data Nilai</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<div class="container">

<center>

<h1>DATA NILAI MAHASISWA</h1>

<%@ include file="menu.jsp" %>

<table border="1">

<tr>

<th>NIM</th>
<th>Nama</th>
<th>Mata Kuliah</th>
<th>Nilai</th>
<th>Grade</th>

</tr>

<%

ArrayList dataNilai = (ArrayList)session.getAttribute("dataNilai");

if(dataNilai != null){

for(int i=0; i<dataNilai.size(); i+=5){

%>

<tr>

<td><%= dataNilai.get(i) %></td>
<td><%= dataNilai.get(i+1) %></td>
<td><%= dataNilai.get(i+2) %></td>
<td><%= dataNilai.get(i+3) %></td>
<td><%= dataNilai.get(i+4) %></td>

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