<%@page import="java.util.ArrayList"%>

<%

int index = Integer.parseInt(request.getParameter("index"));

String nim = request.getParameter("nim");
String nama = request.getParameter("nama");
String jurusan = request.getParameter("jurusan");

ArrayList dataMhs = (ArrayList)session.getAttribute("dataMhs");

dataMhs.set(index, nim);
dataMhs.set(index+1, nama);
dataMhs.set(index+2, jurusan);

session.setAttribute("dataMhs", dataMhs);

response.sendRedirect("dataMahasiswa.jsp");

%>