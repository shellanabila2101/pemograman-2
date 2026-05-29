<%@page import="java.util.ArrayList"%>
<%@page import="model.Nilai"%>

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

</div>

</body>

</html>